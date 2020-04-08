package packages.pageObject;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;
import packages.CucumberTestSuite;
import packages.drivers.AndroidAppiumDriver;

import java.util.List;


public class Payments extends CommonPage {

    static By tabPagos         = MobileBy.AccessibilityId("tabPagos");
    static By botonRecargas    = MobileBy.AccessibilityId("Seccion de recargas");
    static By botonPagar       = MobileBy.AccessibilityId("Buscar Empresa");
    static By botonFinalizar   = MobileBy.AccessibilityId("Finalizar");
    static By botonAtrasClass  =MobileBy.className("android.widget.ImageButton");
    static By selecCategoria   =MobileBy.className("Ir a rubros de ");
    static By selecEmpresa     =MobileBy.className("Empresas de ");
    static By codigoPago       =MobileBy.className("Ingresa el codigo de pago");
    static By botonContinuar   =MobileBy.className("Continuar");
    static By textoNOTenesVenc =MobileBy.className("No tenés vencimientos informados para ");
    static By agendarServicio =MobileBy.className("Agendar servicio");
    static By irAServiciosAgendados =MobileBy.className("Ir a servicios agendados");
    static By montoCampo =MobileBy.className("Ingresa el monto a pagar");
    static By facturaAnual =MobileBy.className("Ingresa el monto a pagar"); //TODO
    static By detalleServicioAgendado =MobileBy.className("Detalle de servicio agendado");


    @Step
    public void usuario_accede_a_pagos() {
        try {
            Thread.sleep(20000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        $(tabPagos).click();
    }

    @Step
    public void usuario_accede_a_recargas() {
        $(botonRecargas).click();
    }

    @Step
    public void usuario_selecciona_Boton_Pagar() {
        $(botonPagar).click();
    }

    @Step
    public void usuario_presiona_Finalizar() {
        $(botonFinalizar).click();
    }

    @Step
    public void usuario_presiona_Boton_Volver_Atras() {
        $(botonAtrasClass).click();
    }

    @Step
    public void userSelectCategoria(String categoria) {
        $(selecCategoria+categoria).click();
    }

    @Step
    public void userSelectSubCategoria(String subcat) {
        $(selecEmpresa+subcat).click();
    }

    @Step
    public void userCompleteCodigoOKandPressContinuar(String codigo, String tipoCodigo) {

        By boton = MobileBy.AccessibilityId("Ingresa el codigo de pago");
        $(boton).waitUntilEnabled();

        $(boton).type("1");


    }






    @Step
    public void systemShowsNoPoseeVencimientos(String empresa, String codigo) {
        $(textoNOTenesVenc+empresa+" "+codigo).waitUntilVisible();
    }

    @Step
    public void systemPermiteAgendar() {
        $(agendarServicio).waitUntilVisible();
    }

    @Step
    public void userClickAgendarServicio() {
        $(agendarServicio).click();
    }

    @Step
    public void userClickVerServiciosAgendados() {
        $(irAServiciosAgendados).click();
    }

    @Step
    public void systemShowsServicioAgendad(String alias, String servicio) {
        int largo = servicio.length();
        $(alias +" "+ servicio.substring(1,largo-1)).click();
    }

    @Step
    public void userIngresaMonto(String monto) {
        $(montoCampo).sendKeys(monto);
    }

    @Step
    public void systemsPresentaMnsaje(String mensaje) {
        By boton = MobileBy.AccessibilityId(mensaje);
        $(boton).waitUntilVisible();
    }

    @Step
    public void usuario_selecciona_factura_mensual(String cuota, String servicio, String valor, String vencimiento) {
        $(cuota+" de "+servicio+" en el valor de "+valor+" pesos con vencimiento el "+vencimiento).waitUntilVisible();
    }

    @Step
    public void usuario_selecciona_factura_Anual() {
        $(facturaAnual).click();
    }


    @Step
    public void sistema_indica_El_codigo_ingresado_es_incorrecto(String mensaje) {
        By boton = MobileBy.AccessibilityId(mensaje);
//        By boton = MobileBy.linkText(mensaje);

        $(boton).waitUntilVisible();
    }


    //
    @Step
    public void sistema_muestra_texto(String mensaje) {
//       By boton = MobileBy.xpath("/*[@text=\'El código ingresado no es válido\']");
//        $(boton).waitUntilPresent();


    }

    @Step
    public void sistema_no_presenta_factura_mensual(String cuota, String servicio, String valor, String vencimiento) {
        $(cuota+" de "+servicio+" en el valor de "+valor+" pesos con vencimiento el "+vencimiento).waitUntilNotVisible();
    }

    @Step
    public void sistema_presenta_factura_anual_de_servicio() {
        $(facturaAnual).waitUntilVisible();
    }

    @Step
    public void usuario_selecciona(String opcion) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        By boton = MobileBy.AccessibilityId(opcion);
        $(boton).waitUntilVisible();
        $(boton).click();
    }

    @Step
    public void usuario_presiona_servicio_agendado(String alias, String empresa) {
        $(alias+" "+empresa).click();
    }

    @Step
    public void sistema_muestra_detalle_de_servicio_agendado() {
        $(detalleServicioAgendado).waitUntilVisible();
    }

    @Step
    public void sistema_no_muestra_el_valor(String valor) {
        By field = MobileBy.AccessibilityId(valor);
        $(field).waitUntilNotVisible();
    }

    @Step
    public void usuario_completa_el_campo(String campo, String valor) {
        By field = MobileBy.AccessibilityId(campo);
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        $(field).waitUntilVisible();
        $(field).waitUntilClickable();
        $(field).clear();
        $(field).select();
        $(field).sendKeys(valor);
    }

    public void sistema_deshabilita_boton(String botonLabel) {
        By boton = MobileBy.AccessibilityId(botonLabel);

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Step
    public void prueba(String botonLabel) {
        By boton = MobileBy.AccessibilityId(botonLabel);

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }


    }

    public void sistema_muestra_elemento_con_texto(String elemento, String texto) {
        By element = MobileBy.AccessibilityId(elemento);
        $(element).waitUntilVisible();

        String textoElement = $(element).getText();

        Assert.assertEquals(texto,textoElement);
    }
}
