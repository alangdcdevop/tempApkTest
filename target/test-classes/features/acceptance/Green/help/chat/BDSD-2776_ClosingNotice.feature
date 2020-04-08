Feature: Aviso cierre - Chat App

  Como usuario
  Quiero salir del chat de la App y recibir un mensaje para saber que mi conversación va a ser borrada.

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

  @Regresion @Issue:BDSD-2681 @Manual
  Scenario: El usuario dentro del chat, selecciona la opción para salir del chat, visualiza un mensaje de confirmación de salida y eliminación de los mensajes. El usuario selecciona “Si” y se pierde la conversación.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    When el usuario tapea ver todas
    And el usuario visualiza un mensaje de confirmacion y eliminacion de los mensajes
    And el usuario selecciona si
    Then el usuario no visualiza la conversacion

  @Regresion @Issue:BDSD-2681 @Manual
  Scenario: El usuario dentro del chat, selecciona la opción para salir del chat y visualiza un mensaje de confirmación de salida y eliminación de los mensajes. El usuario selecciona “No” y vuelve a la conversación.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    When el usuario tapea ver todas
    And el usuario visualiza un mensaje de confirmacion y eliminacion de los mensajes
    And el usuario selecciona no
    Then el usuario no visualiza la conversacion