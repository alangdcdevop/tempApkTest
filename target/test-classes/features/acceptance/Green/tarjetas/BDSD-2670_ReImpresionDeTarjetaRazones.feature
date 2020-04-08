Feature: Reimpresión de tarjeta/ Razones - App Loggeada

  Como cliente
  Quiero solicitar la reimpresión de mi tarjeta.

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Manual @Issue:BDSD-2670
  Scenario: El usuario ingresa a la sección de reimprimir, selecciona un motivo de reimpresión (que no es “La perdi”), tapea continuar. el motivo es registrado en firebase y el cliente continúa con su flujo de dirección.
    Given el usuario tapea tarjetas
    And el usuario tapea reimprimir
    And el usuario tapea un motivo de reimpresion
    And el usuario tapea continuar
    When el motivo es registrado en firebase
    Then el usuario continua con el flujo de direccion

  @Regresion @Automation @Issue:BDSD-2670
  Scenario: El usuario ingresa a la sección de reimprimir, selecciona “La perdí” como motivo de reimpresión y continua el flujo
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    And el usuario tapea reimprimir
    When el usuario tapea el motivo "la perdi"
    And el usuario presiona continuar
    Then el usuario visualiza el flujo de reimpresion

  @Regresion @Automation @Issue:BDSD-2670
  Scenario: El cliente tapea el ícono de “Ayuda” en cualquier momento del flujo (menos en las pantallas de éxito) y visualiza la sección de ayuda contextualizada con tarjeta de débito.
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    And el usuario tapea reimprimir
    When el usuario tapea el motivo "la perdi"
    And el usuario presiona continuar
    Then el usuario ingresa a la pantalla ayuda en tarjetas

  @Regresion @Automation @Issue:BDSD-2670
  Scenario: El cliente tapea cerrar y es redireccionado a la home de tarjetas.
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    And el usuario tapea reimprimir
    When el usuario tapea cerrar
    Then el usuario visualiza la pantalla de tarjetas

  @Regresion @Manual @Issue:BDSD-2670
  Scenario: El cliente no selecciona ninguna opción y no puede avanzar.
    Given el usuario tapea tarjetas
    And el usuario tapea reimprimir
    When el usuario no selecciona ninguna opcion
    Then el usuario no puede presionar avanzar
