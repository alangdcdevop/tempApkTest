@ProfileConfig @Cyan
Feature: Configuracion de cuenta

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
    And el usuario accede a Perfil
    Then el usuario accede a configuracion

  @Issue:BDSD-872
  Scenario: Cambio de clave numerica erronea
    When se intenta cambiar la clave numerica
    And ingresa el passcode 192837
    And ingresa el passcode 123456
    Then no avanza a confirmacion de clave

  @Issue:BDSD-872
  Scenario: Cambio de clave numerica conteniendo direccion de calle
    When se intenta cambiar la clave numerica
    And ingresa el passcode 192837
    And ingresa el passcode 128899
    Then no avanza a confirmacion de clave

  @Issue:BDSD-872
  Scenario: Cambio de clave numerica conteniendo DNI del usuario
    When se intenta cambiar la clave numerica
    And ingresa el passcode 192837
    And ingresa passcode que contiene DNI del usuario
    Then no avanza a confirmacion de clave

  @Issue:BDSD-873
  Scenario: Desvinculacion de dispositivo
    When se intenta desvincular el dispositivo
    And el usuario confirma la desvinculacion
    Then el dispositivo se desvincula

  @Issue:BDSD-881
  Scenario: Intentar baja de cuenta y arrepentirse
    When se intenta dar de baja la cuenta
    And se cancela la baja
    Then se visualiza el perfil

  @Issue:BDSD-872 @Manual
  Scenario: Cambio de clave numerica correctamente
    When se intenta cambiar la clave numerica
    And ingresa el passcode 192837
    And ingresa el passcode 918273
    And ingresa el passcode 918273
    And se valida el cambio de clave
    And se intenta cambiar la clave numerica
    And ingresa el passcode 918273
    And ingresa el passcode 192837
    And ingresa el passcode 192837
    Then se valida el cambio de clave


