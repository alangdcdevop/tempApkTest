# language: en
@Issue:BDSD-694
Feature: Transferencia a un contacto existente

  Como usuario
  Quiero realizar una transferencia a un nuevo existente
  Para operar con mi app

  Background: Usuario existente que se loguea e ingresa en tab transferencias.
    Given existe el usuario con passcode 663755
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo gabriel.nicora+test4@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail gabriel.nicora@gmail.com y password carolinatomas6
    And ingresa el passcode 663755
#   And el usuario acepta terminos y condiciones
    And el usuario accede a transferencias

  @Issue:BDSD-694 @Issue:BDSD-646 @Regresion
  Scenario Outline: El usuario realiza una transferencia exitosa a la caja de ahorro de un contacto favorito
    Given selecciona contacto <contacto>
    And el usuario ingresa en detalle de transacciones de la <cuenta>
    And el usuario hace click en boton transferir
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente
    And ingresa el monto <monto>
    And hace click en siguiente
    And valido nombre <nombre> monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito2" | 2     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito3" | 3     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito4" | 4     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |


  @Issue:BDSD-646
  Scenario Outline: El usuario realiza una transferencia exitosa a la caja de ahorro de un contacto favorito ingresando al contacto desde la agenda
    Given el usuario accede a su agenda
    And selecciona contacto <contacto>
    And el usuario ingresa en detalle de transacciones de la <cuenta>
    And el usuario hace click en boton transferir
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente
    And ingresa el monto <monto>
    And hace click en siguiente
    And valido nombre <nombre> monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito2" | 2     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito3" | 3     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
      | "favorito4" | 4     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |


  @Issue:BDSD-694 @Issue:BDSD-646
  Scenario Outline: El usuario realiza una transferencia exitosa a la cuenta corriente de un contacto favorito ingresando al contacto desde home de transferencias
    Given selecciona contacto <contacto>
    And el usuario ingresa en detalle de transacciones de la <cuenta>
    And el usuario hace click en boton transferir
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente
    And ingresa el monto <monto>
    And hace click en siguiente
    And valido nombre <nombre> monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito2" | 2     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito3" | 3     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito4" | 4     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |


  @Issue:BDSD-694 @Issue:BDSD-646 @Regresion
  Scenario Outline: El usuario realiza una transferencia exitosa a la cuenta corriente de un contacto favorito ingresando al contacto desde la agenda
    Given el usuario accede a su agenda
    And selecciona contacto <contacto>
    And el usuario ingresa en detalle de transacciones de la <cuenta>
    And el usuario hace click en boton transferir
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente
    And ingresa el monto <monto>
    And hace click en siguiente
    And valido nombre <nombre> monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito2" | 2     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito3" | 3     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      | "favorito4" | 4     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |

  @Issue:BDSD-694 @Issue:BDSD-646 @Regresion
  Scenario Outline: El usuario realiza una transferencia exitosa a la caja de ahorro de un contacto no favorito desde la agenda
    Given el usuario accede a pantalla de contactos

   Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      
  @Issue:BDSD-594
  Scenario Outline: El usuario realiza una transferencia exitosa con centavos
    Given el usuario accede a su agenda
    And selecciona contacto <contacto>
    And el usuario ingresa en detalle de transacciones de la <cuenta>
    And el usuario hace click en boton transferir
    When hace click en siguiente
    And hace click en siguiente
    And ingresa el monto <monto>
    And hace click en siguiente
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | contacto    | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | "favorito1" | 1     | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CC"    | 20347123200 | 1500009100005963735532 |
      