package packages.auth;

import io.restassured.http.ContentType;

import static io.restassured.RestAssured.given;

public class ClientsAuth {

    private static String baseUrl="https://auth-"+System.getProperty("testing.enviroment")+".bdsdigital.com.ar";
    private static String linkAccountTokenPath="/auth/v1/link-account-token";


    public static String getActionToken(String mail){
        System.out.println("CREATING ACTION TOKEN WITH DEVICEID: "+System.getProperty("deviceId"));
        return given().log().all()
                .contentType(ContentType.JSON)
                .body("{\n" +
                        "    \"deviceId\": \""+System.getProperty("deviceId")+"\",\n" +
                        "    \"email\": \""+mail+"\",\n" +
                        "    \"appBundleId\": \"ar.com.bdsol.bds.squads."+System.getProperty("testing.enviroment")+"\"\n" +
                        "}")
                .post(baseUrl+linkAccountTokenPath)
                .getBody()
                .jsonPath()
                .get("actionToken")
                .toString();
    }
}
