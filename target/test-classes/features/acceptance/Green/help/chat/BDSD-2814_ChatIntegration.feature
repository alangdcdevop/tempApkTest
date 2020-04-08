Feature: Integracion del chat con Botmaker

  Como usuario
  Quiero poder enviar mensajes a través del chat de la App y que el banco los reciba

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Issue:BDSD-2814 @Automation
  Scenario: El usuario ingresa al chat dentro del horario de atención y visualiza la pantalla de la historia: “Pantalla de Chat”
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat

  @Regresion @Issue:BDSD-2814 @Automation
  Scenario: El usuario ingresa al chat, escribe un mensaje, visualiza la opción de enviar, envía el mensaje.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    And el usuario escribe un mensaje
    And el usuario visualiza el boton de enviar
    And el usuario escribe un mensaje
    Then el usuario envia el mensaje

  @Regresion @Issue:BDSD-2814 @Automation
  Scenario: El usuario ingresa al chat fuera del horario de atención y visualiza la pantalla de empty state.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza pantalla de empty state



