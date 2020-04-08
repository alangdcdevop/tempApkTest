@LoginOnboarding @Cyan
Feature: Login

  @Issue:BDSD-600
  Scenario Outline: Validacion al ingresar correo para iniciar sesion
    When el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo <email>
    And el usuario confirma el correo
    Then se informa que el email es invalido

    Examples:
      | email                |
      | email@gmail          |
      | emailInvalido@sitio. |
      | e@gmail.com          |
