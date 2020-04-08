package packages.pageObject;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import packages.CucumberTestSuite;
import packages.drivers.AndroidAppiumDriver;

import java.util.List;

import static org.openqa.grid.common.SeleniumProtocol.Selenium;




public class Payments extends CommonPage {

    static By tabPagos         = MobileBy.AccessibilityId("PAYMENTS_TAB");

    // User acction
    public void usuario_accede_a_pagos() {
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        $(tabPagos).click();

    }

    public void usuario_presiona_Boton_Volver_Atras() {
        AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.BACK));
    }

    public void usuario_selecciona(String opcion) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        By boton = MobileBy.AccessibilityId(opcion);
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(MobileBy.AccessibilityId(opcion)).click();
    }

    public void usuario_completa_el_campo(String campo, String valor) {
        By field = MobileBy.AccessibilityId(campo);
        $(field).waitUntilVisible();

        AndroidAppiumDriver.getDriver().findElement(MobileBy.AccessibilityId(campo)).clear();

        $(field).sendKeys(valor);

    }

    public void usuario_presiona_borrar(int veces) {
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        AndroidAppiumDriver.getDriver().getKeyboard();
//        Boolean isKeyboardShown = !AndroidAppiumDriver.getDriver().isKeyboardShown();
//        while
//        (isKeyboardShown){
//            System.out.println("Wait for keyboard to be shown");
//            isKeyboardShown = !AndroidAppiumDriver.getDriver().isKeyboardShown();
//        }

        for (int i = 0; i < veces; ++i) {
            AndroidAppiumDriver.getDriver().pressKey(new KeyEvent(AndroidKey.DEL));
        }

    }

    public void usuario_esconde_teclado() {
        AndroidAppiumDriver.getDriver().hideKeyboard();
    }

    // System validations
    public void sistema_indica(String mensaje) {
        By boton = MobileBy.AccessibilityId(mensaje);
        $(boton).waitUntilVisible();
    }

    public void sistema_no_muestra_el_valor(String valor) {
        By field = MobileBy.AccessibilityId(valor);
        $(field).waitUntilNotVisible();
    }

    public void sistema_deshabilita_boton(String botonLabel) {
        By boton = MobileBy.AccessibilityId(botonLabel);

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void sistema_muestra_elemento_con_texto(String elemento, String texto) {
        By element = MobileBy.AccessibilityId(elemento);
        $(element).waitUntilPresent();

        String textoElement = $(element).getText();

        Assert.assertEquals(texto,textoElement);
    }

    // Auxiliares con XPATH
    public void usuario_presiona_Agendar_Nuevo() {
        By boton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.View");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();

    }
    public void usuario_completa_buscador_Agenda_con_valor(String valor) {
        By boton = MobileBy.xpath("//android.widget.EditText[@content-desc=\"Buscar servicio agendado\"]\n");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).sendKeys(valor);

    }
    public void usuario_presiona_Guardar_Servicio() {
        By boton = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"Guardar servicio\"]/android.view.ViewGroup/android.view.View\n");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();

    }
    public void usuario_presiona_la_X() {
        By boton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.ImageButton\n");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();

    }
    public void usuario_presiona_Editar_Alias() {
        By boton = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"Editar alias\"]/android.widget.TextView");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();

    }
    public void usuario_presiona_Guardar() {
        By boton = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"Guardar nuevo alias de servicio\"]/android.widget.TextView");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_Olvidar() {
        By boton = MobileBy.xpath("(//android.view.ViewGroup[@content-desc=\"Olvidar este servicio\"])[2]");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_SUBE() {
        By boton = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"SUBE\"]");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_Nueva_Recarga() {
        By boton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.View");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_Olvidar_Confirmar() {
        By boton = MobileBy.xpath("(//android.view.ViewGroup[@content-desc=\"Olvidar este servicio\"])[2]\n");
        $(boton).waitUntilVisible();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_Editar_alias_de_tarjeta() {
        By boton = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup[4]/android.widget.TextView");
        $(boton).waitUntilEnabled();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }
    public void usuario_presiona_guardar_alias() {
        By boton = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"Guardar nuevo alias de servicio\"]/android.widget.TextView");
        $(boton).waitUntilEnabled();
        AndroidAppiumDriver.getDriver().findElement(boton).click();
    }


    public void sistema_muestra_alerta_con_texto(String texto) {
        By element = MobileBy.xpath("/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.TextView");

        $(element).waitUntilPresent();
        String textoElement = $(element).getText();
        Assert.assertEquals(texto,textoElement);
    }
    public void sistema_muestra_xpath_con_texto(String elem, String texto) {
        By element = MobileBy.xpath(elem);

        $(element).waitUntilEnabled();
        String textoElement = $(element).getText();

        String nuevotextoElement = textoElement.replace("\n","");
        String nuevotexto =texto.replace("\n","");

        Assert.assertEquals(nuevotexto,nuevotextoElement);
    }
    public void sistema_permite_compartir() {
        By element = MobileBy.xpath("//android.view.ViewGroup[@content-desc=\"Compartir comprobante\"]/android.widget.ImageView");
        $(element).waitUntilPresent();

    }

    //

    public void verTextoElemento(String elem){
        By element = MobileBy.xpath(elem);

        $(element).waitUntilEnabled();
        String textoElement = $(element).getText();
        System.out.println("Texto elemento:"+ textoElement);
    }



    public void refresh_app() {
        AndroidAppiumDriver.getDriver().resetApp();
    }


}
