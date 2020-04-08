package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Contacts;
import packages.pageObject.Home;
import packages.pageObject.TransferPage;

public class ContactsSteps {

    @Steps
    private Home home;

    @Steps
    private TransferPage transferpage;

    @Steps
    private Contacts contacts;

    //MICROSERVCIOS CONTACTS
    @And("^Existe un usuario (.*) y passcode (.*) con Contactos cargados$")
    public void getContacts(String mail, String passcode) {
        contacts.getContacts(mail, passcode);
    }

    @And("^existe usuario (.*) y passcode (.*) sin contactos en la agenda$")
    public void deleteAllContacts(String mail, String passcode) {
        contacts.deleteAllContacts(mail, passcode);
    }

    //GetOwnerData View
    
	@And("hace click en siguiente flow agregar contacto$")
	public void clickOnbtnNextOnNewContactFlow() {
	 contacts.clickOnbtnNextOnNewContactFlow();
	 
	}

    //Transfer View

    @And("^el usuario ingresa en detalle de una cuenta$")
    public void userOpenTransactionsDetail() {
        contacts.userOpenAccountDetail();
    }

    @And("^el usuario hace click en boton transferir$")
    public void userClickOnTransferButton() {
        contacts.userClickOnTransferButton();
    }

    @When("^el usuario selecciona Ver Agenda$")
    public void clickOnVerAgenda() {
        contacts.clickOnVerAgenda();

    }

    @And("^visualiza el contacto (.*) en la posicion 1$")
    public void usuarioVeContacto(String nombreContacto) {
        contacts.userSeeContact(nombreContacto);
    }

    @And("^presiona el boton Agregar un contacto$")
    public void clickOnAddContact() {
        contacts.clickOnAddContact();
    }

    @And("^usuario regresa a ver la agenda$")
    public void userIsOnAgendaView() {
        contacts.userIsOnAgendaView();
    }

    @And("^el usuario ve la home de transferencias$")
    public void userSeeTransferHome() {
        contacts.userSeeTransferHome();

    }

    //Agenda View
    @And("^visualiza el nuevo contacto (.*) en la agenda")
    public void checkAddContact(String name) {
        contacts.checkNewContactoOnAgendaView(name);
    }

    @And("^presiona el boton Agregar un contacto en la vista agenda$")
    public void clickAddContactButtonInAgendaView() {
        contacts.clickAddContactButtonInAgendaView();
    }

    //Modal Consulta Titularidad

    @And("^completa el campo (.*)$")
    public void userFillAliasCvuCbuField(String account) {
        contacts.userFillAliasCvuCbuField(account);
    }

    @Then("^valida (.*) del nuevo contacto en modal consulta titularidad$")
    public void userCheckNameOfContact(String name) {
        contacts.userCheckNameOfContact(name);
    }

    @And("^valida el banco (.*) en modal consulta titularidad$")
    public void userCheckBankName(String bank) {
        contacts.userCheckBankName(bank);
    }

    @And("^valida el cuil (.*) en modal consulta titularidad$")
    public void userCheckCuilOfContact(String cuil) {
        contacts.userCheckCuilOfContact(cuil);
    }

    @And("^valida el tipo de cuenta (.*) en modal consulta titularidad$")
    public void userCheckAccountType(String accountType) {
        contacts.userCheckAccountType(accountType);
    }

    @And("^valida el cbu (.*) en modal consulta titularidad$")
    public void userCheckCbu(String cbu) {
        contacts.userCheckCbu(cbu);
    }

    @And("^presiona botón volver en modal consulta titularidad$")
    public void userClickBackButton() {
        contacts.userClickBackButton();
    }

    @And("^hace click en siguiente modal consulta titularidad$")
    public void userClickNextButton() {
        contacts.userClickNextButton();
    }

    //confirmation view new Contact

    @Then("^valida el nombre (.*) del nuevo contacto en pantalla confimación$")
    public void userCheckNameOfContactInConfirmationView(String name) {
        contacts.userCheckNameOfContact(name);
    }


    @And("^valida el banco (.*) en pantalla confimación$")
    public void userCheckBankNameInConfirmationView(String bank) {
        contacts.userCheckBankName(bank);
    }


    @And("^valida el cuil (.*) en pantalla confimación$")

    public void userCheckCuilOfContactInConfirmationView (String cuil) {
    	contacts.userCheckCuilOfContactOnConfirmationView(cuil);

    }


    @And("^valida el tipo de cuenta (.*) en pantalla confimación$")

    public void userCheckAccountTypeInConfirmationView(String accountType) {
        contacts.userCheckAccountType(accountType);
    }


    @And("^valida el cbu (.*) en pantalla confimación$")

    public void userCheckCbuInConfirmationView(String cbu) {
        contacts.userCheckCbu(cbu);
    }

    @And("^presion botón Agendar Contacto$")
    public void userConfirmAddContact() {
        contacts.userConfirmAddContact();
    }

    //Success View

    @And("^el usuario ve pantalla Contacto Agregado$")
    public void userSeeSuccessScreen() {
        contacts.userSeeSuccessScreen();
    }

    @And("^presiona botón Finalizar$")
    public void userClickFinishButton() {
        contacts.userClickFinishButton();
    }


    //Contact Detail View

    @And("^presiona boton eliminar$")
    public void userClickDeleteButton() {
        contacts.userClickDeleteButton();
    }

    @And("^hace click en Editar descripción$")
    public void userClickEditNicknameButton() {
        contacts.userClickEditNicknameButton();
    }

    @And("^modifica nickname (.*) del contacto$")
    public void userFillDescriptionTextField(String nickname) {
        contacts.userFillDescriptionTextField(nickname);
    }

    @And("^modifica nickname JHONLOVESHERPA del contacto$")
    public void userFillAliasError() {
        contacts.userFillAliasError();
    }

    @And("^el usuario no puede ingresar el caracter P por superar los 12 maximos$")
    public void userValidateCampoDeTextAlias() {
        contacts.userValidateCampoDeTextAlias();
    }

    @And("^presiona guardar para grabar el nuevo nickname$")
    public void userClickSaveButton() {
        contacts.userClickSaveButton();
    }

    @And("^el usuario ve el nickname (.*) nuevo en el detalle del contacto")
    public void userSeeNewNickname(String nickname) {
        contacts.userSeeNewNickname(nickname);
    }

    @And("^el usuario ve modal (.*)$")
    public void userSeeMessageToConfirmDeleteAction(String mensaje) {
        contacts.userSeeMessageToConfirmDeleteAction(mensaje);
    }


    @And("^visualiza el mensaje (.*)$")
    public void usersSeeMessageDeleteSuccess(String mensaje) {
        contacts.usersSeeMessageDeleteSuccess(mensaje);
    }

    @And("^valida que la cuenta se elimino correctamente (.*)$")
    public void userCheckAccountDeleted(String banco) {
        contacts.userCheckAccountDeleted(banco);
    }

    @And("^el usuario ve mensaje de error al guardar nickname (.*)$")
    public void userSeeToastErrorSavingNickname(String mensaje) {
        contacts.userSeeToastErrorSavingNickname(mensaje);
    }

    @And("^el boton CBU copia al portapapeles el (.*) correcto$")
    public void userCheckClipboardCbuBotonOnContactDetailOpenCard(String cbu) {
        contacts.userCheckClipboardCbuBotonOnContactDetailOpenCard(cbu);
    }

    @And("^estas visible el boton (.*)$")
    public void userCheckButtonOnContactDetailOpenCard(String boton) {
        contacts.userCheckButtonOnContactDetailOpenCard(boton);
    }

    @And("^la app va directo a la agenda y el usuario confirma que tambien se elimino el contacto$")
    public void userCheckContactWasDeletedOnAgenda(String nombre) {
        contacts.userCheckContactWasDeletedOnAgenda(nombre);
    }

    @And("^presiona boton (.*)$")
    public void userButtonClickAction(String button) {
        contacts.userButtonClickAction(button);
    }

    @And("^el usuario ingresa en detalle de una cuenta <cuenta>$")
    public void userClickOnSeeActionDetails() {
        contacts.userClickOnSeeActionDetails();
    }

    @And("^regresa a vista del contacto visualizando mensaje (.*)$")
    public void userSeeAccounDeletedMessageConfirmation(String message) {
        contacts.userSeeAccounDeletedMessageConfirmation(message);
    }

    @And("^el usuario ve toast (.*)$")
    public void userSeeToast(String toast) {
        contacts.userSeeToast(toast);
    }

}
