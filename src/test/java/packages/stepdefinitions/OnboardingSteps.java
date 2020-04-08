package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.auth.JwtHandler;
import packages.pageObject.CommonPage;
import packages.pageObject.EnterEmail;
import packages.pageObject.Onboarding;
import packages.utils.MailHandler;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

public class OnboardingSteps {
    @Steps
    private Onboarding onboarding;

    @Steps
    private EnterEmail enterEmail;

    @Steps
    private JwtHandler jwtHandler;

    @Given("^el back end acepta registraciones$")
    public void backendAceptaRegistraciones() {
        onboarding.setDeviceId();
        onboarding.setMagicLinkBaseUrl();
    }

    @When("^el usuario intenta registrarse$")
    public void usuarioIntentaRegistrarse() {
        onboarding.register();
    }

    @And("^el usuario comienza el proceso$")
    public void usuarioComienzaProceso() {
        onboarding.understood();
    }

    @And("^el usuario ingresa el correo (.*)$")
    public void usuarioIngresaCorreo(String mail) {

        enterEmail.enterMail(mail);
    }

    @And("^el usuario confirma el correo$")
    public void usuarioConfirmaCorreo() {
        enterEmail.confirmEmail();
    }

    @Then("^se informa que el email es invalido$")
    public void mensajeMailInvalido() {
        enterEmail.showsInvalidMail();
    }


    @And("^el usuario confirma el MagicLink con correo (.*)$")
    public void elUsuarioConfirmaElMagicLinkConCorreoEmailGmailCom(String mail) {
        jwtHandler.getVerifyDeviceMagicLink(CommonPage.addSquadToEmailAddress(mail));
    }


    @And("^el usuario acepta los requisitos de identificacion$")
    public void elUsuarioAceptaLosRequisitosDeIdentificacion() {
        onboarding.understood();
    }


    @And("^el usuario saca una selfie$")
    public void elUsuarioSacaUnaSelfie() {
        onboarding.takeSelfie();
    }

    @Then("^se visualiza la selfie$")
    public void seVisualizaLaSelfie() {
        onboarding.selfieIsShown();
    }

    @And("^el usuario confirma la selfie$")
    public void elUsuarioConfirmaLaSelfie() {
        onboarding.confirmSelfie();
    }

    @And("^el usuario acepta los requisitos de video$")
    public void elUsuarioAceptaLosRequisitosDeVideo() {
        onboarding.confirmVideoRequirements();
    }

    @And("^el usuario confirma el video$")
    public void elUsuarioConfirmaElVideo() {
        onboarding.confirmVideo();
    }

    @And("^el usuario confirma los requisitos de la foto de DNI$")
    public void elUsuarioConfirmaLosRequisitosDeLaFotoDeDNI() {
        onboarding.understood();
    }

    @And("^el usuario espera (\\d+) minutos$")
    public void elUsuarioEsperaMinutos(int arg0) {
        onboarding.waitForAppTimeout(arg0);
    }

    @Then("^se visualiza la pantalla de inicio$")
    public void seVisualizaLaPantallaDeInicio() {
        onboarding.isOnWelcome();
    }

    @And("^el usuario confirma desde otro dispositivo el MagicLink con correo (.*)$")
    public void elUsuarioConfirmaDesdeOtroDispositivoElMagicLinkConCorreoEmailGmailCom(String mail) {
        onboarding.setMagicLinkBaseUrl();
        jwtHandler.getLinkFromAnotherDeviceMagicLink(mail);
    }

    @Then("^se visualiza mensaje de dispositivo invalido$")
    public void seVisualizaMensajeDeDispositivoInvalido() {
        onboarding.showsInvalidDevice();
    }

    @And("^el usuario saca la foto del frente del DNI$")
    public void elUsuarioSacaLaFotoDelFrenteDelDNI() {
        onboarding.takeDNIFrontPicture();
    }

    @And("^ingresa un mail no registrado$")
    public void ingresaUnMailNoRegistrado() {
        int randomNum = ThreadLocalRandom.current().nextInt(1, 1000 + 1);
        String unregisteredEmail = "bdsolqe+" + randomNum + "@gmail.com";
        enterEmail.enterMail(unregisteredEmail);
        System.setProperty("unregisteredEmail", unregisteredEmail);

    }

    @And("^el usuario visualiza mensaje de mail enviado$")
    public void elUsuarioVisualizaMensajeDeMailEnviado() {
        onboarding.emailSent();
    }

    @And("^accede al MagicLink con mail no registrado$")
    public void accedeAlMagicLinkConMailNoRegistrado() {
        onboarding.accessUnregisteredMagicLink();
    }

    @Given("^el usuario ingresa a la pantalla ayuda no loggeado$")
    public void pressHelpNoLoggin() {
        onboarding.pressHelpNoLoggin();
    }

    @And("^la creacion no fue completada$")
    public void laCreacionNoFueCompletada() {
        String uuid = UUID.randomUUID().toString();
        String mail = "bdsolqe+" + uuid + "@gmail.com";
        System.setProperty("registeredEmail", mail);

    }

    @Then("^recibe un mail indicando que ya esta registrado con (.*) y password (.*)$")
    public void recibeUnMailIndicandoQueYaEstaRegistrado(String mail, String pass) {
        try {
            MailHandler.getMailWithSubject(mail, pass, "Registro en BDS").contains("Ya estás registrado");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @And("^el usuario ingresa correo no registrado (.*)$")
    public void elUsuarioIngresaCorreoNoRegistradoBdsolqeGmailCom(String mail) {
        enterEmail.enterMail(CommonPage.randomizeMail(mail));
    }

}
