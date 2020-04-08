Feature: bloquear de tarjeta - Reimpresión (App)

  Como cliente
  Quiero solicitar mi nueva tarjeta después de reportar mi bloquear

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Automation @Issue:BDSD-3626
  Scenario: El cliente finaliza el bloqueo de su tarjeta, visualiza la opción de envío, tapea enviar y visualiza la pantalla de éxito.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    And el usuario tapea solicitar reimpresion
    When el usuario visualiza la opcion de envio
    And el usuario tapea enviar
    Then el usuario tapea finalizar


  @Automation @Issue:BDSD-3626 @TODO @PROXIMOSPRINT
  Scenario: El cliente tapea el ícono de  “Ayuda” en cualquier momento del flujo (menos en las pantallas de éxito) y visualiza la sección de ayuda contextualizada con tarjeta de débito.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    When el usuario ingresa a la pantalla ayuda
    Then el usuario visualiza preguntas contextualizadas de tarjetas

  @Automation @Issue:BDSD-3626 @PROXIMOSPRINT
  Scenario: El cliente tapea el botón de cerrar en la pantalla de dirección y visualiza un modal para confirmar la salida.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    When el usuario tapea cerrar en la pantalla de direccion
    Then el usuario visualiza un modal para confirmar la salida

  @Automation @Issue:BDSD-3626 @PROXIMOSPRINT
  Scenario: El cliente tapea el botón de cerrar en la pantalla de dirección y visualiza un modal para confirmar la salida. El cliente tapea no reimprimir y vuelve a la home de tarjetas.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    And el usuario tapea solicitar reimpresion
    When el usuario visualiza un modal para confirmar la salida
    And el usuario tapea no reimprimir
    Then el usuario visualiza la pantalla de tarjetas

  @Automation @Issue:BDSD-3626 @PROXIMOSPRINT
  Scenario: El cliente tapea el botón de cerrar en la pantalla de dirección y visualiza un modal para confirmar la salida. El cliente tapea volver y vuelve al flujo de reimpresión.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    When el usuario tapea cerrar en la pantalla de direccion
    And el usuario visualiza un modal para confirmar la salida
    And el usuario tapea volver
    Then el usuario visualiza el flujo de reimpresion

  @Regresion @Automation @Issue:BDSD-3626 @PROXIMOSPRINT
  Scenario: El cliente tapea cerrar en la pantalla de éxito de solicitud y vuelve a home de tarjetas.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    When el usuario tapea cerrar en la pantalla de direccion
    And el usuario tapea reimprimir
    Then el usuario tapea cerrar en la pantalla de exito de solicitud
    And el usuario visualiza la pantalla de home

  @Regresion @Automation @Issue:BDSD-3626 @PROXIMOSPRINT
  Scenario: El cliente tapea el botón finalizar en la pantalla de éxito de solicitud y vuelve a home de tarjetas.
    Given el usuario tapea tarjetas
    And el usuario tapea bloquear
    When el usuario tapea cerrar en la pantalla de direccion
    And el usuario tapea reimprimir
    Then el usuario tapea finalizar en la pantalla de exito de solicitud
    And el usuario visualiza la pantalla de home