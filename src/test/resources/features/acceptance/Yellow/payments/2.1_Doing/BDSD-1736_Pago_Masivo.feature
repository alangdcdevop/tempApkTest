@Payment_Regretion
@BDSD-1736
Feature:BDSD-1736 Pago Masivo

  Como usuario,
  Quiero visualizar y accionar sobre próximos vencimientos de servicios agendados, desde la home de Pagos.
  Para poder pagar de a muchos servicios al mismo tiempo, acortar el camino y completar el pago a tiempo

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   
#  Escenarios:
#
#  Happy path end to end:
#  Usuario tiene 4 servicios por vencer en la home de pagos, sistema ofrece el botón de pagos varios.
#  Usuario paga 3 de los 4 servicios, sistema guarda en historial lo comprobantes individualmente.
#
#  Happy path:
#  Usuario tiene mas de 1 vencimiento a pagar, sistema muestra opción de pagos varios.
#  Usuario opta por pagos varios y selecciona mas de 1 servicio, sistema deja avanzar.
#  Usuario selecciona mas de una servicio, sistema debe sumar los servicios seleccionados como monto total.
#  Usuario selecciona el box de “seleccionar todos”, sistema debe marcar todos los servicios con un tilde.
#  Usuario selecciona X cantidad de servicios, sistema debe mostrar cuantos servicios hay seleccionados.
#  Usuario selecciona servicios a pagar y aprieta continuar, sistema muestra pantalla de confirmación.
#  Usuario confirma pago de servicios, sistema muestra congrats con numero de pagos abonados y opción de finalizar o compartir comprobantes.
#  Usuario realiza pagos varios, sistema almacena en historial los pagos individualmente.
#  Usuario selecciona compartir comprobantes, sistema debe permitir seleccionar que comprobantes quiere compartir.
#  Usuario comparte comprobantes, sistema presenta nuevamente la pantalla para compartir.
#  Usuario selecciona la X en el margen superior izquierdo, sistema lo lleva a la home.
#
#  Validación de errores/alertas.
#  Sistema solo tiene un vencimiento, no muestra opción de pagos varios.
#  Usuario opta por pagos varios y no selecciona ninguno servicio, sistema no dejar avanzar.
#  Usuario selecciona una cantidad de servicios que supera el total disponible en cuenta, sistema muestra error y no deja avanzar.
#  Usuario selecciona varios servicios, avanza y luego vuelve para atrás, sistema debe mostrar la misma selección.



##  Happy path end to end:
##  Usuario tiene 4 servicios por vencer en la home de pagos, sistema ofrece el botón de pagos varios.
  @Payment_Regretion_HappyPath
  @BDSD-1736_HappyPath
  Scenario: Usuario realiza un pago masivo desde la home de pagos, sistema muestra congrats.
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona Seleccionar todos
    And   usuario selecciona Nuevo pago
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar

    
#  Happy path:

##  Usuario selecciona mas de una servicio, sistema debe sumar los servicios seleccionados como monto total.
  Scenario: Usuario selecciona mas de una servicio, sistema debe sumar los servicios seleccionados como monto total.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona SELECCIONA PAGO 1
    And   usuario selecciona SELECCIONA PAGO 2
    Then  sistema indica MONTO TOTAL PAGO 1 PAGO 2

##  Usuario selecciona el box de “seleccionar todos”, sistema debe marcar todos los servicios con un tilde.
  Scenario: Usuario selecciona el box de “seleccionar todos”, sistema debe marcar todos los servicios con un tilde.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona Seleccionar todos
    Then  sistema indica PAGO 1 SELECCIONADO
    And   sistema indica PAGO 2 SELECCIONADO

##  Usuario selecciona X cantidad de servicios, sistema debe mostrar cuantos servicios hay seleccionados.
  Scenario: Usuario selecciona X cantidad de servicios, sistema debe mostrar cuantos servicios hay seleccionados.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona SELECCIONA PAGO 1
    And   usuario selecciona SELECCIONA PAGO 2
    Then  sistema indica 2 PAGOS SELECCIONADOS

##  Usuario selecciona servicios a pagar y aprieta continuar, sistema muestra pantalla de confirmación.
  Scenario: Usuario selecciona servicios a pagar y aprieta continuar, sistema muestra pantalla de confirmación.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona SELECCIONA PAGO 1
    And   usuario selecciona SELECCIONA PAGO 2
    Then  sistema indica PANTALLA CONFIRMACION PAGO 1 PAGO 2

##  Usuario confirma pago de servicios, sistema muestra congrats con numero de pagos abonados y opción de finalizar o compartir comprobantes.
  Scenario: Usuario confirma pago de servicios, sistema muestra congrats con numero de pagos abonados y opción de finalizar o compartir comprobantes.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona SELECCIONA PAGO 1
    And   usuario selecciona SELECCIONA PAGO 2
    And   usuario selecciona Nuevo pago
    And   usuario selecciona Pagar
    Then  sistema indica NUMERO DE PAGOS REALIZADOS
    And   sistema indica OPCION DE COMPARTIR

##  Usuario selecciona compartir comprobantes, sistema debe permitir seleccionar que comprobantes quiere compartir.
  Scenario: Usuario selecciona compartir comprobantes, sistema debe permitir seleccionar que comprobantes quiere compartir.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona SELECCIONA PAGO 1
    And   usuario selecciona SELECCIONA PAGO 2
    And   usuario selecciona Nuevo pago
    And   usuario selecciona Pagar
    Then  usuario selecciona OPCION DE COMPARTIR
    And   sistema indica OPCION DE PAGO DE COMPROBANTES


#  Validación de errores/alertas.
#  Sistema solo tiene un vencimiento, no muestra opción de pagos varios.
  Scenario: Sistema solo tiene un vencimiento, no muestra opción de pagos varios.
    Given Get to wiremock /home1pago
    When  usuario accede a pagos
    And   sistema no muestra el valor Pagar varios servicios
  
#  Usuario opta por pagos varios y no selecciona ninguno servicio, sistema no dejar avanzar.
  Scenario: Sistema solo tiene un vencimiento, no muestra opción de pagos varios.
    Given Get to wiremock /home2pago
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    Then  sistema deshabilita boton Nuevo pago
  
#  Usuario selecciona una cantidad de servicios que supera el total disponible en cuenta, sistema muestra error y no deja avanzar.
  Scenario: Usuario selecciona una cantidad de servicios que supera el total disponible en cuenta, sistema muestra error y no deja avanzar.
    Given Get to wiremock /pocoSaldo
    When  usuario accede a pagos
    And   usuario selecciona Pagar varios servicios
    And   usuario selecciona Nuevo pago
    And   sistema indica NO TIENE FONDOS SUFICIENTES

