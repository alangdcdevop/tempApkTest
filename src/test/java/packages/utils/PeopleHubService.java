package packages.utils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

public class PeopleHubService {

    private static String baseUrl = "https://" + System.getProperty("testing.enviroment") + "-people.bdsdigital.com.ar/clients/";

    public static void createUser(String keycloakUserId, String mail, String coreId, String nombre, String apellido, String fecNac, String dni, String altura, String cuil, String zip) {
        RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{\n" +
                        " \"state\": \"COMPLETE_SIGNUP_EMAIL_SENT\",\n" +
                        " \"deviceId\": \"asdadsd\",\n" +
                        " \"appBundleId\": \"asdasda\",\n" +
                        " \"contactInfo\": {\n" +
                        "   \"procedure\": \"00125064678\",\n" +
                        "   \"name\": \"" + nombre + "\",\n" +
                        "   \"lastName\": \"" + apellido + "\",\n" +
                        "   \"gender\": \"M\",\n" +
                        "   \"dni\": \"" + dni + "\",\n" +
                        "   \"cuit\": \"" + cuil + "\",\n" +
                        "   \"cuil\": \"" + cuil + "\",\n" +
                        "   \"type\": \"B\",\n" +
                        "   \"birthDate\": \"" + fecNac + "\",\n" +
                        "   \"createdAt\": \"29/07/2012\"\n" +
                        " },\n" +
                        " \"faceUrl\": \"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Ffaces%2F5db09e113a3afc2d5cd75e63?alt=media&token=865b1133-2b94-4df1-b81d-4479ce67e373\",\n" +
                        " \"gestureUrl\": \"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fvideos%2Fgestures%2F5db09e113a3afc2d5cd75e63?alt=media&token=d094bd88-1c2e-4b26-bdc3-dd6c32c31ce9\",\n" +
                        " \"idFrontUrl\": \"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Ffront%2F5db09e113a3afc2d5cd75e63?alt=media&token=536eff43-2b5d-4a0b-88c1-9e3f3b56b055\",\n" +
                        " \"idBackUrl\": \"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Fback%2F5db09e113a3afc2d5cd75e63?alt=media&token=e09de22a-51d7-4d12-9d78-d78c9fd1f8b2\",\n" +
                        " \"address\": {\n" +
                        "   \"street\": \"Alvarez Thomas\",\n" +
                        "   \"number\": \"" + altura + "\",\n" +
                        "   \"province\": \"02\",\n" +
                        "   \"location\": \"02091010002\",\n" +
                        "   \"floor\": \"7\",\n" +
                        "   \"department\": \"G\",\n" +
                        "   \"notes\": null,\n" +
                        "   \"zip\": \"" + zip + "\"\n" +
                        " },\n" +
                        " \"termsAccepted\": {\n" +
                        "   \"termsVersion\": \"5d9b4352a64fff9085313965\",\n" +
                        "   \"acceptanceDate\": \"2019-10-23T19:57:15.377Z\"\n" +
                        " },\n" +
                        " \"faceIdData\": {},\n" +
                        " \"obligatedSubject\": {\n" +
                        "   \"occupation\": \"CURRENCY_SELLER\"\n" +
                        " },\n" +
                        " \"pep\": {\n" +
                        "   \"relation\": \"FAMILY\",\n" +
                        "   \"relationType\": \"FRIEND\",\n" +
                        "   \"charge\": \"Presidente\"\n" +
                        " },\n" +
                        " \"fatca\": true,\n" +
                        " \"email\": \"" + mail + "\",\n" +
                        " \"keycloakId\": \"" + keycloakUserId + "\",\n" +
                        " \"coreClientId\": \"" + coreId + "\"\n" +
                        "}")
                .post(baseUrl)
                .then()
                .statusCode(201);
    }
}
