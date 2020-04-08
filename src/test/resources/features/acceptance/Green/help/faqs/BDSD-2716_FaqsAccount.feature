Feature: FAQs Cuenta - Contextualizada

  Como cliente
  Quiero poder ver las preguntas frecuentes relacionadas a la Cuenta dentro de la pantalla de Ayuda, cuando me encuentro en la sección Cuenta dentro de la App.

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

  @Regresion @Issue:BDSD-2716 @Automation
  Scenario: El usuario ingresa a la pantalla de ayuda desde la pantalla de Cuenta, y visualiza desde la Home de Pantalla de ayuda 4 preguntas frecuentes relacionadas a Sobre mi cuenta. El usuario tapea “ver más” y ve todas las preguntas relacionadas a Sobre mi cuenta.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat

  @Regresion @Issue:BDSD-2716 @Automation
  Scenario: El usuario tapea el botón para volver para atrás, y vuelve a la pantalla anterior.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat