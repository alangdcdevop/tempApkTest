package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.thucydides.core.annotations.Steps;
import org.apache.commons.io.FileUtils;
import packages.auth.JwtHandler;
import packages.pageObject.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;


public class CommonSteps {

    @Steps
    private Onboarding onboarding;

    @Steps
    private EnterEmail enterEmail;

    @Steps
    private JwtHandler jwtHandler;

    @Steps
    private Login login;

    @Steps
    private CommonPage commonPage;

    @Steps
    private Home home;


    @And("^el usuario ingresa su huella dactilar$")
    public void elUsuarioIngresaSuHuellaDactilar() {
        login.enterFingerprint();
    }

    @When("^el usuario intenta volver atras$")
    public void elUsuarioIntentaVolverAtras() {
        commonPage.goBack();
    }


    @When("^el usuario accede a Perfil$")
    public void elUsuarioAccedeAPerfil() {
        commonPage.dismissWarning();
        home.goToProfile();
        commonPage.dismissWarning();
    }

    @Given("^el usuario navega a (.*)$")
    public void elUsuarioNavegaA(String url) {
        commonPage.getWebInstitutional(url);
    }

    @Given("^tiro de la barra$")
    public void tiroDeLaBarra() {
        commonPage.openNotifications();
    }

    @Given("^creo un debin para el cliente con mail (.*) y passcode (.*)$")
    public void creoUnDebin(String mail, String passcode) {
        commonPage.creoUnDebin(mail, passcode);
    }

    @And("^el usuario cierra la pantalla principal$")
    public void closeWindow() {
        commonPage.closeWindow();
    }
    
    @And("^scroll down para recargar la vista$")
    public void userScrollDown() {
    	commonPage.userScrollDown();
    }

    @And("^bajar app$")
    public void bajar_app() {
        String urlParaBajarApp = given()
                .when().header("Authorization","Sp6b6HFKU3-Cyq09tdkrM5u_Q4GjQE48gqxdPEkAfW7A4I121HeEWO0Xp4lsQ5O0hax_XSOhAAU3ZuHt2YlqiQ")
                .get("https://api.bitrise.io/v0.1/apps/6325ff8a076da038/builds/f557d7cdc2ac9adc/artifacts/3425d3e55e28b15a")
                .then()
                .log().all()
                .statusCode(200) .extract()
                .path("data.expiring_download_url");

    System.out.println("ITS MY LIFE : " + urlParaBajarApp);

        //FileUtils.copyURLToFile(urlParaBajarApp, File);



    }
    private void writeImageIfNotExists(
            final File outputImagePath,
            final String image_url,
            final String fileNameMain,
            final String fileNamePostExtDetails) throws IOException {

        File outputImageFile = new File(outputImagePath.getPath(),
                fileNameMain + fileNamePostExtDetails);

        if (!outputImageFile.exists()) {

            Map<String, String> cookies = new HashMap();


            byte[] image = RestAssured.given().
                    cookies(cookies).
                    when().get(image_url).
                    asByteArray();

            // output image to file
            OutputStream outStream = new FileOutputStream(outputImageFile);
            outStream.write(image);
            outStream.close();
        }
    }


}

