Feature: bloquear de tarjeta - Bloqueo (App)

  Como cliente
  Quiero ingresar a la App de Banco del Sol
  Para reportar la pérdida o robo de mi tarjeta.

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Automation @Issue:BDSD-2539
  Scenario: El cliente ingresa a la sección de tarjetas, tapea bloquear, visualiza una pantalla para confirmar, tapea confirmar, visualiza la pantalla de éxito de bloqueo.
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    When el usuario tapea bloquear
    And el usuario tapea solicitar reimpresion
    Then el usuario visualiza una pantalla de exito de bloqueo

  @Regresion @Automation @Issue:BDSD-2539
  Scenario: El cliente ingresa a la sección de tarjetas, tapea bloquear, visualiza una pantalla para confirmar, tapea volver atrás, visualiza la pantalla de tarjetas
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    When el usuario tapea bloquear
    And el usuario tapea volver
    Then el usuario visualiza la pantalla de tarjetas

  @Regresion @Manual @Issue:BDSD-2539
  Scenario: El cliente ingresa a la sección de tarjetas, tapea bloquear, visualiza una pantalla para confirmar, tapea confirmar, visualiza una pantalla de error
    Given el usuario tapea tarjetas
    And el usuario tapea fisica
    When el usuario tapea bloquear
    And el usuario tapea solicitar reimpresion
    Then el usuario visualiza una pantalla de error
