@LoginOnboarding @Cyan
Feature: Onboarding

  Background:
    Given el back end acepta registraciones

  @Issue:BDSD-test @manual
  Scenario: Sacar foto de prueba de vida
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    Then se visualiza la selfie

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio

  @Regression @Timeout @manual
  Scenario: Timeout en onboarding
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario saca la foto del frente del DNI
    And el usuario espera 3 minutos
    Then se visualiza la pantalla de inicio




