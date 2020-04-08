# language: en
@Payment_Regretion_HappyPath
@BDSD-1555
Feature: BDSD-1555 Primer Pago Sin vencimientos (Casos alternativos)
  Como usuario, Quiero acceder a un servicio aunque no se encuentren próximos vencimientos
  Para poder  Pagar y Agendar los futuros vencimientos


 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
#  Happy path
#  paymentType: "WITH_INVOICE",	Usuario intenta pagar servicio sin facturas pendientes (WITH_INVOICE), sistema indica que no posee facturas pendientes

  @BDSD-1555_HappyPath
  Scenario: Usuario intenta pagar servicio sin facturas pendientes (WITH_INVOICE), sistema indica que no posee facturas pendientes
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 210987654321
    And   usuario selecciona Continuar
    Then  usuario selecciona Finalizar



#  paymentType: "MIXED",	Usuario intenta pagar servicio sin facturas pendientes (MIXED), sistema permite pagar
  Scenario: Usuario intenta pagar servicio sin facturas pendientes (MIXED), sistema permite pagar
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario ingresa el valor 210987654321
    And   usuario selecciona Continuar
    And   usuario selecciona Pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  paymentType: "WITH_INVOICE",	Usuario intenta pagar servicio sin facturas pendientes (WITH_INVOICE), usuario agenda servicio
  Scenario: Usuario intenta pagar servicio sin facturas pendientes (WITH_INVOICE), sistema indica que no posee facturas pendientes, usuario agenda servicio
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 210987654321
    And   usuario selecciona Continuar
    Then  usuario selecciona Agendar servicio



