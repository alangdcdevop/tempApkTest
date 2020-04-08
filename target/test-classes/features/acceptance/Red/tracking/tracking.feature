# language: en
Feature: Tracking de un producto

  Yo como cliente del banco
  Quiero conocer la trayectoria de envío de la misma
  Para saber cuando voy a disponer del plástico

  @Wip
  Scenario: Visualizar una tarjeta creada
    Given que existe el cliente con dni 25317832 el cual no tienen tarjetas propias
    And el mismo solicito una orden de emision de plastico
    And la direccion de envio es Av. Del Libertador 8620 6P CP 1086
    When accedo al menu 'tarjetas'
    Then visualiza la linea de tiempo con 4 puntos resaltando el punto 1 y se muestra la fecha de hoy

  @Wip
  Scenario: Visualizar una tarjeta en camino
    Given que existe el cliente con dni 25317832 el cual no tienen tarjetas propias
    And el mismo solicito una orden de emision de plastico
    And la direccion de envio es Av. Del Libertador 8620 6P CP 1086
    When accedo al menu 'tarjetas'
    Then visualiza la linea de tiempo con 4 úntos resaltando el punto 1 y el 2 y se muestra la fecha de hoy en el punto 2
