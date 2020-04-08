package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;

public class MoreOptions extends CommonPage {

    static By btnSuggestions = MobileBy.AccessibilityId("Sugerencias");
    static By btnWhatsApp = MobileBy.AccessibilityId("Contacto Whatsapp");
    static By btnBranchOffice = MobileBy.AccessibilityId("Sucursales");
    static By btnTelephone = MobileBy.AccessibilityId("Teléfono");
    static By divMoreOptions = MobileBy.xpath("//*[@text='Más Opciones'] ");

    @Step
    public void pressButtonSuggestions() {
        $(btnSuggestions).click();
    }

    @Step
    public void validateMoreOptionsScreen() {
        if (!$(divMoreOptions).isDisplayed()) {
            Assert.fail("No se visualizo la pantalla de mas opciones");
        }
    }

}
