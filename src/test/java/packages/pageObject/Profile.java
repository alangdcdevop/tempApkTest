package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriverException;
import packages.utils.DriverActions;

public class Profile extends CommonPage {
    static By logout = MobileBy.AccessibilityId("Boton cerrar sesión");
    static By botonEditar = MobileBy.xpath("//*[@text='Editar']");
    //static By estadoCivilMostrado=MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.EditText[4]\n");
    static By divAlias = MobileBy.xpath("\t/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.TextView[2]");
    static By comboEstadoCivil = MobileBy.AccessibilityId("Combo Estado Civil");
    static By botonFinalizar = MobileBy.AccessibilityId("Boton Terminar");
    static By botonConfiguracion = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/androidx.appcompat.widget.LinearLayoutCompat/android.widget.TextView[1]\n"); //TODO: manguear accessibility label
    static By botonVerDatosPersonales = MobileBy.xpath("//*[@text='Ver mis datos']");
    static String dropEstadoCivil = "Combo Estado ";
    static By btnShare = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ImageView");

    @Step("el usuario se desloguea")
    public void logout() {
        try {
            $(logout).click();
        } catch (WebDriverException e) {
            dismissWarning();
            logout();
        }
    }

    @Step
    public void promptsForCivilStatus() {
        $(comboEstadoCivil).waitUntilPresent();
    }

    @Step
    public void selectCivilStatus(String estadoCivil) {
        $(comboEstadoCivil).click();
        $(MobileBy.AccessibilityId(dropEstadoCivil + estadoCivil)).click();
    }

    @Step
    public void finish() {
        $(botonFinalizar).click();
    }

    @Step
    public void showsCivilStatus(String estadoCivil) {

        try {
            DriverActions.scrollDownToText(estadoCivil);
            $(MobileBy.xpath("//*[@text='" + estadoCivil + "'] ")).isPresent();
        } catch (NoSuchElementException e) {
            showsCivilStatus(estadoCivil);
        }

    }

    @Step
    public void goToConfiguration() {
        $(botonConfiguracion).click();
    }

    @Step
    public void seePersonalInfo() {
        try {
            $(botonVerDatosPersonales).click();
        } catch (WebDriverException e) {
            dismissWarning();
            seePersonalInfo();
        }
    }

    @Step
    public void isOnProfile() {
        $(logout).waitUntilVisible();
    }

    @Step
    public void pressChangeAlias() {
        $(botonEditar).click();
    }

    @Step
    public void validateAlias(String alias) {
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println($(divAlias).getText() + "PRUEBA SAND");
        if (!$(divAlias).getText().equalsIgnoreCase(alias)) {
            Assert.fail("No tiene el alias deseado");
        }
    }

    public void shareInfo() {
        $(btnShare).click();
    }
}
