package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import net.thucydides.core.annotations.Steps;
import org.junit.Assert;
import org.junit.internal.runners.statements.Fail;
import packages.auth.JwtHandler;
import packages.models.termsAndConditions.GetLatestTermsAndConditionsResponse;
import packages.pageObject.*;
import packages.utils.*;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.UUID;

import static packages.auth.ClientsAuth.getActionToken;
import static packages.utils.ClientsAuth.*;

public class LoginSteps {

    private static String registeredMail;
    private String termsAndConditionsBaseUrl = "https://api-" + System.getProperty("testing.enviroment") + ".bdsdigital.com.ar";
    private String latestPath = "/terms/latest";
    private static String documentUrl = "https://" + UUID.randomUUID().toString() + ".com";
    private static String termsAndConditionsOriginalDocUrl;

    @Steps
    private Onboarding onboarding;

    @Steps
    private Login login;

    @Steps
    private Home home;

    @Steps
    private JwtHandler jwtHandler;

    @Steps
    private Profile profile;


    @Given("^existe el usuario con passcode (.*)$")
    public void existeElUsuarioConPasscode(String passcode) throws MessagingException {
        //MailHandler.emptyInbox(CommonPage.addSquadToEmailAddress("bdsolqe@gmail.com"), "Bdsol123");
        onboarding.setDeviceId();
        onboarding.setMagicLinkBaseUrl();
    }

    @And("^el usuario ingresa a la pantalla de login$")
    public void elUsuarioIngresaALaPantallaDeLogin() {
        onboarding.login();
    }

    @When("^ingresa el passcode (.*)$")
    public void ingresaElPasscode(String passcode) {
        login.enterPasscode(passcode);
    }

    @Then("^se visualiza la home$")
    public void seVisualizaLaHome() {
        home.isOnHome();
    }

    @Given("^el dispositivo no se encuentra vinculado$")
    public void elDispositivoNoSeEncuentraVinculado() {

    }

    @And("^accedo por magic link con mail (.*) y password (.*)$")
    public void accedoPorMagicLinkConMail(String mail, String pass) throws IOException, MessagingException {
        registeredMail = CommonPage.addSquadToEmailAddress(mail);
        jwtHandler.getLinkDeviceMagicLink(CommonPage.addSquadToEmailAddress(mail), pass);
    }

    @Then("^se visualiza mensaje de limite de dispositivos vinculados$")
    public void seVisualizaMensajeDeLimiteDeDispositivosVinculados() {
        login.showsDeviceLimitBreached();
    }

    @And("^el usuario decide ingresar por huella dactilar$")
    public void elUsuarioDecideIngresarPorHuellaDactilar() {
        login.enableFingerprint();
    }

    @Given("^el usuario se desloguea$")
    public void elUsuarioSeDesloguea() {
        home.goToProfile();
        profile.logout();
    }

    @Then("^recibe un mail con informacion de como continuar el proceso$")
    public void recibeUnMailConInformacionDeComoContinuarElProceso() {
        onboarding.getUserNotRegisteredEmail();
    }

    @And("^el usuario acepta terminos y condiciones$")
    public void elUsuarioAceptaTerminosYCondiciones() {
        login.acceptTermsAndConditions();
    }

    public static String getMail() {
        return registeredMail;
    }


    @And("^el usuario ya posee (\\d+) dispositivos vinculados$")
    public void elUsuarioYaPoseeDosDispositivosVinculados(int cantidad) {
        PeopleHubMySQL.unlinkDevices();
        PeopleHubMySQL.linkRandomDevices(cantidad);
    }

    @And("^el usuario ya posee un dispositivo vinculado$")
    public void elUsuarioYaPoseeUnDispositivoVinculado() {
        String mail = LoginSteps.getMail();
        System.out.println("Desvinculando dispositivo con cuenta: " + mail);
        RestAssured.given()
                .contentType(ContentType.JSON)
                .body("{\"deviceId\":\"" + System.getProperty("deviceId") + "\"}")
                .post(MailHandler.getTokenIssuer() + "/credentials/" + MailHandler.getKeyCloakUserId() + "/unlink-account")
                .then()
                .assertThat()
                .statusCode(200);
    }

    @Then("^se visualiza la pantalla de login$")
    public void seVisualizaLaPantallaDeLogin() {
        login.keyboardIsDisplayed();
    }

    @And("^acepta reintentar$")
    public void aceptaReintentar() {
        login.continueToLastAttempt();
    }

    @And("^el usuario no acepto terminos y condiciones$")
    public void elUsuarioNoAceptoTerminosYCondiciones() {
        try {
            PeopleHubMySQL.deleteTermsAccepted(MailHandler.getKeyCloakUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Given("^existe el usuario con mail (.*), coreId (.*), primer nombre (.*), apellido (.*), fecha de nacimiento (.*), DNI (.*), CUIL (.*), altura de calle (.*), codigo postal (.*), passcode (.*)$")
    public void existeElUsuarioConMailCoreIdPrimerNombreApellidoFechaDeNacimientoDNIAlturaDeCallePasscode(String mail, String coreId, String nombre, String apellido, String fecNac, String dni, String cuil, String altura, String codigoPostal, String passcode) {
        String keycloakUserId = createUser(mail, coreId, nombre, apellido, fecNac, dni, altura, passcode);
        PeopleHubService.createUser(keycloakUserId, mail, coreId, nombre, apellido, fecNac, dni, altura, cuil, codigoPostal);
    } //TODO: ESTE METODO QUEDARA DEPRECADO CON LA VERSION MVP DE KEYCLOAK


    @Given("^voy a google$")
    public void voyAGoogle() {
        DriverActions.get("https://www.google.com.ar");
    }

    @Then("^se visualiza listado de dispositivos vinculados$")
    public void seVisualizaListadoDeDispositivosVinculados() {

    }

    @And("^se agrega una nueva version de terminos y condiciones$")
    public void seAgregaUnaNuevaVersionDeTerminosYCondiciones() {
        termsAndConditionsOriginalDocUrl = RestAssured.given()
                .log().all()
                .get(termsAndConditionsBaseUrl + latestPath)
                .getBody()
                .as(GetLatestTermsAndConditionsResponse.class)
                .getUrl();

        System.out.println("URL de Terminos y Condiciones: " + documentUrl);
        RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{\"url\":\"" + termsAndConditionsOriginalDocUrl + "\"}")
                .post(termsAndConditionsBaseUrl + latestPath)
                .then()
                .statusCode(201);

    }

    @Then("^se visualiza la home y se restaura la version anterior de terminos y condiciones$")
    public void seVisualizaLaHomeYSeRestauraLaVersionAnteriorDeTerminosYCondiciones() {
        home.dismissWarning();
        home.isOnHome();

        RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{\"url\":\"" + termsAndConditionsOriginalDocUrl + "\"}")
                .post(termsAndConditionsBaseUrl + latestPath)
                .then()
                .statusCode(201);

        // MongoDB.deleteTestTerms(documentUrl);


        try {
            PeopleHubMySQL.deleteTermsAccepted(MailHandler.getKeyCloakUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @And("^accedo por magic link con mail (.*)$")
    public void accedoPorMagicLinkConMail(String mail) {
        String magicLink=System.getProperty("magicLinkBaseUrl")+"/link-account?token="+getActionToken(mail);
        System.out.println("LINKING WITH MAGIC LINK: "+magicLink);
        DriverActions.get(magicLink);
    }

    @And("^accedo a la app por magic link con mail (.*) y contraseña (.*)$")
    public void accedoALaAppPorMagicLinkConMail(String mail, String pass) {
        try {
            //mail=CommonPage.addSquadToEmailAddress(mail);
            String magicLink=MailHandler.getLinkAccountMagicLink(mail,pass);
            System.out.println("VINCULANDO CON MAGIC LINK: "+magicLink);
            DriverActions.get(magicLink);
        } catch (IOException | MessagingException e) {
            Assert.fail(e.getMessage());
        }

    }
}
