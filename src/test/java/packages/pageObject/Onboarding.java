package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;
import packages.utils.DriverActions;
import packages.utils.MailHandler;

import javax.mail.MessagingException;
import java.io.IOException;

public class Onboarding extends CommonPage {
    static By botonLogin = MobileBy.AccessibilityId("Boton Login");
    static By botonRegistro = MobileBy.AccessibilityId("Boton Registro");
    static By botonEntendido = MobileBy.AccessibilityId("Boton Entendido");
    static By botonSelfie = MobileBy.AccessibilityId("botonCamaraSelfie");
    static By fotoSelfie = MobileBy.AccessibilityId("Foto Identidad");
    static By botonConfirmarSelfie = MobileBy.AccessibilityId("Boton Confirmar Foto");
    static By botonContinuar = MobileBy.AccessibilityId("Boton Continuar");
    static By botonConfirmarVideo = MobileBy.AccessibilityId("Boton Confirmar Video");
    static By botonAyuda = MobileBy.AccessibilityId("Boton Ayuda");
    static By labelDeviceId = MobileBy.AccessibilityId("deviceId");
    static By labelMagicLinkBaseUrl = MobileBy.AccessibilityId("magicLinkBaseUrl");
    static By botonFrenteDNI = MobileBy.AccessibilityId("Boton Camara DNI Frente");
    static By botonAyudaNoLoggin = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/androidx.appcompat.widget.LinearLayoutCompat/android.widget.TextView\n");
    static By labelVincularDispositivo = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView\n");
    static By invalidDeviceMessage = MobileBy.xpath("//*[@text='Ingresá desde tu celular']");

    @Step("el usuario se encuentra en la landing page")
    public void isOnWelcome() {
        $(botonLogin).waitUntilPresent();
    }

    @Step("el usuario se registra")
    public void register() {
        $(botonRegistro).click();
    }

    @Step("el usuario visualiza requisitos de identificacion")
    public void isOnIdentificationRequirements() {
        $(botonEntendido).waitUntilPresent();
    }

    @Step("el usuario comienza el proceso")
    public void understood() {
        $(botonEntendido).click();
    }

    @Step
    public void takeSelfie() {
        $(botonSelfie).click();
    }

    @Step
    public void selfieIsShown() {
        $(fotoSelfie).waitUntilPresent();
    }

    @Step
    public void confirmSelfie() {
        $(botonConfirmarSelfie).click();
    }

    @Step
    public void confirmVideoRequirements() {
        $(botonContinuar).click();
    }

    @Step
    public void confirmVideo() {
        $(botonConfirmarVideo).click();
    }

    @Step
    public void waitForAppTimeout(int minutes) {
        try {
            Thread.sleep(minutes * 1000 * 60);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Step
    public void showsInvalidDevice() {
        $(invalidDeviceMessage).waitUntilPresent();
    }

    @Step
    public void login() {
        $(botonLogin).click();
    }

    @Step
    public void setDeviceId() {
        String deviceId=$(labelDeviceId).waitUntilPresent().getText();

        System.setProperty("deviceId",deviceId);
    }

    @Step
    public void setMagicLinkBaseUrl() {
        String magicLinkBaseUrl=$(labelMagicLinkBaseUrl).waitUntilPresent().getText();
        System.setProperty("magicLinkBaseUrl", magicLinkBaseUrl);
        //System.setProperty("magicLinkBaseUrl", "https://open-" + System.getProperty("testing.squad").replace("-", "") + ".bdsdigital.com.ar");

    }

    @Step
    public void takeDNIFrontPicture() {
        $(botonFrenteDNI).click();
    }

    @Step
    public void emailSent() {
        $(botonAyuda).waitUntilPresent();
    }

    @Step
    public void getUserNotRegisteredEmail() {
        try {
            MailHandler.getUnregisteredMail("bdsolqe@gmail.com", "Bdsol123").contains("Solicitaste vincular tu dispositivo");
            System.out.println("Mail valido recibido");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Step
    public void accessUnregisteredMagicLink() {
        String magicLink = null;
        try {
            magicLink = MailHandler.getUnregisteredMagicLink("bdsolqe@gmail.com", "Bdsol123");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        DriverActions.get(magicLink);
    }

    @Step
    public void pressHelpNoLoggin() {
        $(botonAyudaNoLoggin).click();
    }

    @Step
    public void displayPreviousScreen() {
        if (!$(labelVincularDispositivo).isDisplayed()) {
            Assert.fail("No se visualizo la pantalla de vincular dispositivo");
        }
    }
}
