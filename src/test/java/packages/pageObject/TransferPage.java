package packages.pageObject;

import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.screenplay.waits.Wait;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.webdriver.exceptions.ElementShouldBeEnabledException;
import org.openqa.selenium.By;
import packages.drivers.AndroidAppiumDriver;
import static org.junit.Assert.assertEquals;
import org.openqa.selenium.InvalidElementStateException;
import org.openqa.selenium.remote.SessionId;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class TransferPage extends CommonPage {

    static By botonNuevaTransferencia= MobileBy.AccessibilityId("nueva transferencia");
    static By botonTransferir= MobileBy.AccessibilityId("Transferir");
    static By botonAgregarContacto= MobileBy.AccessibilityId("Agregar Contacto"); 
    static By tabTransferencias= MobileBy.AccessibilityId("tabTransferencias");
    static By textCbu= MobileBy.AccessibilityId("campo de texto");
    static By botonsiguiente=  MobileBy.AccessibilityId("Boton Siguiente");
    static By btnSiguiente = MobileBy.AccessibilityId("Siguiente");
    static By ingresarMonto= MobileBy.AccessibilityId("Ingresar monto");
    static By btnBackToTransfer = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup");
    static By confirmarTx = MobileBy.AccessibilityId("transferir botón");
    static By mensajeExito =  MobileBy.AccessibilityId("Transferencia Realizada");
    static By verComprobante = MobileBy.AccessibilityId("Boton Ver Comprobante");
    static By aliasInvalido = MobileBy.AccessibilityId("Alias Invalido");
    static By consultaCuentas = MobileBy.AccessibilityId("Boton Cuentas");
    static By cuenta = MobileBy.AccessibilityId("Cuenta");
    static By favorito1 = MobileBy.AccessibilityId("Contacto Favorito 1");
    static By favorito2 = MobileBy.AccessibilityId("Contacto Favorito 2");
    static By favorito3 = MobileBy.AccessibilityId("Contacto Favorito 3");
    static By favorito4 = MobileBy.AccessibilityId("Contacto Favorito 4");
   
    //datos destinatario
    static By nombreTitular = MobileBy.AccessibilityId("Titular");
    static By cuilDestinatario = MobileBy.AccessibilityId("cuit");
    static By bancoDestinatario = MobileBy.AccessibilityId("Banco");
    static By accountTypeDestinatario = MobileBy.AccessibilityId("Numera cuenta");
    static By accountNumberDestinatario = MobileBy.AccessibilityId("Tipo cuenta");


    @Step
    public void clickOnNewTransfer() {
        $(botonTransferir).click();
    }

//    @Step
//    public void clickOnNewTransfer() {
//        $(botonNuevaTransferencia).click();
//    }

    
	public void fillAlias(String alias) {
		// TODO Auto-generated method stub
               $(textCbu).waitUntilEnabled().click();
              $(textCbu).waitUntilEnabled().clear();
              $(textCbu).sendKeys(alias);		
	}


	public void clickOnSiguiente() {		
		$(botonsiguiente).click();		
	}
	

	
//	public void validarTipoCuentaDestinatario(String tipo) {
//		// TODO Auto-generated method stub
//		
//		assertEquals(tipo, $(MobileBy.AccessibilityId(tipo)).getTextValue());	
//		
//	}

	public void ingresoMonto(String monto) {

	$(MobileBy.AccessibilityId("Siguiente")).waitUntilClickable();
	   AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_1));
	   AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_0));


	}

	public void validoDatosTx(String nombre, String monto) {
		// TODO Auto-generated method stub
		assertEquals(nombre, $(nombreTitular).getText()); 
		assertEquals(monto, $(monto).getText());
		
	}

	public void descargarComprobante() {
		// TODO Auto-generated method stub
		$(verComprobante).click();
	}

//	public void ingresarCbu(String cbu) {
//        try{
//        $(textCbu).click();
//        $(textCbu).sendKeys(cbu);
//    }

    public void validarCuilDestinatario(String cuil) {
        // TODO Auto-generated method stu

        assertEquals("CUIT: " + cuil, $(cuilDestinatario).getTextValue());
    }

    public void validarNombreDestinatario(String nombre) {
        // TODO Auto-generated method stub
        AndroidAppiumDriver.getDriver().hideKeyboard();
        $(MobileBy.AccessibilityId(nombre)).waitUntilVisible().click();

    }

    public void validarBancoDestinatario(String banco) {
        // TODO Auto-generated method stub

        $(MobileBy.AccessibilityId(banco)).waitUntilVisible();


    }

    public void validarNumeroCuentaDestinatario(String numeroCuenta) {
        // TODO Auto-generated method stub

        assertEquals(numeroCuenta, $(accountNumberDestinatario).getTextValue());

    }
//	public void validarNumeroCuentaDestinatario(String numeroCuenta) {
//	// TODO Auto-generated method stub
//	
//	assertEquals(numeroCuenta, $(MobileBy.AccessibilityId(numeroCuenta)).getTextValue());		
//	
//}

    public void validarTipoCuentaDestinatario(String tipoCuenta) {
        // TODO Auto-generated method stub

        assertEquals(tipoCuenta, $(MobileBy.AccessibilityId(tipoCuenta)).getTextValue());

    }

//    public void ingresoMonto(String monto) {
//        // TODO Auto-generated method stub
//        $(MobileBy.AccessibilityId("Siguiente")).waitUntilClickable();
//        $(ingresarMonto).waitUntilClickable().click();
//        String estado = $(ingresarMonto).getAttribute("enabled");
//        System.out.println("estado" + estado);
//        AndroidAppiumDriver.getDriver().longPressKey(new KeyEvent(AndroidKey.DIGIT_1));
//        $(ingresarMonto).sendKeys(monto);
//    }

    public void confirmTx() {
        // TODO Auto-generated method stub
        $(confirmarTx).click();
    }

    public void validarTxExitosa() {
        // TODO Auto-generated method stub
        assertEquals("Transferencia Realizada", $(mensajeExito).getText());

    }


    public void ingresarCbu(String cbu) {
        try {
            $(textCbu).click();
            $(textCbu).sendKeys(cbu);
        } catch (ElementShouldBeEnabledException e) {
            $(textCbu).sendKeys(cbu);
        }

			
	}

	public void validarMensajeAliasInvalido(String mensaje) {
		// TODO Auto-generated method stub
		assertEquals(mensaje, $(aliasInvalido).getText());
	}

	public void selectCc() {
		// TODO Auto-generated method stub
		$(consultaCuentas).click();
		$(cuenta).click();
	}

	public void clickContacto(String contacto) {
		// TODO Auto-generated method stub
		$(MobileBy.AccessibilityId(contacto)).click();
	}

	public void validarTransferHomeEmptyState() {
		// TODO Auto-generated method stub
		
	}

	public void clickOnNextButtonOnAmmountView() {
		// TODO Auto-generated method stub
		$(btnSiguiente).click();
	
	}

	public void closeNativeKeyBoardIfPresent() {

		AndroidAppiumDriver.getDriver().hideKeyboard();

	//	AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.ENTER));

	}

	public void userPressBackToTransferBtn() {
		// TODO Auto-generated method stub
		$(btnBackToTransfer).click();
		$(btnBackToTransfer).click();
	}
	
}