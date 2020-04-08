# language: en
@Issue:BDSD-671
Feature: Posición consolidada de un plazo fijo

  Yo como usuario que posee un plazo fijo consituido
  Quiero poder visualizar el estado de la operación
  Para controlar cuando se acredita y el monto

  Background:
    Given existe el usuario con passcode 123456
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 123456
    And cierra los hints y vista de telefono

  @Issue:BDSD-677
  Scenario: El usuario posee un plazo fijo e ingresa a inversiones
    Given el usuario posee un plazo fijo con un monto invertido de 4000.34 pesos con un TNA del 50% y fecha de constitucion el 09/05/2019
    When el usuario accede a inversiones
    Then se visualiza la posicion consolidada con un monto a cobrar de 6000.51 pesos
    And se visualiza la posicion consolidada con un TNA del 50%
    And se visualiza la posicion consolidada con fecha de acreditacion al 09/05/2020

  @Issue:BDSD-677
  Scenario: El usuario no posee un plazo fijo e ingresa a inversiones
    Given el usuario no posee un plazo fijo constituido
    When el usuario accede a inversiones
    Then se visualiza la pantalla no tenes ningun plazo fijo

  @Issue:BDSD-677
  Scenario Outline: El usuario no puede visualizar su plazo fijo porque el servicio no está disponible
    Given el usuario posee un plazo fijo con un monto invertido de 4000.34 pesos con un TNA del 50% y fecha de constitucion el 09/05/2019
    And el servicio de consulta de plazo fijo devuelve estado <estado>
    When el usuario accede a inversiones
    Then se visualiza la pantalla de error general

    Examples:
      | estado |
      | 500    |
      | 403    |
      | 404    |

  @Issue:BDSD-677
  Scenario: El usuario posee un plazo fijo e ingresa al detalle del mismo dentro de inversiones
    Given el usuario posee un plazo fijo con un monto invertido de 4000.34 pesos con un TNA del 50% y fecha de constitucion el 09/05/2019
    When accede al plazo fijo constituido
    Then se visualiza el monto invertido de 4000.34 pesos
    And se visualiza el monto a cobrar de 6000.51 pesos a 12 meses
    And se visualiza un TNA del 50%
    And se visualiza la fecha de acreditacion al 09/05/2020

