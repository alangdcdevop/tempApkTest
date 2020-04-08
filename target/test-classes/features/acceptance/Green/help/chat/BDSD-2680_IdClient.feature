# language: en
Feature: ID Cliente - Chat App

  Como usuario
  Quiero ser identificado por el banco, para recibir el soporte que necesito

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

  @Regresion @Manual @Issue:BDSD-2680
  Scenario: Un usuario ingresa al chat, envía un mensaje, el banco recibe el mensaje, el mensaje ingresa con el usuario identificado.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea el chat
    When el banco recibe el mensaje
    Then el mensaje ingresa con el usuario identificado