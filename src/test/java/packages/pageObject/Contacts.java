package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.By;
import packages.utils.AgendaService;

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.util.ArrayList;

import static org.junit.Assert.assertEquals;

public class Contacts extends PageObject {
    static By tapActionDetails = MobileBy.AccessibilityId("Ver detalle de acciónes");
    static By transferButton = MobileBy.AccessibilityId("Boton Transferir");
    static By contacto1 = MobileBy.AccessibilityId("Contacto");
    static By linkVerAgenda = MobileBy.AccessibilityId("Ver Agenda");
    static By addContactButton = MobileBy.AccessibilityId("Agregar\nContacto");
    static By addContactButtonAgendaView = MobileBy.AccessibilityId("Agregar un contacto");
    static By cbuAliasCvuTextField = MobileBy.AccessibilityId("campo de texto");
    static By nextAmountView = MobileBy.linkText("SIGUIENTE");
    static By btnNextCbuView = MobileBy.AccessibilityId("Siguiente");
    

    //Modal consulta Titularidad
//    static By contactName = MobileBy.AccessibilityId("Nombre de Contacto");
//    static By contactCuil = MobileBy.AccessibilityId("cuil");
//    static By contactBank = MobileBy.AccessibilityId("Nombre Banco");
//    static By contactCbu = MobileBy.AccessibilityId("CBU");
//    static By contactAccountType = MobileBy.AccessibilityId("Tipo de Cuenta");

    //Pantala confirmacion contacto

    static By confirmContactButton = MobileBy.AccessibilityId("Agendar contacto");
 
    //Pantalla Success
    static By successMessage = MobileBy.AccessibilityId("Agendar Contacto");
    static By finishButton = MobileBy.AccessibilityId("Finalizar");

	public void userOpenAccountDetail() {
		// TODO Auto-generated method stub
		$(tapActionDetails).click();
	}

	public void userClickOnTransferButton() {
		// TODO Auto-generated method stub
		$(transferButton).click();
	}

	public void userSeeContact(String nombreContacto) {
		// TODO Auto-generated method stub
		assertEquals(nombreContacto, $(contacto1).getText());
	}

	public void clickOnVerAgenda() {
		// TODO Auto-generated method stub
        
	$(linkVerAgenda).click();

	}

	public void clickOnAddContact() {
		// TODO Auto-generated method stub

			$(addContactButton).click();	
	}
	
	//View Consulta Titularidad

	public void userFillAliasCvuCbuField(String account) {
		// TODO Auto-generated method stub
		try {
			$(cbuAliasCvuTextField).sendKeys(account);
		}
		catch (Exception e){
			userFillAliasCvuCbuField(account);
		}
		//$(cbuAliasCvuTextField).waitUntilEnabled();
		//$(cbuAliasCvuTextField).sendKeys(account);
	}

	public void userCheckNameOfContact(String name) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(name)).isVisible();
	}

	public void userCheckCuilOfContact(String cuil) {
		// TODO Auto-generated method stub
		assertEquals("CUIT: " + cuil, $(MobileBy.AccessibilityId("cuit")).getText());
		//label cuit
	}

	public void userCheckBankName(String bank) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(bank)).isVisible();
	}

	public void userCheckAccountType(String accountType) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(accountType)).isVisible();
	}

	public void userCheckCbu(String cbu) {
		// TODO Auto-generated method stub
		assertEquals("Nº " + cbu, $(MobileBy.AccessibilityId("cbu")).getText());
	}

	public void userConfirmAddContact() {
		// TODO Auto-generated method stub
		$(confirmContactButton).click();
	}
	
	//Succes view
	
	public void userSeeSuccessScreen() {
		// TODO Auto-generated method stub
		$(successMessage).isVisible();

	}
	
	public void userClickFinishButton() {
		$(finishButton).click();
		
	}

	//Agenda View
	public void checkNewContactoOnAgendaView(String name) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(name)).waitUntilVisible();
	}

	public void userClickBackButton() {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("Volver")).click();
	}

	public void userClickNextButton() {
		// TODO Auto-generated method stub
		$(btnNextCbuView).waitUntilClickable().click();
		//$(MobileBy.AccessibilityId("Siguiente")).click();
	}

	public void userClickDeleteButton() {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("Eliminar")).click();
	
	}

	public void userSeeTransferHome() {
		// TODO Auto-generated method stub
		$(linkVerAgenda).isVisible();
	}

	//CONTACT DETAIL VIEW
	public void userClickEditNicknameButton() {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("Editar")).click();
	
	}

	public void userFillDescriptionTextField(String nickname) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("campo de texto")).clear();
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys(nickname);	
	}

	public void userClickSaveButton() {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("Aceptar")).click();
	}

	public void userSeeNewNickname(String nickname) {
		// TODO Auto-generated method stub
		assertEquals(nickname, $(MobileBy.AccessibilityId(nickname)).getText());
	}

	public void clickAddContactButtonInAgendaView() {
		// TODO Auto-generated method stub
		$(addContactButtonAgendaView).click();
	}

	public void userSeeMessageToConfirmDeleteAction(String mensaje) {
		// TODO Auto-generated method stub
		assertEquals(mensaje, $(MobileBy.AccessibilityId(mensaje)).getText());
		
	}

	public void usersSeeMessageDeleteSuccess(String mensaje) {
		// TODO Auto-generated method stub
		assertEquals(mensaje, $(MobileBy.AccessibilityId(mensaje)).getText());
		
	}

	public void userCheckAccountDeleted(String banco) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(banco)).shouldNotBePresent();
	}

	public void userSeeToastErrorSavingNickname(String mensaje) {
		// TODO Auto-generated method stub
		assertEquals(mensaje, $(MobileBy.AccessibilityId(mensaje)).getText());
	
	}

	public void userFillAliasError() {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId("campo de texto")).clear();
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("J");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("H");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("O");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("N");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("L");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("O");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("V");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("V");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("E");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("S");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("H");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("E");
		$(MobileBy.AccessibilityId("campo de texto")).sendKeys("R");
	}

	public void userValidateCampoDeTextAlias() {
		// TODO Auto-generated method stub
		assertEquals("JHONLOVESHER", $(MobileBy.AccessibilityId("campo de texto")).getText());		
	}

	public void userCheckClipboardCbuBotonOnContactDetailOpenCard(String cbu) {
		// TODO Auto-generated method stub
		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
		$(MobileBy.AccessibilityId("Copiar datos")).click();
		assertEquals(cbu, clipboard.getContents(clipboard));	
		
	}

	public void userCheckButtonOnContactDetailOpenCard(String boton) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(boton)).isEnabled();
	}

	public void userCheckContactWasDeletedOnAgenda(String nombre) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(nombre)).shouldNotBePresent();

	}

	public void userButtonClickAction(String button) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(button)).click();
	}

	public void userSeeAccounDeletedMessageConfirmation(String message) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(message)).isVisible();

	}

	public void userClickOnSeeActionDetails() {
		// TODO Auto-generated method stub
		$(tapActionDetails).click();
	}

	public void getContacts(String mail, String passcode) {
		// TODO Auto-generated method stub
		
		AgendaService.getContactsList(AgendaService.getToken(mail, passcode));
	}

	public void deleteAllContacts(String mail, String passcode) {
		// TODO Auto-generated method stub
		String token = AgendaService.getToken(mail, passcode);
		ArrayList lista = AgendaService.getContactsList(token);
		AgendaService.deleteAllContacts(token, lista);
	}

	public void userSeeToast(String toast) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(toast)).isVisible();
	}

	public void userIsOnAgendaView() {
		// TODO Auto-generated method stub
		$(addContactButtonAgendaView).waitUntilEnabled();
	}

	public void clickOnbtnNextOnNewContactFlow() {
		// TODO Auto-generated method stub
		$(btnNextCbuView).waitUntilClickable().click();
	}

	public void userCheckCuilOfContactOnConfirmationView(String cuil) {
		// TODO Auto-generated method stub
		assertEquals("CUIL: " + cuil, $(MobileBy.AccessibilityId("CUIL ")).getText());
		//label cuit

	}	

}