package packages;

import cucumber.api.CucumberOptions;
import io.appium.java_client.AppiumDriver;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import net.thucydides.core.annotations.Managed;
import org.junit.AfterClass;
import org.junit.runner.RunWith;
import packages.drivers.AndroidAppiumDriver;
import packages.stepdefinitions.LoginSteps;
import packages.utils.MailHandler;
import packages.utils.PeopleHubMySQL;

import static io.restassured.RestAssured.given;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        plugin = {"pretty"},
        features = "src/test/resources/features",
        tags = "not @manual"
)
public class CucumberTestSuite {

    @Managed(driver = "appium")
    public static AppiumDriver driver;


    public static AppiumDriver getDriver() {
        return driver;
    }

    @AfterClass
    public static void tearDown() { //VER COMO REIMPLEMENTAR, NO TENEMOS PERMISO DE ESCRITURA EN PEOPLEHUB INT
       /* if (System.getProperty("testing.driver").equalsIgnoreCase("android-web")) {
    public static void tearDown() {
        if (System.getProperty("testing.driver").equalsIgnoreCase("android-web")) {
            AndroidAppiumDriver.getDriver().resetApp();

            AndroidAppiumDriver.getDriver().quit();
        } else {
            String mail = LoginSteps.getMail();
            String keycloakUserId = MailHandler.getKeyCloakUserId();
            if (mail != null) {

                given()
                        .contentType(io.restassured.http.ContentType.JSON)
                        .log().ifValidationFails()
                        .body("{\"deviceId\":\"" + System.getProperty("deviceId") + "\"}")
                        .post(MailHandler.getTokenIssuer() + "/credentials/" + keycloakUserId + "/unlink-account")
                        .then()
                        .assertThat()
                        .statusCode(200);
            }

            PeopleHubMySQL.unlinkDevices();
        }*/
    }
}
