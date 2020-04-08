package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Help;
import packages.pageObject.Login;
import packages.pageObject.Onboarding;

public class HelpSteps {

    private static String registeredMail;

    @Steps
    private Onboarding onboarding;

    @Steps
    private Login login;

    @Steps
    private Help help;

    @When("^el usuario ingresa a la pantalla ayuda$")
    public void pressButtonHelp() {
        login.pressHelp();
    }

    @Then("^el usuario visualiza los canales de soporte$")
    public void showFAQS() {
        help.showFAQS();
    }

    @When("^el usuario tapea el boton volver a la pantalla anterior$")
    public void pressBackButton() {
        help.pressBackButton();
    }

    @When("^el usuario tapea ver todas$")
    public void pressSeeAll() {
        help.pressSeeAll();
    }

    @Then("^el usuario visualiza la pantalla de faqs$")
    public void showFAQSSection() {
        help.showFAQSSection();
    }

    @When("^el usuario tapea mas opciones$")
    public void pressMoreOptions() {
        help.pressMoreOptions();
    }

    @Then("^el usuario visualiza la pantalla de ayuda mas opciones$")
    public void showSectionMoreOptions() {
        help.showSectionMoreOptions();
    }

    @When("^el usuario tapea whatsapp$")
    public void pressWhatsAppButton() {
        help.pressWhatsAppButton();
    }

    @Then("^el usuario visualiza una conversacion con el banco del sol$")
    public void showSectionChatBDS() {
        help.showSectionChatBDS();
    }

    @When("^el usuario tapea una de las preguntas frecuentes$")
    public void pressQuestionFrecuent() {
        help.pressQuestionFrecuent();
    }

    @Then("^el usuario visualiza la respuesta$")
    public void showAnswerQuestionFrecuent() {
        help.showAnswerQuestionFrecuent();
    }

    @And("^el usuario visualiza la pantalla de ayuda$")
    public void validateHelpScreen() {
        help.validateHelpScreen();
    }

    // no loggeado

    @Then("^el usuario visualiza las preguntas como abrir mi cuenta$")
    public void validateHowToOpenAccountQuestions() {
        help.validateHowToOpenAccountQuestions();
    }

    @And("^el usuario visualiza las preguntas de inicio de sesion$")
    public void validateLoginQuestions() {
        help.validateLoginQuestions();
    }

    @Then("^el usuario visualiza la pantalla anterior de no loggeado$")
    public void displayPreviousScreen() {
        onboarding.displayPreviousScreen();
    }

    @Then("^el usuario visualiza la opcion para calificar si la respuesta fue util o no$")
    public void validateQualification() {
        help.validateQualification();
    }

    @Then("^el usuario visualiza un agradecimiento por feedback$")
    public void validateFeedback() {
        help.validateFeedback();
    }

    @And("^el usuario tapea que si$")
    public void pressBtnYes() {
        help.pressBtnYes();
    }

    @And("^el usuario tapea que no$")
    public void pressBtnNo() {
        help.pressBtnNo();
    }

}
