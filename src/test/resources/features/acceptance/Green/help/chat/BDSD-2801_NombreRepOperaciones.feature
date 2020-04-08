Feature: Nombre del rep. de operaciones - Chat App

  Como cliente
  Quiero ver el nombre de la persona del banco con la que estoy chateando


  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Manual @Issue:BDSD-2801
  Scenario: El usuario ingresa al chat, envía un mensaje a banco del sol, recibe una respuesta y visualiza el nombre de la persona del banco con la que esta chateando.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea el chat
    When el usuario escribe un mensaje
    And el usuario recibe una respuesta
    Then el usuario visualiza el nombre de la persona del banco