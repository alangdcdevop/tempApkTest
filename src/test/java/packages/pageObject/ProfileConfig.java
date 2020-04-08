package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;

public class ProfileConfig extends CommonPage {
    static By botonCambiarClaveNumerica = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]\n");
    static By botonDesvincularDispositivo = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]\n");
    static By botonDarDeBaja = MobileBy.xpath("//*[@text='Dar de baja mi cuenta en BDS']");
    static By botonFinalizar = MobileBy.xpath("//*[@text='Finalizar'] ");
    static By imagenPasscodeInvalido = MobileBy.AccessibilityId("falta");
    static By botonConfirmarDesvinculacion = MobileBy.xpath("//*[@text='Desvincular']");
    static By botonVolverAVincular = MobileBy.xpath("//*[@text='Volver a vincular']");
    static By botonCancelarBaja = MobileBy.xpath("//*[@text='No por ahora']");
    //TODO: PEDIR ACCESSIBILITY LABELS

    @Step
    public void changePasscode() {
        $(botonCambiarClaveNumerica).click();
    }

    @Step
    public void passcodeChanged() {
        $(botonFinalizar).waitUntilVisible();
    }

    @Step
    public void passcodeRulesNotMet() {
        //$(imagenPasscodeInvalido).waitUntilVisible();
        Assert.assertFalse($(MobileBy.xpath("//*[@text='Confirmá tu clave'] ")).isVisible());
    }

    @Step
    public void unlinkDevice() {
        $(botonDesvincularDispositivo).click();
    }

    @Step
    public void confirmUnlinkDevice() {
        $(botonConfirmarDesvinculacion).click();
    }

    @Step
    public void showsReLinkDevice() {
        $(botonVolverAVincular).waitUntilVisible();
    }

    @Step
    public void closeAccount() {
        $(botonDarDeBaja).click();
    }

    @Step
    public void cancelAccountClosing() {
        $(botonCancelarBaja).click();
    }
}
