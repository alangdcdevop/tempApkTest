package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriverException;

import static org.junit.Assert.assertEquals;

public class Home extends CommonPage {

    static By tabCuentas = MobileBy.AccessibilityId("tabCuentas");
    static By botonPerfil = MobileBy.xpath("//*[contains(@class, 'ImageButton')]");
    static By accountSection = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup\n");
    static By tabTransferencias = MobileBy.AccessibilityId("tabTransferencias");
    static By botonTransferencias = MobileBy.AccessibilityId("Nueva Transferencia");
    static By actividad1 =  MobileBy.AccessibilityId("actividad 1");
 //   static By cardTypeActividad1= MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"actividad 1\"]/android.widget.TextView[1]");
    static By cardTypeActividad1= MobileBy.AccessibilityId("actividad 1 descripción");
    static By fechaActividad1= MobileBy.AccessibilityId("actividad 1 fecha");
    static By montoActividad1 = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"actividad 1 monto\"]/android.widget.TextView");
    static By numeroCuenta = MobileBy.AccessibilityId("número de cuenta");
    //static By botonPerfil= MobileBy.className("android.widget.ImageButton");
    static By saldo = MobileBy.AccessibilityId("saldo en cuenta");
    static By btnCard = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout[4]");
    static By agrupadorEsteMes = MobileBy.AccessibilityId("Este Mes");

    @Step
    public void isOnHome() {
        try {
            dismissWarning();
            $(tabTransferencias).waitUntilVisible();
        } catch (WebDriverException e) {
        }
    }

    @Step
    public void goToProfile() {
        try {
            $(botonPerfil).click();
        } catch (WebDriverException e) {
            dismissWarning();
            goToProfile();
        }
    }

    @Step
    public void validateHome() {
        if (!$(accountSection).isDisplayed()) {
            Assert.fail();
        }
    }

    @Step
    public void clickOntranfer() {
        $(tabTransferencias).click();
    }

    @Step
    public void clickOnAccounts() {
        $(tabCuentas).click();
    }

    @Step
    public void validateHomeScreen() {
        if (!($(tabTransferencias).isDisplayed() && $(tabCuentas).isDisplayed())) {
            Assert.fail("No se encuentra en la pantalla de la home");
        }
    }


    public void userValidateActivityViewEmptyState() {
        // TODO Auto-generated method stub
        $(actividad1).shouldNotBeVisible();
    }

    @Step
    public void pressCard() {
        $(btnCard).click();
    }


    public void userValidateAccountNumber(String accountNumber) {
        assertEquals(accountNumber, $(MobileBy.AccessibilityId("número de cuenta")).waitUntilVisible().getText());
    }

	public void userValidateCurrentAccountBalance(String accountBalance) {
		
		assertEquals("$ " + accountBalance, $(saldo).getText());

    }


	public void userValidateMovementGroup(String grupo) {
		// TODO Auto-generated method stub

		$(MobileBy.AccessibilityId(grupo)).waitUntilVisible();

	}


    public void createGenericMovement() {
        // TODO Auto-generated method stub
//    	for(int x=0;x<response.size();x++) {
//    	//	  System.out.println(response.get(x));
//
//    	if (response.get(x) != null)
//    	{
//    		System.out.println(response.get(x));
//    		
//    	
//        String message = RestAssured.given()
//               .log().all()
//               .contentType(ContentType.JSON)
//               .headers("Authorization", "Bearer " + accessToken)
//               .delete("http://dev-customers.bdsdigital.com.ar/contacts/"+response.get(x).toString())
//       .then()
//       .extract().jsonPath().get("message");
//        System.out.println("response body :" + message);
//    	}
	}
	public void userSeeMovementOnActivityView(String ammount, String movement, String date) {
		// TODO Auto-generated method stub
		assertEquals(ammount, $(montoActividad1).waitUntilVisible().getText());
		assertEquals(movement, $(cardTypeActividad1).waitUntilVisible().getText());
		assertEquals(date, $(fechaActividad1).waitUntilVisible().getText());
		
	}


}

	