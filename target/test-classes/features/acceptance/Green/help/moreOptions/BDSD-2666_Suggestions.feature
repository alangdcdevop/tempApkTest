Feature: Pantalla de Ayuda/ Sugerencias Vol. II - App Logeada

  Como cliente
  Quiero ingresar a la App de Banco del Sol
  Para dejar una sugerencia

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Issue:BDSD-2666 @Automation
  Scenario: El usuario desde la pantalla de sugerencia, presiona el botón “Atrás” y vuelve a la pantalla anterior en la que se encontraba.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea mas opciones
    And el usuario ingresa a sugerencias
    And el usuario escribe una sugerencia
    When el usuario tapea el boton atras
    Then el usuario visualiza la pantalla de mas opciones

  @Regresion @Issue:BDSD-2666 @Manual
  Scenario: El usuario escribe una sugerencia, presiona “enviar” y se envía la sugerencia en formato de mail a asistencia@bdsol.com.ar, y el cliente visualiza una pantalla con un mensaje de agradecimiento por parte de Banco del Sol.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea mas opciones
    And el usuario ingresa a sugerencias
    And el usuario escribe una sugerencia
    When el usuario tapea el boton enviar
    Then el usuario visualiza la pantalla de agradecimiento

  @Regresion @Issue:BDSD-2666 @Automation
  Scenario: El usuario desde la pantalla de agradecimiento, presiona el botón finalizar y visualiza la pantalla de Ayuda.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea mas opciones
    And el usuario ingresa a sugerencias
    And el usuario escribe una sugerencia
    When el usuario tapea el boton enviar
    And el usuario visualiza la pantalla de agradecimiento
    Then el usuario tapea el boton finalizar
    And el usuario visualiza la pantalla de home

  @Regresion @Issue:BDSD-2666 @Automation
  Scenario: El usuario desde la pantalla de agradecimiento, presiona el botón “Cerrar” y vuelve a la pantalla de Ayuda.
    Given el usuario ingresa a la pantalla ayuda
    And el usuario tapea mas opciones
    And el usuario ingresa a sugerencias
    And el usuario escribe una sugerencia
    When el usuario tapea el boton enviar
    And el usuario visualiza la pantalla de agradecimiento
    Then el usuario tapea el boton cerrar
    And el usuario visualiza la pantalla de ayuda