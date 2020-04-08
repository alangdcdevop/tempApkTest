@LoginOnboarding2 @Cyan
Feature: Onboarding process after mail confirmation

  Background:
    Given el dispositivo no se encuentra vinculado
    And la creacion no fue completada
    When accedo por magic link con mail bdsolqe@gmail.com

  @manual
  Scenario Outline: Crear nueva clave erroneamente
    When ingreso la clave <clave>
    Then avisa que las reglas no son cumplidas

    Examples:
      | clave  |
      | 123456 |
      | 111111 |

  @manual
  Scenario: Crear claves que no coinciden
    When ingreso la clave 192837
    And confirmo la clave 918273
    Then avisa que las claves no coinciden

  @manual
  Scenario: Crear nueva clave correctamente
    When ingreso la clave 192837
    And confirmo la clave 192837
    Then la clave se crea correctamente