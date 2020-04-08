# language: en
@TestLogin @Cyan
Feature: Login

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo a la app por magic link con mail bdsolqe@gmail.com y contraseña Bdsol123

  @Login
  Scenario: Se realiza un login exitoso
    When ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    Then se visualiza la home

  @Negative
  Scenario: Se realiza un login exitoso despues de ingresar una vez mal el password
    When ingresa el passcode 111111
    And ingresa el passcode 192837
    Then se visualiza la home

  @Negative
  Scenario: Se realiza un login exitoso después de ingresar 2 veces mal el password
    When ingresa el passcode 111111
    And ingresa el passcode 222222
    And acepta reintentar
    And ingresa el passcode 192837
    Then se visualiza la home

  @Negative @manual
  Scenario: Se bloquea la cuenta después de ingresar 3 veces mal el password
    When ingresa el passcode 111111
    And ingresa el passcode 222222
    And acepta reintentar
    And ingresa el passcode 333333
    Then se bloquea la cuenta






