# language: en
@MagicLink @Cyan

Feature: Magic Link

  @Issue:BDSD-2179
  Scenario: Envio de Correo Electronico al intentar loguearse con un mail no registrado
    When el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And ingresa un mail no registrado
    And el usuario confirma el correo
    Then recibe un mail con informacion de como continuar el proceso

  @Issue:BDSD-2179
  Scenario: Acceder a la aplicacion desde el MagicLink enviado a mail no registrado
    When el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And ingresa un mail no registrado
    And el usuario confirma el correo
    And recibe un mail con informacion de como continuar el proceso
    And accede al MagicLink con mail no registrado
    Then el usuario visualiza requisitos de identificacion

  @Issue:BDSD-2179 @manual #VER QUE ES ESTO
  Scenario: Acceder a un MagicLink de vinculacion de dispositivo con dispositivo sin vincular
    Given el dispositivo no se encuentra vinculado
    When accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
    Then se visualiza la pantalla de inicio

  @Issue:BDSD-2179
  Scenario: Intentar registrarse con un mail ya registrado
    When el usuario intenta registrarse
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    Then recibe un mail indicando que ya esta registrado con bdsolqe@gmail.com y password Bdsol123

  @Issue:BDSD-1204
  Scenario: Ingresar a primer MagicLink desde un dispositivo distinto al emisor
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa correo no registrado bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma desde otro dispositivo el MagicLink con correo bdsolqe@gmail.com
    Then se visualiza mensaje de dispositivo invalido





