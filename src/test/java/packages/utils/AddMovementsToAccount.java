package packages.utils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

import java.util.ArrayList;
import java.util.Random;

public class AddMovementsToAccount {


//    private static String baseUrl = "http://api-" + System.getProperty("testing.enviroment") + ".bdsdigital.com.ar/";
    private static String baseUrl="http://api-dev.bdsdigital.com.ar/";
    
    
    public static String newDebin() {
  	
    	RestAssured.urlEncodingEnabled = false;
    	String url = "http://t24-int1.bdsdigital.com.ar:8080/BDSCoa-iris/BDSCoa.svc/AR0010001/verFundsTransfer_BdsCoaDebinDebs()/new";

//    	String auth = ("INPUTT" + ":" + "123456");
//    	String authEncoded =
//    	new String(Base64.encodeBytes(auth.getBytes()));
    	String refNo = RestAssured.given()
    			.header("Authorization", "Basic " + "SU5QVVRUOjEyMzQ1Ng==")
    			.log().all()
    			.header("Content-Type", "application/json")
                .post(url)
                
               .then().extract().xmlPath().get("entry.content.properties.RefNo").toString();
           //     .then().extract().response().getBody().asString();
                return refNo;
                
    }

    public static String authDebin(String refNo, String accountNumber) {
        int i = new Random().nextInt(900000) + 100000;
        String confirmation = RestAssured.given().auth().basic("INPUTT", "123456").log().all()
                .contentType(ContentType.JSON)
                .accept(ContentType.JSON)
                .body("{\"Authoriser\": \"\",\n" + 
                		"    \"CreditAcctNo\": \"ARS100010001\",\n" + 
                		"    \"DateTimeMvGroup\": [\n" + 
                		"        {\n" + 
                		"            \"valuePosition\": \"\",\n" + 
                		"            \"subValuePosition\": \"\",\n" + 
                		"            \"DateTime\": \"\"\n" + 
                		"        }\n" + 
                		"    ],\n" + 
                		"    \"DebitAcctNo\": \""
                		+ accountNumber + 
                		"    \",\n" + 
                		"    \"DebitAmount\": \"10.00\",\n" + 
                		"    \"DebitCurrency\": \"ARS\",\n" + 
                		"    \"Id\": \"\",\n" + 
                		"    \"InputterMvGroup\": [\n" + 
                		"        {\n" + 
                		"            \"valuePosition\": \"\",\n" + 
                		"            \"subValuePosition\": \"\",\n" + 
                		"            \"Inputter\": \"\"\n" + 
                		"        }\n" + 
                		"    ],\n" + 
                		"    \"LCuit\": \"\",\n" + 
                		"    \"LDescConcep\": \"\",\n" + 
                		"    \"LFechaCoelsa\": \"\",\n" + 
                		"    \"LFechaLocal\": \"1209\",\n" + 
                		"    \"LHoraLocal\": \"1200\",\n" + 
                		"    \"LIdCanal\": \"1\",\n" + 
                		"    \"LIdConcepto\": \"\",\n" + 
                		"    \"LIdDebin\": \"\",\n" + 
                		"    \"LIdSecuencia\": \""  + i +
                		"    \",\n" + 
                		"    \"LIdTerminal\": \"121212\",\n" + 
                		"    \"LInstiTrans\": \"\",\n" + 
                		"    \"LNroTarjeta\": \"131123\",\n" + 
                		"    \"LSaldoDisp\": \"\",\n" + 
                		"    \"LTipoMensaje\": \"0202\",\n" + 
                		"    \"OverrideMvGroup\": [\n" + 
                		"        {\n" + 
                		"            \"valuePosition\": \"\",\n" + 
                		"            \"subValuePosition\": \"\",\n" + 
                		"            \"Override\": \"\"\n" + 
                		"        }\n" + 
                		"    ],\n" + 
                		"    \"RefNo\": \""
                		+   refNo + "\",\n" + 
                		"    \"TransactionType\": \"ACD1\"\n" + 
                		"}")
                .post("http://t24-int1.bdsdigital.com.ar:8080/BDSCoa-iris/BDSCoa.svc/AR0010001/verFundsTransfer_BdsCoaDebinDebs(" +refNo + ")")
                .then().extract().response().asString();
        return confirmation;

    }
     
public static void addMovementDebin() {

}
    
}
