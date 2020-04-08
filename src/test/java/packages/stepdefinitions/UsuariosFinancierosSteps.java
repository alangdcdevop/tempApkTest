package packages.stepdefinitions;

import cucumber.api.java.en.And;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Institutional;

public class UsuariosFinancierosSteps {

    @Steps
    private Institutional institutional;

    @And("^el usuario presiona el link de usuarios financieros$")
    public void pressLinkFinancialUsers() {
        institutional.pressLinkFinancialUsers();
    }

}
