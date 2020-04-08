# language: en
@FingerPrintLogin @Cyan

Feature: Enable Fingerprint Login

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com

  @Issue:BDSD-2376 @Manual
  Scenario: Habilitar login por huella dactilar
    When ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    And se visualiza la home
    And el usuario se desloguea
    And ingresa el passcode 192837
    And el usuario decide ingresar por huella dactilar
    Then se visualiza la home

  @Issue:BDSD-2376 @Manual
  Scenario: Login sin huella dactilar registrada
    When el usuario elimino su huella dactilar
    Then debe ingresar password

  @Issue:BDSD-2720 @Manual
  Scenario: Ingreso de clave al habilitar huella dactilar desde configuracion
    When el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    And rechaza el ingreso por biometria
    And se navega al perfil
    And se navega a configuracion
    And se habilita la biometria
    And confirma el cambio
    Then debe ingresar password

  @Issue:BDSD-2720 @Manual
  Scenario: Ingreso de huella luego de habilitar huella dactilar desde configuracion
    When el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    And rechaza el ingreso por biometria
    And se navega al perfil
    And se navega a configuracion
    And se habilita la biometria
    And confirma el cambio
    And ingresa el passcode 192837
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    Then el boton de huella esta disponible

