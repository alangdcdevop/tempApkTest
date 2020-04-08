package packages.pageObject;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.webdriver.SerenityWebdriverManager;
import net.thucydides.core.webdriver.exceptions.ElementShouldBeEnabledException;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;

public class Login extends CommonPage {
    static String teclaLabel = "Teclado Clave Tecla ";
    static By botonAceptar = MobileBy.AccessibilityId("Boton Aceptar");
    static By botonAyuda = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/androidx.appcompat.widget.LinearLayoutCompat/android.widget.TextView\n");
    static By botonActivarBiometria = MobileBy.AccessibilityId("Activar biometria");
    static By botonCancelarBiometria = MobileBy.AccessibilityId("Cancelar biometria");
    static By botonCancelarLimiteDispositivos = MobileBy.AccessibilityId("Cancelar");
    static By boton1 = MobileBy.AccessibilityId(teclaLabel + "1");
    static By botonContinuarUltimoIntento = MobileBy.AccessibilityId("Continuar");


    @Step
    public void enterPasscode(String pass) {
        for (int i = 0; i < pass.length(); i++) {
            String c = Character.toString(pass.charAt(i));
            $(MobileBy.AccessibilityId(teclaLabel + c)).click();
        }
    }

    @Step
    public void pressHelp() {
        $(botonAyuda).click();
    }

    @Step
    public void helpAvailable() {
        $(botonAyuda).waitUntilVisible();
    }

    @Step
    public void showsDeviceLimitBreached() {
        //TODO: CHEQUEAR
        $(botonCancelarLimiteDispositivos).waitUntilVisible();
    }

    @Step
    public void enableFingerprint() {
        $(botonActivarBiometria).click();
    }

    @Step
    public void cancelFingerprintModal() {
        $(botonCancelarBiometria).click();
    }

    @Step
    public void enterFingerprint() {
        AppiumDriver appium = (AppiumDriver) SerenityWebdriverManager.inThisTestThread().getActiveDrivers().get(0);
        if (appium.getCapabilities().getCapability(MobileCapabilityType.PLATFORM_NAME) == "Android") {
            //appium.execute("adb -e emu finger touch 1");
            AndroidDriver driver = new AndroidDriver(appium.getCapabilities());
            driver.fingerPrint(1);
        } else if
        (appium.getCapabilities().getCapability(MobileCapabilityType.PLATFORM_NAME) == "IOS") {
            IOSDriver driver = new IOSDriver(appium.getCapabilities());
            driver.performTouchID(true);
        }
    }

    @Step
    public void acceptTermsAndConditions() {
        try {
            if ($(botonAceptar).isDisplayed()) $(botonAceptar).click();
        } catch (ElementShouldBeEnabledException | NoSuchElementException e) {
        }

    }

    @Step
    public void keyboardIsDisplayed() {
        $(boton1).waitUntilVisible();
    }

    @Step
    public void continueToLastAttempt() {
        $(botonContinuarUltimoIntento).click();
    }
}
