package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.serenitybdd.core.pages.PageObject;
import org.junit.Assert;
import org.openqa.selenium.By;

public class Help extends PageObject {

    //Accesibility Label
    static By seeAllButton = MobileBy.AccessibilityId("Ver todas");
    static By moreOptionsButton = MobileBy.AccessibilityId("Más Opciones");
    static By btnAccount = MobileBy.AccessibilityId("Cuenta");
    static By btnTransfers = MobileBy.AccessibilityId("Transferencias");
    static By btnoInvestments = MobileBy.AccessibilityId("Inversiones");
    static By btnNo = MobileBy.AccessibilityId("No");
    static By btnYes = MobileBy.AccessibilityId("Si");

    //xPath
    static By questionFrecuentDiv = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.TextView\n");
    static By answerQuestionFrecuentDiv = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView\n");
    static By divHowToOpenAccount = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup\n");
    static By divLoggin = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup\n");
    static By FAQSSection = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.widget.TextView\n");
    static By backButton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");
    static By chatWhatsAppDiv = MobileBy.xpath("");
    static By FAQSDiv = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup\n");
    static By moreOptionsDiv = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup\n");
    static By whatsAppButton = MobileBy.AccessibilityId("Contactanos por Whatsapp");
    static By divQualification = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView[2]\n");

    // Loggeado

    public void showFAQS() {
        $(FAQSSection).click();
    }

    public void pressBackButton() {
        $(backButton).click();
    }

    public void pressSeeAll() {
        $(seeAllButton).click();
    }

    public void showFAQSSection() {
        if (!$(FAQSDiv).isDisplayed()) {
            Assert.fail("No se encontro la seccion de faqs");
        }
    }

    public void pressMoreOptions() {
        $(moreOptionsButton).click();
    }

    public void showSectionMoreOptions() {
        if (!$(moreOptionsDiv).isDisplayed()) {
            Assert.fail("No se encontro la seccion de mas opciones");
        }
    }

    public void pressWhatsAppButton() {
        $(whatsAppButton).click();
    }

    public void showSectionChatBDS() {
        if (!$(chatWhatsAppDiv).isDisplayed()) {
            Assert.fail("No se encontro la seccion de mas opciones");
        }
    }

    public void pressQuestionFrecuent() {
        $(questionFrecuentDiv).click();
    }

    public void showAnswerQuestionFrecuent() {
        if (!$(answerQuestionFrecuentDiv).isDisplayed()) {
            Assert.fail("No se encontro la seccion de mas opciones");
        }
    }

    // NO Loggeado

    public void validateHowToOpenAccountQuestions() {
        if (!$(divHowToOpenAccount).isDisplayed()) {
            Assert.fail("No se encontro la seccion de mas opciones");
        }
    }

    public void validateLoginQuestions() {
        if (!$(divLoggin).isDisplayed()) {
            Assert.fail("No se encontro la seccion de mas opciones");
        }
    }

    public void validateQualification() {
        if (!$(divQualification).isDisplayed()) {
            Assert.fail("No se encontro la seccion de calificacion");
        }
    }

    public void validateHelpScreen() {
    }

    public void pressBtnYes() {
        $(btnYes).click();
    }

    public void pressBtnNo() {
        $(btnNo).click();
    }

    public void validateFeedback() {
    }

}
