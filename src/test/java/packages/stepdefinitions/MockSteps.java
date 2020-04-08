package packages.stepdefinitions;

import cucumber.api.java.en.Given;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import packages.utils.MailHandler;

public class MockSteps {

    @Given("^el usuario tiene (\\d+) pesos en la cuenta$")
    public void el_usuario_tiene_n_pesos(Float saldo) {
        RestAssured.given()
                .contentType(ContentType.JSON)
                .body("{\n" +
                        "    \"request\": {\n" +
                        "        \"method\": \"GET\",\n" +
                        "        \"url\": \"/accounts/v1/me\"\n" +
                        "    },\n" +
                        "    \"response\": {\n" +
                        "        \"status\": 200,\n" +
                        "        \"jsonBody\": [\n" +
                        "   {\n" +
                        "       \"cbu\": \"3108100900010000007321\",\n" +
                        "       \"alias\": \"\",\n" +
                        "       \"coreId\": \"AA19212JDQ3V\",\n" +
                        "       \"accountNumber\": \"1000000732\",\n" +
                        "       \"name\": \"CAJA.AHORROS.BANDA\",\n" +
                        "       \"accountType\": \"CA\",\n" +
                        "       \"availableBalance\": " + saldo + ",\n" +
                        "       \"ledgerBalance\": 0.00,\n" +
                        "       \"currency\": \"ARS\",\n" +
                        "       \"categoryId\": \"6002\",\n" +
                        "       \"workingBalance\": " + saldo + ",\n" +
                        "       \"onlineActualBalance\": 1097927.29,\n" +
                        "       \"sortCode\": 601613,\n" +
                        "       \"customerNumber\": " + MailHandler.getCoreClientId() + ",\n" +
                        "       \"productGroup\": \"PERSONA.FISICA.HUMANA\",\n" +
                        "       \"productLine\": \"ACCOUNTS\",\n" +
                        "       \"productName\": \"CAJA.AHORROS.BANDA\",\n" +
                        "       \"availLimit\": 0.00,\n" +
                        "       \"ibandId\": \"NA\",\n" +
                        "       \"branch\": \"BANCO DEL SOL\",\n" +
                        "       \"accTransRights\": \"YES\",\n" +
                        "       \"openingDate\": \"20190731\",\n" +
                        "       \"productDescription\": \"Caja de Ahorro por Banda\",\n" +
                        "       \"accSeeRights\": \"YES\"\n" +
                        "   }\n" +
                        "]\n" +
                        "    }\n" +
                        "}")
                .post("https://dev-mock.bdsdigital.com.ar/__admin/mappings")
                .then()
                .statusCode(201);


    }


}
