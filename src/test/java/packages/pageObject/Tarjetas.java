package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;

@SuppressWarnings("unused")
public class Tarjetas extends CommonPage {

    //Flujo bloquear tarjeta
    static By btnPhysical = MobileBy.AccessibilityId("Física");
    static By btnBlock = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView[1]\n");
    static By btnReprint = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.TextView[1]\n");
    static By btnWhitenPin = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.TextView[1]\n");
    static By btnLockCard = MobileBy.AccessibilityId("Bloquear Tarjeta");
    static By btnRequestReprint = MobileBy.AccessibilityId("Solicitar reimpresión");
    static By btnHelp = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/androidx.appcompat.widget.LinearLayoutCompat/android.widget.TextView\n");

    //Flujo reimpresion
    static By optDoesntWork = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup\n");
    static By optDontReadNumber = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup\n");
    static By optLostIt = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[3]/android.view.ViewGroup\n");
    static By optAnother = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[4]/android.view.ViewGroup\n");
    static By btnContinue = MobileBy.AccessibilityId("Continuar");
    static By btnSend = MobileBy.AccessibilityId("Enviar");
    static By btnNewAddress = MobileBy.AccessibilityId("accesibilityLabel.newAddress");
    static By btnBackButton = MobileBy.AccessibilityId("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");
    static By divCardSection = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.ScrollView\n");
    static By divRePrintSection = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView[1]\n");
    static By btnFinish = MobileBy.AccessibilityId("Finalizar");
    static By btnClose = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");

    @Step
    public void pressTheftOrLost() {
        $(btnLockCard).click();
    }

    @Step
    public void selectAnAddress() {
    }

    @Step
    public void pressContinue() {
        $(btnContinue).click();
    }

    @Step
    public void validateCardQuestions() {
    }

    @Step
    public void closeScreenDirection() {
        $(btnClose).click();
    }

    @Step
    public void confirmExit() {
    }

    @Step
    public void pressNotReprint() {
    }

    @Step
    public void validateCardScreen() {
        if (!$(divCardSection).isDisplayed()) {
            Assert.fail("No se visualizo la seccion de tarjetas");
        }
    }

    @Step
    public void pressBackButton() {
        $(btnBackButton).click();
    }

    @Step
    public void validateNotPrintFlow() {
    }

    @Step
    public void pressNotPrintFlow() {
    }

    @Step
    public void pressCloseSuccessRequest() {
    }

    @Step
    public void pressFinishSuccessRequest() {
    }

    @Step
    public void validateConfirmScreen() {
        if (!$(btnRequestReprint).isDisplayed()) {
            Assert.fail("No se encontro en la pantalla de confirmacion tarjeta bloqueada");
        }
    }

    @Step
    public void pressRequestReprint() {
        $(btnRequestReprint).click();
    }

    @Step
    public void validateSuccessBlocking() {
    }

    @Step
    public void validateShippingOption() {
        if (!$(divRePrintSection).isDisplayed()) {
            Assert.fail("No se encontro en la pantalla de confirmacion direccion");
        }
    }

    @Step
    public void pressSend() {
    }

    @Step
    public void validateSuccessScreen() {
        $(btnFinish).click();
    }

    @Step
    public void validateErrorScreen() {
    }

    @Step
    public void pressPhysical() {
        $(btnPhysical).click();
    }

    public void pressReprintMotive() {
    }

    public void pressClose() {
        $(btnClose).click();
    }

    public void pressLostMotive() {
        $(optLostIt).click();
    }

    public void pressRePrint() {
        $(btnReprint).click();
    }

    public void pressHelpInCards() {
        $(btnHelp).click();
    }
}

