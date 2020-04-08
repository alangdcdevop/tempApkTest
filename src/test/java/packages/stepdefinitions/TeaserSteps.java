package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Teaser;

public class TeaserSteps {

    @Steps
    private Teaser teaser;

    @Then("^se muestran preguntas$")
    public void showQuestions() {
        teaser.showQuestions();
    }

    @And("^un campo para ingreso de mail$")
    public void mailField() {
        teaser.mailField();
    }

    @And("^un boton para enviarlas$")
    public void showButton() {
        teaser.showButton();
    }

    @When("^se muestra un input$")
    public void showInput() {
        teaser.showInput();
    }

    @And("^y ingresa (.*) en el input$")
    public void sendValue(String sendValue) {
        teaser.sendValue(sendValue);
    }

    @Then("^se visualiza (.*) en el input$")
    public void checkValue(String checkValue) {
        teaser.checkValue(checkValue);
    }

    @And("^responde preguntas$")
    public void answerQuestions() {
        teaser.answerQuestions();
    }

    @And("^hace click en \"Quiero participar\"$")
    public void pressWantToParticipate() {
        teaser.pressWantToParticipate();
    }

    @When("^el usuario completa la primera pregunta$")
    public void answerFirstQuestion() {
        teaser.answerFirstQuestion();
    }

    @And("^envia su correo electrónico$")
    public void sendEmail(String mail) {
        teaser.sendEmail(mail);
    }

    @And("^completa su correo electronico (.*)$")
    public void sendEmail2(String email) {
        teaser.sendEmail(email);
    }

    @And("^completa la tercera pregunta$")
    public void answerThirdQuestion() {
        teaser.answerThirdQuestion();
    }

    @And("^omite la segunda pregunta$")
    public void skipSecondQuestion() {
        teaser.skipSecondQuestion();
    }

    @Then("^el usuario visualiza un cartel de agradecimiento$")
    public void showSuccessPoster() {
        teaser.showSuccessPoster();
    }

    @And("^completa la segunda pregunta$")
    public void answerSecondQuestion() {
        teaser.answerSecondQuestion();
    }

    @And("^omite la tercera pregunta$")
    public void skipThirdQuestion() {
        teaser.skipThirdQuestion();
    }

    @When("^usuario omite la primera pregunta$")
    public void skipFirstQuestion() {
        teaser.skipFirstQuestion();
    }

    @And("^envia su correo electronico$")
    public void pressSend() {
        teaser.pressSend();
    }

}
