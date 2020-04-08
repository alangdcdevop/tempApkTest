package packages.auth;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import net.thucydides.core.annotations.Step;
import org.apache.commons.codec.binary.Base64;
import packages.utils.DriverActions;
import packages.utils.MailHandler;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.UUID;

public class JwtHandler {


    private Algorithm algo = Algorithm.HMAC256("secreeeet"); //TODO: SACAR HARDCODING
    private Algorithm rsaAlgorithm;

    private String baseUrl;

    private String requestId;

    public JwtHandler() {
    }

    @Step
    public void getLinkDeviceMagicLink(String mail, String pass) throws IOException, MessagingException {
        String url = MailHandler.getLinkAccountMagicLink(mail, pass);
        System.out.println("Vinculando dispositivo con cuenta: " + mail);
        DriverActions.get(url);
    }

    @Step
    public void getCompleteSignUpMagicLink(String mail) {
        baseUrl = System.getProperty("magicLinkBaseUrl");
        String url = baseUrl
                + "/complete-signup?token="
                + getConfirmLinkAccountAccessToken(mail);
        DriverActions.get(url);
    }


    public String getToken(String mail) {
        String deviceId = System.getProperty("deviceId");
        System.out.println("Creating token with device id: " + deviceId);
        String token = JWT.create()
                .withClaim("email", mail)
                .withClaim("deviceId", deviceId)
                .withClaim("name", "SEBASTIAN")
                .sign(algo);
        return token;
    }

    public String getTokenForRandomDevice(String mail) {
        String deviceId = UUID.randomUUID().toString();
        System.out.println("Creating token with device id: " + deviceId);
        String token = JWT.create()
                .withClaim("email", mail)
                .withClaim("deviceId", deviceId)
                .withClaim("name", "SEBASTIAN")
                .sign(algo);
        return token;
    }

    @Step
    public void getLinkFromAnotherDeviceMagicLink(String mail) {
        baseUrl = System.getProperty("magicLinkBaseUrl");
        String url = baseUrl
                + "/link-account?token="
                + getTokenForRandomDevice(mail);
        DriverActions.get(url);
    }

    public void getVerifyDeviceMagicLink(String mail) {
        baseUrl = System.getProperty("magicLinkBaseUrl");
        String url = baseUrl
                + "/verify-email?token="
                + getToken(mail);
        DriverActions.get(url);

    }

    public String getConfirmLinkAccountRefreshToken(String mail) {
        String token = JWT.create()
                .withKeyId("Fp1q6TKhs9TsWY6hjLwLAZMK0Mb5v8mcuk6idC2vAnA")
                .withClaim("exp", System.currentTimeMillis() + 100000)
                .withClaim("nbf", 0)
                .withClaim("iat", System.currentTimeMillis())
                .withClaim("iss", "http://keycloak-dev-http.keycloak-dev.svc.cluster.local/auth/realms/bds-dev")
                .withClaim("aud", "http://keycloak-dev-http.keycloak-dev.svc.cluster.local/auth/realms/bds-dev")
                .withClaim("sub", UUID.randomUUID().toString())
                .withClaim("typ", "Refresh")
                .withClaim("azp", "clients-auth-signup")
                .withClaim("auth_time", 0)
                .withClaim("session_state", UUID.randomUUID().toString())
                .withClaim("given_name", "JUAN PABLO")
                .withClaim("userId", "0d685e97-6c53-4e65-999b-040cfdc95dc4")
                .withClaim("deviceId", System.getProperty("deviceId"))
                .withClaim("family_name", "GARCIA DALOLLA")
                .sign(rsaAlgorithm);
        return token;
    }

    public String getConfirmLinkAccountAccessToken(String mail) {
        baseUrl = System.getProperty("magicLinkBaseUrl");
        String token = JWT.create()
                .withKeyId("Fp1q6TKhs9TsWY6hjLwLAZMK0Mb5v8mcuk6idC2vAnA")
                .withClaim("jti", UUID.randomUUID().toString())
                .withClaim("exp", System.currentTimeMillis() + 100000)
                .withClaim("nbf", 0)
                .withClaim("iat", System.currentTimeMillis())
                .withClaim("iss", "http://keycloak-dev-http.keycloak-dev.svc.cluster.local/auth/realms/bds-dev")
                .withClaim("sub", UUID.randomUUID().toString())
                .withClaim("typ", "Bearer")
                .withClaim("azp", "clients-auth-signup")
                .withClaim("auth_time", 0)
                .withClaim("session_state", "0dc21e55-0244-4f14-85cc-218bd70fd1cb")
                .withClaim("coreClientId", "1102")
                .withClaim("name", "JUAN PABLO GARCIA DALOLLA")
                .withClaim("preferred_username", mail)
                .withClaim("given_name", "JUAN PABLO")
                .withClaim("idNumber", "25385206    ")
                .withClaim("userId", "0dc21e55-0244-4f14-85cc-218bd70fd1cb")
                .withClaim("family_name", "GARCIA DALOLLA")
                .withClaim("deviceId", System.getProperty("deviceId"))
                .withClaim("email", mail)
                .sign(rsaAlgorithm);
        return token;
    }


    public static String getBodyFromJwt(String jwtToken) {
        String[] split_string = jwtToken.split("\\.");
        String base64EncodedHeader = split_string[0];
        String base64EncodedBody = split_string[1];
        String base64EncodedSignature = split_string[2];

        Base64 base64Url = new Base64(true);
        return new String(base64Url.decode(base64EncodedBody));
    }
}
