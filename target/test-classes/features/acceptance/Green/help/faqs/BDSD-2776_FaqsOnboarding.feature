# language: en
Feature: FAQs Onboarding - Contextualizada

  Como cliente
  Quiero poder ver las preguntas frecuentes relacionadas a Cómo abrir mi cuenta dentro de la pantalla de Ayuda,
  cuando me encuentro en la pantalla de Registro dentro de la App.

  Background:
    Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion

  @Regresion @Issue:BDSD-2798 @Manual
  Scenario: El usuario ingresa a la pantalla de ayuda desde la pantalla de Registro, y visualiza desde la Home de Pantalla de ayuda 4 preguntas frecuentes relacionadas a Como abrir mi cuenta. El usuario tapea “ver más” y ve todas las preguntas relacionadas a Cómo abrir mi cuenta.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat

  @Regresion @Issue:BDSD-2798 @Manual
  Scenario: El usuario tapea el botón para volver para atrás, y vuelve a la pantalla anterior.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat