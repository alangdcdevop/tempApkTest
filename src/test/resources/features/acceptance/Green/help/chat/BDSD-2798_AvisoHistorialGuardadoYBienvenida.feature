Feature: Aviso de historial guardado + bienvenida - Usuario Logueado

  Como usuario
  Quiero que me avisen que el historial de conversación va a ser guardado.

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Manual
  Scenario: El cliente ingresa al chat de la app y usa el chat por primera vez, y visualiza un aviso de historial guardado.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat por primera vez
    Then el usuario visualiza un aviso de historial guardado

  @Regresion @Manual
  Scenario: El cliente ingresa al chat de la app y visualiza un aviso de historial guardado.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza un aviso de historial guardado