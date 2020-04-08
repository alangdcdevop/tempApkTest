package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Institutional;

public class FooterSteps {

    @Steps
    private Institutional institutional;

    @When("^el usuario presiona en codigo de etica$")
    public void pressCodeOfEthics() {
        institutional.pressCodeOfEthics();
    }

    @When("^el usuario hace click en comparacion de comisiones$")
    public void pressCommissionComparison() {
        institutional.pressCommissionComparison();
    }

    @When("^el usuario hace click en identificacion de PEPs$")
    public void pressPEPIdentification() {
        institutional.pressPEPIdentification();
    }

    @When("^el usuario hace click en terminos y condiciones$")
    public void pressTermsAndConditions() {
        institutional.pressTermsAndConditions();
    }

    @When("^el usuario hace click en regimen de transparencia$")
    public void pressMenuTransparencyRegime() {
        institutional.pressMenuTransparencyRegime();
    }

    @When("^el usuario hace click en prevencion lavado de dinero$")
    public void pressMoneyLaunderingPrevention() {
        institutional.pressMoneyLaunderingPrevention();
    }

    @When("^el usuario hace click en defensa del consumidor$")
    public void pressConsumerDefense() {
        institutional.pressConsumerDefense();
    }

    @When("^el usuario hace click en el logo de usuarios financieros$")
    public void pressFinancialUsers() {
        institutional.pressFinancialUsers();
    }

    @When("^el usuario hace click en portal del cliente bancario$")
    public void pressBankCustomerPortal() {
        institutional.pressBankCustomerPortal();
    }

    @When("^el usuario hace click en agente adherente MAE$")
    public void pressMaeBondingAgent() {
        institutional.pressMaeBondingAgent();
    }

    @When("^el usuario hace click en FATCA - crs$")
    public void pressFATCA() {
        institutional.pressFATCA();
    }

    @When("^el usuario hace click en politica de cookies$")
    public void pressCookiesPolicy() {
        institutional.pressCookiesPolicy();
    }

    @When("^el usuario hace click en censo agropecuario$")
    public void pressAgriculturalCensus() {
        institutional.pressAgriculturalCensus();
    }

    @When("^el usuario hace click en precios y comisiones$")
    public void pressPriceAndCommissions() {
        institutional.pressPriceAndCommissions();
    }

    @When("^el usuario hace click en linkedin$")
    public void pressLinkedin() {
        institutional.pressLinkedin();
    }

    @When("^el usuario presiona informacion al usuario financiero$")
    public void pressFinancialUserInformation() {
        institutional.pressFinancialUserInformation();
    }

    @When("^el usuario hace click en proteccion de datos personales$")
    public void pressPersonalDataProtection() {
        institutional.pressPersonalDataProtection();
    }

    @And("^el usuario hace click en direccion nacional de proteccion de datos personales$")
    public void pressNationalAddressPersonalDataProtection() {
        institutional.pressNationalAddressPersonalDataProtection();
    }

    @Then("^el usuario hace click en Cierre de cuentas$")
    public void pressClosingAccounts() {
        institutional.pressClosingAccounts();
    }

    @When("el usuario hace click en el logo de banco del sol$")
    public void pressBDSLogo() {
        institutional.pressBDSLogo();
    }

    @Then("el usuario visualiza la pantalla (.*)$")
    public void validateCorrectPage(String actualURL) {
        institutional.validateCorrectPage(actualURL);
    }

    @And("el usuario tapea el menu$")
    public void pressMenu() {
        institutional.pressMenu();
    }

    @When("el usuario hace click en quienes somos$")
    public void pressAboutUs() {
        institutional.pressAboutUs();
    }

    @When("el usuario presiona productos$")
    public void pressProducts() {
        institutional.pressProducts();
    }

    @When("el usuario hace click en contacto$")
    public void pressContact() {
        institutional.pressContact();
    }
}
