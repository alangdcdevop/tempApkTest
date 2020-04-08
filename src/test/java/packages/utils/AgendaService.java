package packages.utils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

import java.util.ArrayList;

public class AgendaService {


    private static String baseUrl = "http://api-" + System.getProperty("testing.enviroment") + ".bdsdigital.com.ar/";


    public static String getToken(String mail, String passcode) {
        String accessToken = RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{\n" +
                        "  \"username\": \""
                        + mail
                        + "\",\n" +
                        "  \"passcode\": \""
                        + passcode
                        + "\"\n" +
                        "}")
                .post(baseUrl + "auth/v1/sign-in")
                .then()
                .extract().jsonPath().get("accessToken");
        System.out.println("ACCESS TOKEN :" + accessToken);
        return accessToken;
    }

    public static void deleteContact(String accessToken, String cuil) {

        String message = RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .headers("Authorization", "Bearer " + accessToken)
                .delete("http://dev-customers.bdsdigital.com.ar/contacts/" + cuil)
                .then()
                .extract().jsonPath().get("message");
        System.out.println("response body :" + message);
    }

    public static ArrayList getContactsList(String accessToken) {

        ArrayList response = RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .header("Authorization", "Bearer " + accessToken)
                .get("http://dev-customers.bdsdigital.com.ar/contacts")
                .then()
                .extract().jsonPath().get("cuit");
        //      System.out.println("response body :" + response );
        return response;
    }

    public static void deleteAllContacts(String accessToken, ArrayList response) {

        for (int x = 0; x < response.size(); x++) {
            //	  System.out.println(response.get(x));

            if (response.get(x) != null) {
                System.out.println(response.get(x));


                String message = RestAssured.given()
                        .log().all()
                        .contentType(ContentType.JSON)
                        .headers("Authorization", "Bearer " + accessToken)
                        .delete("http://dev-customers.bdsdigital.com.ar/contacts/" + response.get(x).toString())
                        .then()
                        .extract().jsonPath().get("message");
                System.out.println("response body :" + message);
            }
        }
    }

}
