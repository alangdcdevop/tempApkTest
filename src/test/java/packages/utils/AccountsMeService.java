package packages.utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import org.junit.Test;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import gherkin.deps.net.iharder.Base64;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;

public class AccountsMeService {

    private static String baseUrl="http://api-dev.bdsdigital.com.ar/";
    
    public static ArrayList accountsMe(String token) {

    	ArrayList accountNumber = RestAssured.given()
              .log().all()
             .header("Authorization", "Bearer " + token)
             .contentType(ContentType.JSON)
             .get("http://api-dev.bdsdigital.com.ar/accounts/v1/me")
             .then().extract().jsonPath().get("accountNumber");
          // .then().extract().statusCode();
         // 	System.out.println(accountNumber);
                return accountNumber;   
                
    }
    
    public static String getAccountBalance(String token) {

    	ArrayList accountB = RestAssured.given()
              .log().all()
             .header("Authorization", "Bearer " + token)
             .contentType(ContentType.JSON)
             .get("http://api-dev.bdsdigital.com.ar/accounts/v1/me")
             .then().extract().jsonPath().get("availableBalance");
          // .then().extract().statusCode();
         // 	System.out.println(accountNumber);
    	        String accountBalance = accountB.get(0).toString();
                return accountBalance;   
                
    }
    
    
}
