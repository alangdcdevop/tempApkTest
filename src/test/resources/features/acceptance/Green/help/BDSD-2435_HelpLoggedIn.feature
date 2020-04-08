# language: en
Feature: Pantalla de Ayuda - App Loggeada

  Como usuario
  Quiero poder ingresar a “Ayuda” dentro de la App
  Para encontrar todo el soporte que necesito

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

  @Regresion @Issue:BDSD-2435 @Automation
  Scenario: Usuario ingresa a la pantalla de ayuda y visualiza los canales de soporte.
    When el usuario ingresa a la pantalla ayuda
    Then el usuario visualiza los canales de soporte

  @Regresion @Issue:BDSD-2435 @Automation
  Scenario: El usuario toca el botón de “volver a la pantalla anterior” y vuelve a la pantalla según el contexto en el que se encontraba cuando ingresó a la pantalla de ayuda.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el boton volver a la pantalla anterior
    Then el usuario visualiza la pantalla anterior

  @Regresion @Issue:BDSD-2435 @Automation
  Scenario: El usuario selecciona Ver todas y es redireccionado a una pantalla con todas las secciones
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea ver todas
    Then el usuario visualiza la pantalla de faqs

  @Regresion @Issue:BDSD-2435 @Automation
  Scenario: El usuario selecciona Más opciones y es redireccinoado a la pantalla de la historia “Pantalla de Ayuda - Más opciones App Loggeada”
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea mas opciones
    Then el usuario visualiza la pantalla de ayuda mas opciones

  @Regresion @Issue:BDSD-2435 @Manual
  Scenario: El usuario selecciona WhatsApp y es redireccionado a una conversación de WhatsApp con el Banco del Sol desde su dispositivo.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea whatsapp
    Then el usuario visualiza una conversacion con el banco del sol

  @Regresion @Issue:BDSD-2435 @Automation
  Scenario: Usuario tapea una de las preguntas frecuentes que aparecen en pantalla, se despliega la respuesta.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea una de las preguntas frecuentes
    Then el usuario visualiza la respuesta








