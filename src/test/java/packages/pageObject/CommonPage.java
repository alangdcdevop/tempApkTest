package packages.pageObject;

import io.appium.java_client.MobileBy;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.functions.ExpectedCondition;
import net.serenitybdd.core.pages.PageObject;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.webdriver.exceptions.ElementShouldBeEnabledException;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.touch.TouchActions;
import org.openqa.selenium.support.ui.WebDriverWait;
import packages.drivers.AndroidAppiumDriver;
import packages.drivers.IOSAppiumDriver;
import packages.utils.AccountsMeService;
import packages.utils.AddMovementsToAccount;
import packages.utils.AgendaService;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

public class CommonPage extends PageObject {

    static By botonAtrasClass = MobileBy.className("android.widget.ImageButton");
    static By dismissWarning = MobileBy.id("android:id/button1");
    static String teclaLabel = "Teclado Clave Tecla ";
    static By btnContinue = MobileBy.AccessibilityId("Continuar");


    @Step
    public void goBack() {
        $(botonAtrasClass).click();
    }

    @Step
    public void dismissWarning() {
        try {
            $(dismissWarning).click();
        } catch (ElementShouldBeEnabledException e) {
        }
    }

    public static String addSquadToEmailAddress(String mail) { //ESTA IMPLEMENTACION YA NO ES NECESARIA
        String cell = System.getProperty("testing.squad");
        int atIndex = mail.indexOf("@") - 1;
        if (cell == null || cell == "") return mail;
        String newString = "";
        for (int i = 0; i < mail.length(); i++) {
            newString += mail.charAt(i);
            if (i == atIndex) {
                newString += cell;
            }
        }
        String newMail = newString.replaceAll("-", "");
        return newMail;
    }


    @Step
    public static void getWebInstitutional(String url) {
        AndroidAppiumDriver androidAppiumDriver = new AndroidAppiumDriver();
        androidAppiumDriver.newDriver().get(url);
    }

    @Step
    public void openNotifications() {
        AndroidAppiumDriver.getDriver().openNotifications();
    }

    @Step
    public void enterPasscode(String pass) {
        for (int i = 0; i < pass.length(); i++) {
            String c = Character.toString(pass.charAt(i));
            $(MobileBy.AccessibilityId(teclaLabel + c)).click();
        }
    }

    public static String randomizeMail(String mail) {
        String uuid = UUID.randomUUID().toString();
        int atIndex = mail.indexOf("@") - 1;
        String newString = "";
        for (int i = 0; i < mail.length(); i++) {
            newString += mail.charAt(i);
            if (i == atIndex) {
                newString += "+" + uuid;
            }
        }
        return newString;
    }


    public void creoUnDebin(String mail, String passcode) {
        String token = AgendaService.getToken(mail, passcode);
        ArrayList account = AccountsMeService.accountsMe(token);
        //	String account = AddMovementsToAccount.accountsMe(token);
        String accountNumber = account.get(0).toString();
        String refNo = AddMovementsToAccount.newDebin();
        AddMovementsToAccount.authDebin(refNo, accountNumber);
    }


    public void takeScreenshot() {
        File file = AndroidAppiumDriver.getDriver().getScreenshotAs(OutputType.FILE);

        try {
            FileUtils.copyFile(file, new File("Screenshot.png"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static WebElement findElement(String method, String value) {
        if (System.getProperty("testing.driver").equalsIgnoreCase("android-web")) {
            return AndroidAppiumDriver.getDriver().findElement(method, value);
        } else {
            return IOSAppiumDriver.getDriver().findElement(method, value);
        }
    }

    public void validateURL(String URLtoCompare) {
        waitForPageLoaded();
        String currentURL = AndroidAppiumDriver.getDriver().getCurrentUrl();
        if (!currentURL.equals(URLtoCompare)) {
            Assert.fail("No se encontró en la pagina correcta");
        }
    }

    public void closeWindow() {
        ArrayList<String> tabs2 = new ArrayList<String>(AndroidAppiumDriver.getDriver().getWindowHandles());
        AndroidAppiumDriver.getDriver().switchTo().window(tabs2.get(0));
        AndroidAppiumDriver.getDriver().close();
        AndroidAppiumDriver.getDriver().switchTo().window(tabs2.get(1));
    }

    public void waitForPageLoaded() {
        ExpectedCondition<Boolean> expectation = driver -> {
            assert driver != null;
            return ((JavascriptExecutor) driver).executeScript("return document.readyState").toString().equals("complete");
        };
        try {
            Thread.sleep(1000);
            WebDriverWait wait = new WebDriverWait(AndroidAppiumDriver.getDriver(), 30);
            wait.until(expectation);
        } catch (Throwable error) {
            Assert.fail("Timeout waiting for Page Load Request to complete.");
        }
    }


    public void pressContinue() {
        $(btnContinue).click();
    }

	public void userScrollDown() {
		// TODO Auto-generated method stub
		
	}



    public void usuario_ingresa_el_valor(String valor) {
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        AndroidAppiumDriver.getDriver().getKeyboard();
        valor.chars().forEachOrdered(i -> recorrerString((char)i));
        AndroidAppiumDriver.getDriver().hideKeyboard();
    }

    // Auxiliares
    public void recorrerString(char valor){

        int caracter = Character.getNumericValue(valor);  ;
        switch (caracter) {
            case 1:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_1));
                break;
            case 2:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_2));
                break;
            case 3:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_3));
                break;
            case 4:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_4));
                break;
            case 5:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_5));
                break;
            case 6:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_6));
                break;
            case 7:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_7));
                break;
            case 8:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_8));
                break;
            case 9:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_9));
                break;
            case 0:
                AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DIGIT_0));
                break;
            default:
                break;
        }
    }

}

