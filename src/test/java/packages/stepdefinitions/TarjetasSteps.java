package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Home;
import packages.pageObject.Tarjetas;

public class TarjetasSteps {

    @Steps
    private Tarjetas tarjetas;

    @Steps
    private Home home;

    @Given("^el usuario tapea tarjetas$")
    public void pressCard() {
        home.pressCard();
    }

    @When("^el usuario tapea bloquear$")
    public void pressTheftOrLost() {
        tarjetas.pressTheftOrLost();
    }

    @Then("^el usuario selecciona una opcion de direccion$")
    public void selectAnAddress() {
        tarjetas.selectAnAddress();
    }

    @And("^el usuario presiona continuar$")
    public void pressContinue() {
        tarjetas.pressContinue();
    }

    @Then("^el usuario visualiza preguntas contextualizadas de tarjetas$")
    public void validateCardQuestions() {
        tarjetas.validateCardQuestions();
    }

    @When("^el usuario tapea cerrar en la pantalla de direccion$")
    public void closeScreenDirection() {
        tarjetas.closeScreenDirection();
    }

    @Then("^el usuario visualiza un modal para confirmar la salida$")
    public void confirmExit() {
        tarjetas.confirmExit();
    }

    @And("^el usuario tapea no reimprimir$")
    public void pressNotReprint() {
        tarjetas.pressNotReprint();
    }

    @Then("^el usuario visualiza la pantalla de tarjetas$")
    public void validateCardScreen() {
        tarjetas.validateCardScreen();
    }

    @And("^el usuario tapea volver$")
    public void pressBackButton() {
        tarjetas.pressBackButton();
    }

    @Then("^el usuario visualiza el flujo de reimpresion$")
    public void validateNotPrintFlow() {
        tarjetas.validateNotPrintFlow();
    }

    @And("^el usuario tapea reimprimir$")
    public void pressRePrint() {
        tarjetas.pressRePrint();
    }

    @Then("^el usuario tapea cerrar en la pantalla de exito de solicitud$")
    public void pressCloseSuccessRequest() {
        tarjetas.pressCloseSuccessRequest();
    }

    @Then("^el usuario tapea finalizar en la pantalla de exito de solicitud$")
    public void pressFinishSuccessRequest() {
        tarjetas.pressFinishSuccessRequest();
    }

    @And("^el usuario visualiza una pantalla para confirmar$")
    public void validateConfirmScreen() {
        tarjetas.validateConfirmScreen();
    }

    @And("^el usuario tapea solicitar reimpresion$")
    public void pressRequestReprint() {
        tarjetas.pressRequestReprint();
    }

    @And("^el usuario visualiza una pantalla de exito de bloqueo$")
    public void validateSuccessBlocking() {
        tarjetas.validateSuccessBlocking();
    }

    @When("^el usuario visualiza la opcion de envio$")
    public void validateShippingOption() {
        tarjetas.validateShippingOption();
    }

    @And("^el usuario tapea enviar$")
    public void pressSend() {
        tarjetas.pressSend();
    }

    @Then("^el usuario tapea finalizar$")
    public void validateSuccessScreen() {
        tarjetas.validateSuccessScreen();
    }

    @Then("^el usuario visualiza una pantalla de error$")
    public void validateErrorScreen() {
        tarjetas.validateErrorScreen();
    }

    @And("^el usuario tapea fisica$")
    public void pressPhysical() {
        tarjetas.pressPhysical();
    }

    @And("^el usuario tapea un motivo de reimpresion$")
    public void pressReprintMotive() {
        tarjetas.pressReprintMotive();
    }

    @When("^el usuario tapea cerrar$")
    public void pressClose() {
        tarjetas.pressClose();
    }

    @When("^el usuario tapea el motivo \"la perdi\"$")
    public void pressLostMotive() {
        tarjetas.pressLostMotive();
    }

    @Then("^el usuario ingresa a la pantalla ayuda en tarjetas$")
    public void pressHelpInCards() {
        tarjetas.pressHelpInCards();
    }

}
