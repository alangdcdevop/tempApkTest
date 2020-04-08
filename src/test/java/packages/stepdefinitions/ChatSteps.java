package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Chat;

public class ChatSteps {

    @Steps
    private Chat chat;

    @When("^el usuario tapea el chat$")
    public void pressButtonChat() {
        chat.pressButtonChat();
    }

    @And("^el usuario visualiza un mensaje de confirmacion y eliminacion de los mensajes$")
    public void validateConfirmationMessage() {
        chat.validateMessage();
    }

    @And("^el usuario selecciona si$")
    public void pressButtonYes() {
        chat.pressButtonYes();
    }

    @Then("^el usuario no visualiza la conversacion$")
    public void validateConversation() {
        chat.validateConversation();
    }

    @And("^el usuario selecciona no$")
    public void pressButtonNo() {
        chat.pressButtonNo();
    }

    @And("^el usuario visualiza la pantalla del chat$")
    public void validateChatScreen() {
        chat.validateChatScreen();
    }

    @When("^el usuario escribe un mensaje$")
    public void inputMessageChat() {
        chat.inputMessageChat();
    }

    @Then("^el usuario visualiza un mensaje con el horario en el que lo envio$")
    public void validateHour() {
        chat.validateHour();
    }

    @And("^el usuario visualiza el boton de enviar$")
    public void validateButtonSend() {
        chat.validateButtonSend();
    }

    @Then("^el usuario envia el mensaje$")
    public void sendValueChat() {
        chat.sendValueChat();
    }

    @Then("^el usuario visualiza pantalla de empty state$")
    public void validateEmptyState() {
        chat.validateEmptyState();
    }

    @Then("^el usuario visualiza un aviso de historial guardado$")
    public void validateSaveHistory() {
        chat.validateSaveHistory();
    }

}
