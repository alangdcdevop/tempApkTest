@Payment_Regretion_HappyPath
@BDSD-3947
Feature: BDSD-3947 Pago Domesticas

  Como usuario,
  Quiero poder realizar o agendar un pago de domesticas a traves de la app de BDS
  Para no tener que entrar a la web


 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   
#  Happy Path:

  @BDSD-3947_HappyPath
  Scenario: Usuario realiza flujo de primer pago para un pago de domesticas con CUIL
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Act.06hs hasta 4/2019
    And   usuario selecciona Ir a rubros de  Act.06hs hasta 4/2019
    And   usuario ingresa el valor 20334446660
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 20334446761
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 042019
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

#  Validaciones de errores y alertas
  Scenario: Usuario intenta realizar un pago de domesticas con cuit Invalido
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor  Act.06hs hasta 4/2019
    And   usuario selecciona Ir a rubros de  Act.06hs hasta 4/2019
    And   usuario ingresa el valor 20334446660
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 99999999999
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 042019
    And   usuario selecciona Continuar


  Scenario: Usuario intenta realizar un pago de domesticas con Fecha Invalida
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor  Act.06hs hasta 4/2019
    And   usuario selecciona Ir a rubros de  Act.06hs hasta 4/2019
    And   usuario ingresa el valor 20334446660
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 20334446761
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 052019
    And   usuario selecciona Continuar



