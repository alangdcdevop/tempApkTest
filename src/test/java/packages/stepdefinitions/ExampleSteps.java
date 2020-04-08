package packages.stepdefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Onboarding;

public class ExampleSteps {

    @Steps
    private Onboarding onboarding;

    @Given("^el usuario se encuentra en la landing page$")
    public void usuarioEstaEnLanding() {
        onboarding.isOnWelcome();
    }

    @When("^el usuario se registra$")
    public void elUsuarioSeRegistra() {
        onboarding.register();
    }

    @Then("^el usuario visualiza requisitos de identificacion$")
    public void elUsuarioVisualizaRequisitosDeIdentificacion() {
        onboarding.isOnIdentificationRequirements();
    }


}

