# language: en
Feature: Pantalla de Ayuda - no loggeada

  Como usuario
  Quiero poder ingresar a “Ayuda” dentro de la App
  Para encontrar todo el soporte que necesito

  Background:
    Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion

  @Regresion @Issue:BDSD-2440 @Automation
  Scenario: Usuario ingresa a “Preguntas Frecuentes” y ve las preguntas relacionadas a “Como abrir mi cuenta” e “Inicio de Sesión”
    Given el usuario ingresa a la pantalla ayuda no loggeado
    When el usuario tapea ver todas
    Then el usuario visualiza las preguntas como abrir mi cuenta
    And el usuario visualiza las preguntas de inicio de sesion

  @Regresion @Issue:BDSD-2440 @Automation
  Scenario: Usuario tapea el botón de “Volver a la pantalla anterior” y es redireccionado a la pantalla anterior.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    When el usuario tapea el boton volver a la pantalla anterior
    Then el usuario visualiza la pantalla anterior de no loggeado

  @Regresion @Issue:BDSD-2440 @Automation
  Scenario: Usuario tapea una pregunta, y visualiza la respuesta.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    When el usuario tapea una de las preguntas frecuentes
    Then el usuario visualiza la respuesta