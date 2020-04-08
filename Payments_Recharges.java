package packages.pageObject;

import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;

public class Payments_Recharges extends CommonPage {


    static By opcionFavorito   = MobileBy.AccessibilityId(" de "); //[Alias] de [Empresa]

    static By botonCelular     = MobileBy.AccessibilityId("Empresas de celular");
    static By botonTransporte  = MobileBy.AccessibilityId("Empresas de Transporte");
    static By botonTelevision  = MobileBy.AccessibilityId("Empresas de televisión");

    static By conteinerEmpresa = MobileBy.AccessibilityId("SUBE"); //container: [empresa]
    static By campoNroTarjeta  = MobileBy.AccessibilityId("campo de texto"); //Ingresa el [code type]


    static By botonImporte     = MobileBy.AccessibilityId("Recargar 150"); // Recargar [monto]
    static By botonContinuar   = MobileBy.AccessibilityId("Continuar");


    static By botonPagar     = MobileBy.AccessibilityId("Pagar"); // Recargar [monto]


    static By textoEmpresaPesos= MobileBy.AccessibilityId("Vas a pagar a [empresa] [N] pesos"); // "Vas a pagar a [empresa] [N] pesos"

    static By textoDesde       = MobileBy.AccessibilityId("Desde tu caja de ahorro finalizada en [4 dígitos finales]"); // Desde tu caja de ahorro finalizada en [4 dígitos finales]
    static By textoCodRecarga  = MobileBy.AccessibilityId("[Code type] code type");//[Code type] code type

    static By textoAlias       = MobileBy.AccessibilityId("[Alias] alias");//[Alias] alias
    static By botonConfirmar   = MobileBy.AccessibilityId("Confirmar");//[Alias] alias



    public void usuario_selecciona_Recarga_Transporte() {
        $(botonTransporte).click();
    }

    public void usuario_selecciona_empresa(String empresa) {
        By conteinerEmpresa = MobileBy.AccessibilityId(empresa);
        $(conteinerEmpresa).click();
    }

    public void usuario_ingresa_nro_de_tarjeta(String nroTarj) {

        $(campoNroTarjeta).click();
        $(campoNroTarjeta).sendKeys(nroTarj);

    }
    public void usuario_presiona_continuar() {
        $(botonContinuar).click();
    }

    public void usuario_selecciona_importe(String importe) {
        $(botonImporte).click();
    }

    public void usuario_presiona_Pagar() {
        $(botonPagar).click();
    }

    public void sistema_presenta_mensaje_Recarga_Efectuada() {
    }


    public void sistema_presenta_nro_tarjeta_en_Recientes(String nroTarjeta) {
    }


}
