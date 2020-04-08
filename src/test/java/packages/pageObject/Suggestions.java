package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;

public class Suggestions extends CommonPage {

    //Accesibility or ID
    static By divShareIdea = MobileBy.AccessibilityId("Compartinos tu idea");
    static By btnSend = MobileBy.AccessibilityId("Enviar");
    static By btnFinish = MobileBy.AccessibilityId("Finalizar");
    static By btnTryAgain = MobileBy.AccessibilityId("Volver a intentar");
    static By btnCancel = MobileBy.AccessibilityId("Cancelar");
    static By divThanksPoster = MobileBy.AccessibilityId("¡Muchas gracias! Tu sugerencia fue recibida");
    static By inpSuggestions = MobileBy.AccessibilityId("campo de texto");

    //xPath
    static By backButton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");
    static By btnClose = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");

    @Step
    public void pressButtonBack() {
        $(backButton).click();
    }

    @Step
    public void validateSuggestions() {
        if (!$(divShareIdea).isDisplayed()) {
            Assert.fail("No se visualizo la pantalla de sugerencias");
        }
    }

    @Step
    public void pressButtonSend() {
        $(btnSend).click();
    }

    @Step
    public void validateThanksPoster() {
        if (!$(divThanksPoster).isDisplayed()) {
            Assert.fail("No se visualizo la pantalla de sugerencias");
        }
    }

    @Step
    public void pressButtonFinish() {
        $(btnFinish).click();
    }

    @Step
    public void pressButtonClose() {
        $(btnClose).click();
    }

    @Step
    public void sendValueSuggestion() {
        $(inpSuggestions).sendKeys("LA VIRCHULINA");
    }
}
