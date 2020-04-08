package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;

public class Chat extends CommonPage {

    static By inpQuickChat = MobileBy.AccessibilityId("Chatea con nosotros");
    static By divMessage = MobileBy.id("android:id/alertTitle");
    static By btnYes = MobileBy.id("android:id/button1");
    static By btnNo = MobileBy.id("android:id/button2");
    static By divSavedHistory = MobileBy.xpath("//*[@text='POR SEGURIDAD, EL HISTORIAL DE ESTA CONVERSACIÓN VA A SER GUARDADO.']");
    static By btnSend = MobileBy.AccessibilityId("send");
    static By btnBackButton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");
    static By inpChat = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText\n");
    static By lblChat = MobileBy.xpath("//*[@text='Chat']");

    @Step
    public void pressButtonChat() {
        $(inpQuickChat).click();
    }

    @Step
    public void validateMessage() {
        if (!$(divMessage).isDisplayed()) {
            Assert.fail("No se visualizo el mensaje de salida");
        }
    }

    @Step
    public void pressButtonYes() {
        $(btnYes).click();
    }

    @Step
    public void validateConversation() {
    }

    @Step
    public void pressButtonNo() {
        $(btnNo).click();
    }

    @Step
    public void validateChatScreen() {
    }

    @Step
    public void validateHour() {
    }

    @Step
    public void validateButtonSend() {
    }

    @Step
    public void inputMessageChat() {
        $(inpChat).sendKeys("hola");
    }

    @Step
    public void sendValueChat() {
    }

    @Step
    public void validateEmptyState() {
    }

    @Step
    public void validateSaveHistory() {
    }

}

