package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import org.junit.Assert;
import packages.pageObject.CommonPage;
import packages.pageObject.Home;
import packages.pageObject.Profile;
import packages.pageObject.ProfileConfig;
import packages.utils.MailHandler;
import packages.utils.PeopleHubMySQL;

import java.sql.SQLException;

public class ProfileSteps {
    @Steps
    private Profile profile;

    @Steps
    private PeopleHubMySQL peopleHubMySQL;

    @Steps
    private ProfileConfig profileConfig;

    @Steps
    private Home home;

    @Steps
    private CommonPage commonPage;

    @Then("^se le solicita su estado civil$")
    public void se_le_solicita_su_estado_civil() {
        profile.promptsForCivilStatus();
    }

    @And("^selecciona estado civil (.*)$")
    public void seleccionaEstadoCivilEstadocivil(String estadoCivil) {
        profile.selectCivilStatus(estadoCivil);
    }

    @And("^el usuario finaliza la configuracion$")
    public void elUsuarioFinalizaLaConfiguracion() {
        profile.finish();
    }

    @Then("^se visualiza el estado civil (.*) en perfil y se persiste en PeopleHub$")
    public void seVisualizaElEstadoCivilEstadocivilEnPerfil(String estadoCivil) {
        profile.seePersonalInfo();
        profile.showsCivilStatus(estadoCivil);
        Assert.assertTrue(PeopleHubMySQL.getMaritalStatus() != null || PeopleHubMySQL.getMaritalStatus() != "");
    }

    @Given("^el usuario no declaro su estado civil$")
    public void elUsuarioNoDeclaroSuEstadoCivil() {
        try {
            peopleHubMySQL.resetMaritalStatus();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @And("^el usuario accede a configuracion$")
    public void elUsuarioAccedeAConfiguracion() {
        profile.goToConfiguration();
    }

    @When("^se intenta cambiar la clave numerica$")
    public void seIntentaCambiarLaClaveNumerica() {
        profileConfig.changePasscode();
    }

    @Then("^se valida el cambio de clave$")
    public void seValidaElCambioDeClave() {
        profileConfig.passcodeChanged();
    }

    @Then("^avisa que las reglas no son cumplidas$")
    public void avisaQueLasReglasNoSonCumplidas() {
        profileConfig.passcodeRulesNotMet();
    }

    @When("^se intenta desvincular el dispositivo$")
    public void seIntentaDesvincularElDispositivo() {
        profileConfig.unlinkDevice();
    }

    @And("^el usuario confirma la desvinculacion$")
    public void elUsuarioConfirmaLaDesvinculacion() {
        profileConfig.confirmUnlinkDevice();
    }

    @Then("^el dispositivo se desvincula$")
    public void elDispositivoSeDesvincula() {
        profileConfig.showsReLinkDevice();
    }

    @When("^se intenta dar de baja la cuenta$")
    public void seIntentaDarDeBajaLaCuenta() {
        profileConfig.closeAccount();
    }

    @And("^se cancela la baja$")
    public void seCancelaLaBaja() {
        profileConfig.cancelAccountClosing();
    }

    @Then("^se visualiza el perfil$")
    public void seVisualizaElPerfil() {
        profile.isOnProfile();
    }

    @Then("^no avanza a confirmacion de clave$")
    public void noAvanzaAConfirmacionDeClave() {
        profileConfig.passcodeRulesNotMet();
    }

    @And("^ingresa passcode que contiene DNI del usuario$")
    public void ingresaPasscodeQueContieneDNIDelUsuario() {
        profile.enterPasscode(MailHandler.getJWTClaimsFromMagicLink().getIdNumber().substring(0, 6));
    }

    @Given("^el usuario selecciona Ver Mis datos$")
    public void seleccionaVerMisDatos() {
        home.goToProfile();
    }

    @When("^presiona el boton Cambiar Alias$")
    public void presionarCambiarAlias() {
        profile.pressChangeAlias();

    }

    @And("^hace click en Continuar$")
    public void pressContinue() {
        commonPage.pressContinue();
    }

    @Then("^el usuario visualiza su nuevo alias (.*)$")
    public void validateAlias(String alias) {
        profile.validateAlias(alias);
    }

    @Then("^el sistema muestra mensaje Error al cambiar el alias$")
    public void validateStatus(String alias) {
        profile.validateAlias(alias);
    }

    @And("^presiona compartir datos$")
    public void presionaCompartirDatos() {
        profile.shareInfo();
    }

}
