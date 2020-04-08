package packages.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.mail.imap.protocol.FLAGS;
import com.typesafe.config.ConfigException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import packages.auth.JwtHandler;
import packages.models.accessToken.AccessTokenJWT;

import javax.mail.*;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.util.*;

public class MailHandler {


    private static Properties props;

    private static String magicLinkToken;

    private static String registeredMail;

    public static void setMagicLinkToken(String magicLinkToken) {
        MailHandler.magicLinkToken = magicLinkToken;
    }

    static {
        props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", 465);
    }


    public static String getMailWithSubject(String mail, String pass, String subject) throws MessagingException, IOException {
        Session session = Session.getDefaultInstance(props, null);
        Store store = session.getStore("imaps");
        store.connect("smtp.gmail.com", mail, pass);
        Folder inbox = store.getFolder("Inbox");
        inbox.open(Folder.READ_WRITE);
        Message[] messages = inbox.getMessages();
        try {
            Message message = Arrays.stream(messages).filter(it -> {
                try {
                    return it.getSubject().isEmpty();
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                return false;
            }).findFirst().get();
            moveMail(message, inbox, store);
            deleteAllEmails(inbox);
            return getTextFromMessage(message);
        } catch (NoSuchElementException | NullPointerException e) {
            return getMailWithSubject(mail, pass, subject);
        }
    }

    public static String getMagicLinkFromMail(String mail, String password, String subject) throws IOException, MessagingException {
        String message = getMailWithSubject(mail, password, subject);
        int beginIndex = message.indexOf("<a href=\"https://open");
        String html = message.substring(beginIndex);
        Document doc = Jsoup.parse(html);
        Element link = doc.select("a").first();
        String linkHref = link.attr("href");
        magicLinkToken = getTokenFromMagicLink(linkHref);
        return linkHref;
    }

    public static String getUnregisteredMagicLink(String mail, String password) throws IOException, MessagingException {
        return getMagicLinkFromMail(mail, password, "Registro en BDS");
    }

    public static String getLinkAccountMagicLink(String mail, String password) throws IOException, MessagingException {
            registeredMail = mail;
            //return getMagicLinkFromMail(mail, password, "Verificación"); TODO: DESCOMENTAR CUANDO SE FIXEE LO DEL MAIL
        return getMagicLinkFromMail(mail, password, null);
    }


    public static String getRegisteredMail() {
        return registeredMail;
    }

    private static String getTextFromMessage(Message message) throws MessagingException, IOException {
        String result = "";
        if (message.isMimeType("text/plain")) {
            result = message.getContent().toString();
        } else if (message.isMimeType("multipart/*")) {
            MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
            result = getTextFromMimeMultipart(mimeMultipart);
        }
        return result;
    }

    private static String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws MessagingException, IOException {
        String result = "";
        int count = mimeMultipart.getCount();
        for (int i = 0; i < count; i++) {
            BodyPart bodyPart = mimeMultipart.getBodyPart(i);
            if (bodyPart.isMimeType("text/plain")) {
                result = result + "\n" + bodyPart.getContent();
                break;
            } else if (bodyPart.isMimeType("text/html")) {
                String html = (String) bodyPart.getContent();
                result = result + "\n" + html;
            } else if (bodyPart.getContent() instanceof MimeMultipart) {
                result = result + getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent());
            }
        }
        return result;
    }

    private static boolean unread(Message message) throws MessagingException {
        return !message.getFlags().contains(Flags.Flag.SEEN);
    }

    private static void deleteAllEmails(Folder folder) throws MessagingException {
        Message[] messages = folder.getMessages();
        Arrays.stream(messages).forEach(message -> {
            try {
                deleteEmail(message);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        });
    }

    public static void emptyInbox(String mail, String pass) throws MessagingException {
        Session session = Session.getDefaultInstance(props, null);
        Store store = null;
        store = session.getStore("imaps");
        store.connect("smtp.gmail.com", mail, pass);
        Folder inbox = null;
        inbox = store.getFolder("inbox");
        inbox.open(Folder.READ_WRITE);
        deleteAllEmails(inbox);
    }

    private static void deleteEmail(Message message) throws MessagingException {
        message.setFlag(FLAGS.Flag.DELETED, true);
    }

    private static void moveMail(Message message, Folder inbox, Store store) throws MessagingException {
        List<Message> tempList = new ArrayList<>();
        tempList.add(message);
        inbox.copyMessages(tempList.toArray(new Message[tempList.size()]), store.getFolder("framework"));
    }

    public static String getTokenFromMagicLink(String magicLink) {
        return magicLink.substring(magicLink.indexOf("=") + 1);
    }

    public static String getMagicLinkToken() {
        return magicLinkToken;
    }

    public static String getKeyCloakUserId() {
        DecodedJWT decodedJWT = JWT.decode(getMagicLinkToken());
        return decodedJWT.getClaim("userId").asString();
    }

    public static String getTokenIssuer() {
        DecodedJWT decodedJWT = JWT.decode(getMagicLinkToken());
        return decodedJWT.getIssuer();
    }

    public static String getUnregisteredMail(String mail, String pass) throws IOException, MessagingException {
        return getMailWithSubject(mail, pass, "Registro en BDS");

    }

    public static AccessTokenJWT getJWTClaimsFromMagicLink() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        try {
            return mapper.readValue(JwtHandler.getBodyFromJwt(magicLinkToken), AccessTokenJWT.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Integer getCoreClientId() {
        return Integer.parseInt(JWT.decode(getMagicLinkToken()).getClaim("coreClientId").asString());
    }


}

