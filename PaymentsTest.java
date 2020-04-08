package packages.pageObject;

import io.appium.java_client.MobileBy;
import net.thucydides.core.annotations.Step;
import org.openqa.selenium.By;


public class PaymentsTest extends CommonPage {

    static By tabPagos         = MobileBy.AccessibilityId("tabPagos");


    @Step
    public void usuario_accede_a_pagosTest() {
        try {
            Thread.sleep(20000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        $(tabPagos).click();
    }




}
