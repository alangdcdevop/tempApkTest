# language: en
@Timeouts
Feature: Timeouts

  @Timeout
  Scenario: Timeout en pantalla Ayuda (Iniciar Sesion)
    Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa a la pantalla ayuda
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Issue:BDSD-2813
  Scenario: Timeout en terminos y condiciones
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And el usuario no acepto terminos y condiciones
    When ingresa el passcode 192837
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de login

  @Timeout
  Scenario: Timeout en pantalla de desvinculacion exitosa
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
    And el usuario accede a configuracion
    And se intenta desvincular el dispositivo
    And el usuario confirma la desvinculacion
    And el dispositivo se desvincula
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio


