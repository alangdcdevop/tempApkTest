package packages.utils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.openqa.selenium.remote.SessionId;

public class AppiumApis {


    public void sendKeysApi(SessionId session) {
        RestAssured.given()
                .log().all()
                .contentType(ContentType.JSON)
                .body("{\"value\":[\"13\"]}")
                .post("/wd/hub/session/" + session + "/element/1/value")
                .then()
                .statusCode(200);

    }
}
