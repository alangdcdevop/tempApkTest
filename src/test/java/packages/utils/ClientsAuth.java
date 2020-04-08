package packages.utils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import net.thucydides.core.annotations.Step;

public class ClientsAuth {

    private static String baseUrl = "https://api-" + System.getProperty("testing.enviroment") + ".bdsdigital.com.ar";
    private static String signUpPath = "/auth/v1/sign-up";

    @Step
    public static String createUser(String mail, String coreId, String nombre, String apellido, String fecNac, String dni, String altura, String passcode) {
        return RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{" +
                        "\"email\": \"" + mail + "\"," +
                        "\"clientId\": \"" + coreId + "\"," +
                        "\"coreClientId\": \"" + coreId + "\"," +
                        "\"deviceId\": \"ffeq\"," +
                        "\"firstName\": \"" + nombre + "\"," +
                        "\"lastName\": \"" + apellido + "\"," +
                        "\"birthDate\": \"" + fecNac + "\"," +
                        "\"idNumber\": \"" + dni + "\"," +
                        "\"streetNumber\": \"" + altura + "\"," +
                        "\"passcode\": \"" + passcode + "\"" +
                        "}")
                .post(baseUrl + signUpPath)
                .then()
                .statusCode(201)
                .contentType(ContentType.HTML)
                .extract()
                .body()
                .asString();
    }

}
