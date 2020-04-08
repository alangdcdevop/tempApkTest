# language: en
@Issue:BDSD-671
Feature: Simulación de un plazo fijo

  Yo como usuario
  Quiero simular un plazo fijo
  Para confirmar si las tasas son atractivas para una inversión y constituirlo

  Background:
    Given existe el usuario con passcode 123456
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 123456
    And cierra los hints y vista de telefono
    And el usuario tiene un saldo de 8000.10 pesos en su cuenta principal

  @Issue:BDSD-673 @Issue:BDSD-672 @Issue:BDSD-680 @Service
  Scenario Outline: El usuario constituye un plazo fijo exitosamente
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia habil el 09/05/2019
    And el usuario hace click en nuevo plazo fijo
    And ingresa el monto 4000.34 pesos
    And hace click en siguiente para visualizar las opciones de plazo fijo
    And se visualiza el monto a cobrar de $ 4.164.74 a 1 meses
    And se visualiza el monto a cobrar de $ 4.493.53 a 3 meses
    And se visualiza el monto a cobrar de $ 6.000.51 a 12 meses
    And selecciona el plazo a <plazo_en_meses> meses
    When confirma el plazo fijo por <monto_a_cobrar> pesos a <dias> dias con fecha <fecha_de_vencimiento>
    Then el plazo fijo se realiza exitosamente
    And puede ver el comprobante de plazo fijo
    And puede compartir el comprobante

    Examples:
      | plazo_en_meses | monto_a_cobrar    | dias | fecha_de_vencimiento |
      | 1              | 4164.737534246576 | 30   | "09/06/2019"         |
      | 3              | 4493.532602739727 | 90   | "08/08/2019"         |
      | 12             | 6000.51           | 365  | "09/05/2020"         |

  @Issue:BDSD-673 @Issue:BDSD-672 @Issue:BDSD-680
  Scenario Outline: El usuario no puede constituir un plazo fijo porque el servicio no está disponible
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia habil el 09/05/2019
    And el usuario hace click en nuevo plazo fijo
    And ingresa el monto 4000.34 pesos
    And hace click en siguiente para visualizar las opciones de plazo fijo
    And selecciona el plazo a 3 meses
    When la confirmacion del plazo fijo por <monto_a_cobrar> pesos a <dias> dias con fecha <fecha_de_vencimiento> da error <estado>
    Then se visualiza la pantalla de error general

    Examples:
      | monto_a_cobrar    | dias | fecha_de_vencimiento | estado |
      | 4493.532602739727 | 90   | "08/08/2019"         | 500    |
      | 4493.532602739727 | 90   | "08/08/2019"         | 403    |
      | 4493.532602739727 | 90   | "08/08/2019"         | 404    |


  @Issue:BDSD-673
  Scenario: El usuario no tiene saldo suficiente para constituir un plazo fijo
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia habil el 09/05/2019
    And el usuario hace click en nuevo plazo fijo
    When ingresa el monto 9000 pesos
    Then se visualiza el mensaje 'el saldo es insuficiente para esta operación'

  @Issue:BDSD-673
  Scenario: El usuario intenta constituir un plazo fijo con un monto menor al mínimo
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia habil el 24/04/2019
    And el usuario hace click en nuevo plazo fijo
    When ingresa el monto 600 pesos
    Then se visualiza el mensaje 'el monto mínimo es de $1000'

  @Issue:BDSD-673
  Scenario Outline: El usuario intenta constituir un plazo fijo en un día no hábil
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia no habil el <fecha>
    And el usuario hace click en nuevo plazo fijo
    Then se visualiza el mensaje 'los plazos fijos solo pueden ser constituidos en días hábiles'

    Examples:
      | fecha      |
      | 01/05/2019 |
      | 27/04/2019 |
      | 28/04/2019 |

  @Issue:BDSD-673
  Scenario: El usuario intenta constituir un plazo fijo con un monto que supera la cantidad máxima de dígitos
    Given el usuario no posee un plazo fijo constituido
    And el usuario accede a inversiones
    And es dia habil el 24/04/2019
    And el usuario hace click en nuevo plazo fijo
    When ingresa el monto 10000000000000000 pesos
    Then se visualiza el mensaje 'superaste la cantidad máxima de dígitos permitidos'