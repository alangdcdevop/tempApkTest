package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Suggestions;

public class SuggestionSteps {

    @Steps
    private Suggestions suggestions;

    @When("^el usuario tapea el boton atras$")
    public void pressButtonBack() {
        suggestions.pressButtonBack();
    }

    @When("^el usuario tapea el boton enviar$")
    public void pressButtonSend() {
        suggestions.pressButtonSend();
    }

    @And("^el usuario visualiza la pantalla de agradecimiento$")
    public void validateThanksPoster() {
        suggestions.validateThanksPoster();
    }

    @Then("^el usuario tapea el boton finalizar$")
    public void pressButtonFinish() {
        suggestions.pressButtonFinish();
    }

    @Then("^el usuario tapea el boton cerrar$")
    public void pressButtonClose() {
        suggestions.pressButtonClose();
    }

    @And("^el usuario escribe una sugerencia$")
    public void sendValueSuggestion() {
        suggestions.sendValueSuggestion();
    }

}
