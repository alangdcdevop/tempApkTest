package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.openqa.selenium.By;

public class EnterEmail extends CommonPage {
    static By emailInput = MobileBy.AccessibilityId("campo de texto");
    static By botonConfirmarMail = MobileBy.AccessibilityId("Boton Continuar");
    static By mailInvalido = MobileBy.AccessibilityId("mensaje de error");

    @Step("el usuario ingresa el correo (.*)$")
    public void enterMail(String mail) {
        $(emailInput).sendKeys(addSquadToEmailAddress(mail));
    }

    @Step("el usuario confirma el correo")
    public void confirmEmail() {
        $(botonConfirmarMail).click();
    }

    @Step("se informa que el email es invalido")
    public void showsInvalidMail() {
        $(mailInvalido).waitUntilVisible();
    }

}
