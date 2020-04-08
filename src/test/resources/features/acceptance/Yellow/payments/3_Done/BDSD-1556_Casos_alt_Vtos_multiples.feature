# language: en
@Payment_Regretion_HappyPath
@BDSD-1556
Feature: BDSD-1556 Casos alternativos Primer Pago - Vtos múltiples
  Como usuario,
  Quiero poder pagar un servicio que tenga vencimientos múltiples.
  Para evitar entrar en mora o duplicar pagos

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   
##  Happy Path:
##    Usuario selecciona servicio con multiples vencimientos, paga mensual el servicio
##     - Anula vencimiento mensual.
##     - Anula vencimiento anual.
##     - Se visualizan el resto de los vencimientos
#

  @BDSD-1556_HappyPath
  Scenario: Usuario selecciona servicio con multiples vencimientos, paga mensual el servicio
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123123123123
    And   usuario selecciona Continuar
    And   usuario selecciona Edenor 24/12/19 212.31
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar


  Scenario: Usuario selecciona servicio con multiples vencimientos, paga anual el servicio
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123123123123
    And   usuario selecciona Continuar
    And   usuario selecciona Edenor - Cuota Anual04/12/19 10055.00
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar






