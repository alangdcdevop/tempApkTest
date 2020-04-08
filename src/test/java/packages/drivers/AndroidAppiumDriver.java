package packages.drivers;

import com.google.common.collect.ImmutableMap;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.remote.AndroidMobileCapabilityType;
import io.appium.java_client.remote.MobileCapabilityType;
import net.thucydides.core.webdriver.DriverSource;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class AndroidAppiumDriver implements DriverSource {

    private static AndroidDriver driver;

    @Override
    public AndroidDriver newDriver() {
        try {
            DesiredCapabilities desiredCapabilities = new DesiredCapabilities();
            desiredCapabilities.setCapability(MobileCapabilityType.PLATFORM_NAME, "Android");
            desiredCapabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "Android Device");
            desiredCapabilities.setCapability(MobileCapabilityType.CLEAR_SYSTEM_FILES, true);
            desiredCapabilities.setCapability(MobileCapabilityType.AUTOMATION_NAME, "uiautomator2");
            desiredCapabilities.setCapability(MobileCapabilityType.NEW_COMMAND_TIMEOUT, "200");
            if (System.getProperty("testing.driver").equalsIgnoreCase("android")) {
                File app = new File(System.getProperty("testing.apkPath"), System.getProperty("testing.apkName"));
                desiredCapabilities.setCapability(MobileCapabilityType.APP, app.getAbsolutePath());
                desiredCapabilities.setCapability(AndroidMobileCapabilityType.AUTO_GRANT_PERMISSIONS, "true");
            }
            if (System.getProperty("testing.driver").equalsIgnoreCase("android-web")) {
                desiredCapabilities.setCapability(MobileCapabilityType.BROWSER_NAME, "Chrome");
                desiredCapabilities.setCapability("appium:chromeOptions", ImmutableMap.of("w3c", false));
            }
            URL url_appium = new URL("http://0.0.0.0:4723/wd/hub");
            driver = new AndroidDriver<>(url_appium, desiredCapabilities);
            return driver;
        } catch (IOException e) {
            throw new Error(e);
        }
    }

    public static AndroidDriver getDriver() {
        return driver;
    }

    @Override
    public boolean takesScreenshots() {
        return true;
    }

}
