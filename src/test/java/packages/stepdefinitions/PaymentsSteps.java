package packages.stepdefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Payments;
import packages.pageObject.Payments_Agenda;
import packages.pageObject.Payments_Recharges;
import static io.restassured.RestAssured.given;

import javax.xml.transform.sax.SAXResult;

public class PaymentsSteps {

    @Given("^Reset wiremock$")
    public void reset_wiremock(){
        //__admin/reset
        given().when().post("http://localhost:8080/__admin/mappings/reset").then().statusCode(200);
    }

    @Given("^Get to wiremock (.*)$")
    public void reset_wiremock(String url){
        //__admin/reset
        given().when().get("http://localhost:8080"+url).then().statusCode(200);
    }

    @Given("^refresh app$")
    public void refresh_app(){
        payments.refresh_app();
    }


    @Steps
    private Payments payments;

    @Then("^usuario accede a pagos$")
    public void usuario_accede_a_pagos(){
        payments.usuario_accede_a_pagos();
    }

    @Then("^usuario presiona Boton Volver Atras$")
    public void usuario_presiona_Boton_Volver_Atras(){
        payments.usuario_presiona_Boton_Volver_Atras();
    }

    @When("^usuario selecciona (.*)$")
    public void usuario_selecciona(String opcion) {
        payments.usuario_selecciona(opcion);
    }

    @When("^usuario completa el campo (.*) con el valor (.*)$")
    public void usuario_completa_el_campo(String campo, String valor) {
        payments.usuario_completa_el_campo(campo, valor);
    }

    @When("^usuario ingresa el valor (.*)$")
    public void usuario_ingresa_el_valor(String valor) {
        payments.usuario_ingresa_el_valor(valor);
    }

    @When("^usuario presiona borrar (.*) veces$")
    public void usuario_presiona_borrar(int veces) {
        payments.usuario_presiona_borrar(veces);
    }

    @When("^usuario esconde teclado$")
    public void usuario_esconde_teclado() {
        payments.usuario_esconde_teclado();
    }

    @When("^usuario completa buscador agenda con valor (.*)$")
    public void usuario_completa_buscador_Agenda_con_valor(String valor) {
        payments.usuario_completa_buscador_Agenda_con_valor(valor);
    }




    // Auxiliares con xpath
    @When("^usuario presiona Agendar Nuevo$")
    public void usuario_presiona_Agendar_Nuevo() {
        payments.usuario_presiona_Agendar_Nuevo();
    }

    @When("^usuario presiona Guardar Servicio$")
    public void usuario_presiona_Guardar_Servicio() {
        payments.usuario_presiona_Guardar_Servicio();
    }

    @When("^usuario presiona la X$")
    public void usuario_presiona_la_X() {
        payments.usuario_presiona_la_X();
    }

    @When("^usuario presiona Editar Alias$")
    public void usuario_presiona_Editar_Alias() {
        payments.usuario_presiona_Editar_Alias();
    }

    @When("^usuario presiona Guardar$")
    public void usuario_presiona_Guardar() {
        payments.usuario_presiona_Guardar();
    }

    @When("^usuario presiona Olvidar$")
    public void usuario_presiona_Olvidar() {
        payments.usuario_presiona_Olvidar();
    }

    @When("^usuario presiona Olvidar Confirmar$")
    public void usuario_presiona_Olvidar_Confirmar() {
        payments.usuario_presiona_Olvidar_Confirmar();
    }

    @When("^usuario presiona SUBE$")
    public void usuario_presiona_SUBE() {
        payments.usuario_presiona_SUBE();
    }

    @When("^usuario presiona Nueva Recarga$")
    public void usuario_presiona_Nueva_Recarga() {
        payments.usuario_presiona_Nueva_Recarga();
    }

    @When("^Sistema muestra alerta con texto (.*)$")
    public void sistema_muestra_alerta_con_texto(String texto) {
        payments.sistema_muestra_alerta_con_texto(texto);
    }

    @When("^sistema permite compartir$")
    public void sistema_permite_compartir() {
        payments.sistema_permite_compartir();
    }

    @When("^sistema muestra xpath (.*) con texto (.*)$")
    public void sistema_muestra_xpath_con_texto(String elem, String texto) {
        payments.sistema_muestra_xpath_con_texto(elem,texto);
    }

    @When("^usuario presiona Editar alias de tarjeta$")
    public void usuario_presiona_Editar_alias_de_tarjeta() {
        payments.usuario_presiona_Editar_alias_de_tarjeta();
    }

   @When("^usuario presiona guardar alias$")
    public void usuario_presiona_guardar_alias() {
        payments.usuario_presiona_guardar_alias();
    }

   @When("^ver texto elemento (.*)$")
    public void verTextoElemento(String elem) {
        payments.verTextoElemento(elem);
    }





    // Sistem validations
    @When("^sistema indica (.*)$")
    public void sistema_indica(String mensaje) {
        payments.sistema_indica(mensaje);
    }

    @When("^sistema no muestra el valor (.*)$")
    public void sistema_no_muestra_el_valor(String valor) {
        payments.sistema_no_muestra_el_valor(valor);
    }

    @Then("^sistema deshabilita boton (.*)$")
    public void sistema_deshabilita_boton(String boton){
        payments.sistema_deshabilita_boton(boton);
    }

    @When("^sistema muestra elemento (.*) con texto (.*)$")
    public void sistema_muestra_elemento_con_texto(String elemento, String texto) {
        payments.sistema_muestra_elemento_con_texto(elemento,texto);
    }


}
