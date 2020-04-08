package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.openqa.selenium.By;

public class Payments_Agenda extends CommonPage {

    static By shortcutPagarServicioAgendado    = MobileBy.AccessibilityId("Pagar servicio agendado");
    static By serviciosConVencimiento          = MobileBy.AccessibilityId("Servicios con Vencimiento");
    static By botonContinuar                   = MobileBy.AccessibilityId("Continuar");
    static By monto_a_pagar                    = MobileBy.AccessibilityId("Ingresa el monto a pagar");
    static By no_tiene_vencimientos_pendientes = MobileBy.AccessibilityId("No tenés servicios informados para este servicio");



    @Step
    public void usuario_selecciona_shortcut_Pagar_Servicio_Agendado() {
        $(shortcutPagarServicioAgendado).click();
    }

    @Step
    public void sistema_muestra_servicios_agendados() {
        $(serviciosConVencimiento).waitUntilVisible();
    }

    @Step
    public void usuario_selecciona_servicio_con_vencimiento(String alias, String empresa) {
        $(alias+" "+empresa).click();
    }

    @Step
    public void sistema_redirige_al_usuario_al_flujo_de_pago_bajo() {
        $(botonContinuar).waitUntilVisible();
    }

    @Step
    public void sistema_muestra_monto_predeterminado() {
        $(monto_a_pagar).waitUntilVisible();
    }

    @Step
    public void usuario_completa_pago() {
        $(botonContinuar).click();
    }

    @Step
    public void sistema_indica_no_tiene_vencimientos_pendientes() {
        $(no_tiene_vencimientos_pendientes).waitUntilVisible();
    }

    public void sistema_indica_tiene_vencimientos_pendientes() {
        $(botonContinuar).waitUntilVisible();
    }


}
