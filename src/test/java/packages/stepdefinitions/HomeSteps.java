package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Home;

public class HomeSteps {

    @Steps
    private Home home;

    @Then("^el usuario visualiza la pantalla de home$")
    public void validateHome() {
        home.validateHomeScreen();
    }

    @And("^el usuario ve el empty state en activity view")
    public void userValidateActivityViewEmptyState() {
        home.userValidateActivityViewEmptyState();
    }

    @And("ve el numero de cuenta (.*)")
    public void userValidateAccountNumber(String accountNumber) {

        home.userValidateAccountNumber(accountNumber);

    }

    @Then("^ve el saldo (.*) de su cuenta$")
    public void userValidateCurrentAccountBalance(String accountBalance) {
    	home.userValidateCurrentAccountBalance(accountBalance);
    }

    @And("^el usuario visualiza el agrupador de movimientos (.*)$")
    public void userSeeMovementGroup(String grupo) {
        home.userValidateMovementGroup(grupo);

    }

    @And("^el usuario tiene movimientos (.*)$")
    public void createGenericMovement() {
        home.createGenericMovement();
    }

    @And("^visualiza el monto (.*) del movimiento (.*) en la fecha (.*)")
    public void userSeeMovementOnActivityView(String ammount, String movement, String date) {
        home.userSeeMovementOnActivityView(ammount, movement, date);

    }


}
