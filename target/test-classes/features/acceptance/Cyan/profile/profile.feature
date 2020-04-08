@Profile @Cyan
Feature: Perfil

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

  @Issue:BDSD-2955
  Scenario: Solicitud de estado civil al ingresar al perfil
    Given el usuario no declaro su estado civil
    When el usuario accede a Perfil
    Then se le solicita su estado civil

  @Issue:BDSD-2955 @esto
  Scenario Outline: Seleccion de estado civil al ingresar al perfil
    Given el usuario no declaro su estado civil
    When el usuario accede a Perfil
    And se le solicita su estado civil
    And selecciona estado civil <estadocivil>
    And el usuario finaliza la configuracion
    And el usuario accede a Perfil
    Then se visualiza el estado civil <estadocivil> en perfil y se persiste en PeopleHub

    Examples:
      | estadocivil         |
      | Soltero/a           |
      | Casado/a            |
      | Divorciado/a        |
      | Unión convivencial  |
      | Viudo/a             |
      | Separado/a de hecho |
      | Otro                |

  @Issue:BDSD-2955
  Scenario: Navegar a home desde seleccion de estado civil
    Given el usuario no declaro su estado civil
    When el usuario accede a Perfil
    And se le solicita su estado civil
    And el usuario intenta volver atras
    Then se visualiza la home

  @Issue:BDSD-2955
  Scenario Outline: Seleccion de estado civil persistida luego de cerrar sesion
    Given el usuario no declaro su estado civil
    When el usuario accede a Perfil
    And se le solicita su estado civil
    And selecciona estado civil <estadocivil>
    And el usuario finaliza la configuracion
    And el usuario se desloguea
    And ingresa el passcode 192837
    And el usuario accede a Perfil
    Then se visualiza el estado civil <estadocivil> en perfil y se persiste en PeopleHub

    Examples:
      | estadocivil         |
      | Soltero/a           |
      | Casado/a            |
      | Divorciado/a        |
      | Unión convivencial  |
      | Viudo/a             |
      | Separado/a de hecho |
      | Otro                |

  Scenario: Compartir datos de cuenta
    When el usuario accede a Perfil
    And presiona compartir datos
    Then se muestran opciones para compartir



