@BDSD-3642
Feature: BDSD-3642 Errores y empty states Home


# Usuario edita un servicio agendado y habilita notificaciones



#  HOME sin Botones:
#  https://app.zeplin.io/project/5ced4c0acb8dd31e073043af/screen/5dd418c5e13b8145649aa32b
#  [En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde]
#  [Si el problema persiste comunicate con nosotros]
#  Acá el link me dirige al num de wpp
#  LOGIN
#  Caso 14 / 15 / 20  / 51 / 53 / 56 /  62 / 68

#    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:14

  @BDSD-3642_HappyPath
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:14.
    Given  Get to wiremock /PaymentsErrors14
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:15
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:15.
    Given  Get to wiremock /PaymentsErrors15
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:20
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:20.
    Given  Get to wiremock /PaymentsErrors20
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:51
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:51.
    Given  Get to wiremock /PaymentsErrors51
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:53
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:53.
    Given  Get to wiremock /PaymentsErrors53
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:56
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:56.
    Given  Get to wiremock /PaymentsErrors56
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:62
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:62.
    Given  Get to wiremock /PaymentsErrors62
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde

##    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:68
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:68.
    Given  Get to wiremock /PaymentsErrors68
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible acceder a Pagos. Por favor, intentalo nuevamente más tarde





#  https://app.zeplin.io/project/5ced4c0acb8dd31e073043af/screen/5dd41c68dc936644d4a94a6e
#  [Superaste la cantidad de consultas diarias permitidas. Por favor, intentalo nuevamente en 24 hs]
#  LOGIN
#  Caso 60
#    Usuario accede a seccion de pagos con una respuesta de error de login SOAP:60
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:60.
    Given  Get to wiremock /PaymentsErrors60
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto Superaste la cantidad de consultas diarias permitidas. Por favor, intentalo nuevamente en 24 hs


#  HOME con Botones:
  #  https://app.zeplin.io/project/5ced4c0acb8dd31e073043af/screen/5e04ce3bb877981601f9f83c
  #  Servicios - En este momento no es posible obtener tus vencimientos. Por favor, intentalo nuevamente más tarde.
  #  Caso 50 - Pagos
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:50.
    Given  Get to wiremock /PaymentsErrors50
    When  usuario accede a pagos
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible obtener tus vencimientos. Por favor, intentalo nuevamente más tarde.

  #  https://app.zeplin.io/project/5ced4c0acb8dd31e073043af/screen/5e04ce3dea9fee1d08084ed5
  #  Recargas  - En este momento no es posible obtener tus recargas habituales. Por favor, intentalo nuevamente más tarde.
  #  Caso 50 - Recargas
  Scenario: Usuario accede a seccion de pagos con una respuesta de error de login SOAP:50.
    Given  Get to wiremock /PaymentsErrors50
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    Then  sistema muestra elemento Mensaje de Error con texto En este momento no es posible obtener tus vencimientos. Por favor, intentalo nuevamente más tarde.


