package packages.stepdefinitions;

import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Institutional;

public class CierreDeCuentaSteps {

    @Steps
    private Institutional institutional;

    @When("^el usuario hace click en el numero de whatsapp$")
    public void pressWhatsApp() {
        institutional.pressWhatsApp();
    }

}