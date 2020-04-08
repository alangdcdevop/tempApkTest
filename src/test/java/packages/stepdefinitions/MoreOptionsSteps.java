package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.MoreOptions;

public class MoreOptionsSteps {

    @Steps
    private MoreOptions moreOptions;

    @And("^el usuario ingresa a sugerencias$")
    public void pressButtonSuggestions() {
        moreOptions.pressButtonSuggestions();
    }

    @Then("^el usuario visualiza la pantalla de mas opciones$")
    public void validateMoreOptionsScreen() {
        moreOptions.validateMoreOptionsScreen();
    }

}
