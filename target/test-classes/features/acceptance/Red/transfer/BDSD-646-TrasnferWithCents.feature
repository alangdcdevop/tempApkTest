# language: en
@BDSD-415
Feature: Transferencia con centavos

  Como usuario
  Quiero realizar una transferencia por montos con centavos

  Background: Usuario existente que se loguea e ingresa en tab transferencias con TyC aceptados
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe+dev30@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
    And ingresa el passcode 663755
    And el usuario accede a transferencias


  @BDSD-646
  Scenario Outline: El usuario realiza una transferencia exitosa por monto con centavos monobanco
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe+dev30@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
    And ingresa el passcode 663755
    And el usuario accede a transferencias
    And ingresa el cbu <cbu>
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And ingresa el monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia
#    And valida la existencia del nuevo contacto en la agenda
    Examples:
      | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      |     500.35    | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A "  | 0596373553	| "CA"    | 20347123200 | 1500009100005963735532  |

  @BDSD-646
  Scenario Outline: El usuario realiza una transferencia exitosa por monto con centavos a terceros de otro banco
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe+dev30@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
    And ingresa el passcode 663755
    And el usuario accede a transferencias
    And ingresa el cbu <cbu>
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And ingresa el monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios

    Examples:
      | monto | nombre             | banco                 | ncuenta    | tcuenta | cuil        | cbu                    |
      | 500   | "DOMINGUEZ FRANCISCO" | "BANCO DEL SOL DIGITAL" | 1000001119 | "CA"    | 20397727433 | 3108100900010000011195 |