Feature: Horarios de mensajes - Chat

  Como usuario
  Quiero poder ver los horarios en los que se enviaron los mensajes del chat

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    And se visualiza la home

  @regression @Issue:BDSD-2718 @Manual
  Scenario: El usuario envía un mensaje en el chat y visualiza el mensaje con el horario en el que lo envió.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea el chat
    When el usuario escribe un mensaje
    Then el usuario visualiza un mensaje con el horario en el que lo envio

  @regression @Issue:BDSD-2718 @Manual
  Scenario: El usuario recibe un mensaje en el chat y visualiza el mensaje con el horario en el que se le envió.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea el chat
    When el usuario escribe un mensaje
    Then el usuario visualiza un mensaje con el horario en el que lo envio