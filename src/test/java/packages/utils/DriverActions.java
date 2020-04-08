package packages.utils;

import com.google.common.collect.ImmutableMap;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import net.thucydides.core.webdriver.SerenityWebdriverManager;
import net.thucydides.core.webdriver.WebDriverFacade;
import org.openqa.selenium.JavascriptExecutor;
import packages.drivers.AndroidAppiumDriver;
import packages.drivers.IOSAppiumDriver;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DriverActions {

    private static WebDriverFacade appium = (WebDriverFacade) SerenityWebdriverManager.inThisTestThread().getActiveDrivers().get(0);

    public static void get(String url) {
        String driver = System.getProperty("testing.driver");
        if (driver.toLowerCase().equals("ios")) {
            String deepLinkURL = "deeplink://" + url;
            appium.executeScript("mobile: terminateApp", ImmutableMap.of("bundleId", "com.apple.mobilesafari"));

            List args = new ArrayList();
            args.add("-U");
            args.add(deepLinkURL);

            Map<String, Object> params = new HashMap<>();
            params.put("bundleId", "com.apple.mobilesafari");
            params.put("arguments", args);

            appium.executeScript("mobile: launchApp", params);

            appium.findElement(MobileBy.AccessibilityId("Open")).click();
        } else {
            appium.get(url);
        }
    }

    public static void scrollDownToText(String text) {
        String platform = System.getProperty("testing.driver");
        if (platform.equalsIgnoreCase("android")) {
            AndroidDriver androidDriver = AndroidAppiumDriver.getDriver();
            androidDriver.findElementByAndroidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView(text(\"" + text + "\"));");
        }
        if (platform.equalsIgnoreCase("ios")) {
            AndroidDriver driver = AndroidAppiumDriver.getDriver();
            IOSDriver iosDriver = IOSAppiumDriver.getDriver();

            JavascriptExecutor js = iosDriver;
            Map<String, Object> params = new HashMap<>();
            params.put("direction", "down");
            while (!iosDriver.findElementByXPath("//*[@text='" + text + "']").isDisplayed())
                js.executeScript("mobile: scroll", params);
        }
    }
}
