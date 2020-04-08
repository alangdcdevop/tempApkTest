# language: en
Feature: Pantalla de Ayuda - no loggeada

  Como cliente
  Quiero poder ver las preguntas frecuentes relacionadas a Inicio de sesión dentro de la pantalla de Ayuda, cuando me encuentro en la pantalla de Inicio de sesión dentro de la App.

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com

  @Regresion @Issue:BDSD-2775 @Automation
  Scenario: El usuario ingresa a la pantalla de ayuda desde la pantalla de Inicio de Sesión, y visualiza desde la Home de Pantalla de ayuda 4 preguntas frecuentes relacionadas a Inicio de sesión. El usuario tapea “ver más” y ve todas las preguntas relacionadas a Inicio de sesión.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat

  @Regresion @Issue:BDSD-2775 @Automation
  Scenario: El usuario tapea el botón para volver para atrás, y vuelve a la pantalla anterior.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat