# language: en
@BDSD-415
Feature: Transferencia a un contacto nuevo

  Como usuario
  Quiero realizar una transferencia a un nuevo contacto
  guardando los contactos nuevos en mi agenda


  Background: Usuario existente que se loguea e ingresa en tab transferencias con TyC aceptados
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe+dev30@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 663755
    And el usuario accede a transferencias
 #   And hace click en Nueva Transferencia
  #  And el usuario selecciona Ver Agenda

  @BDSD-683
  Scenario Outline: El usuario realiza una transferencia exitosa, a la caja de ahorro de otro banco, de un contacto nuevo a través de un CBU con
  motivo de transferencia por defecto grabando el nuevo contacto en su agenda
    Given ingresa el cbu <cbu>
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
      | 500   | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A " | 0596373553 | "CA"    | 20347123200 | 1500009100005963735532 |
 #     |     500.35    | "VERGARA, LEONEL/" | "HSBC BANK ARG. S.A "  | 0596373553	| "CA"    | 20347123200 | 1500009100005963735532  |

  @BDSD-683
  Scenario Outline: El usuario realiza una transferencia exitosa, a la caja de ahorro de bdsol, de un contacto nuevo a través de un CBU con
  motivo de transferencia por defecto grabando el nuevo contacto en su agenda
    Given ingresa el cbu <cbu>
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
      | monto | nombre                | banco                   | ncuenta    | tcuenta | cuil        | cbu                    |
      | 500   | "DOMINGUEZ FRANCISCO" | "BANCO DEL SOL DIGITAL" | 1000001119 | "CA"    | 20397727433 | 3108100900010000011195 |
#      |     500.35    | "DOMINGUEZ FRANCISCO" | "BANCO DEL SOL DIGITAL"  | 1000001119	| "CA"    | 20397727433 | 3108100900010000011195  |


  @BDSD-694 @BDSD-646 @BDSD-594
  Scenario Outline: El usuario realiza una transferencia exitosa a la cuenta corriente de un contacto nuevo a través de un alias con
  motivo de transferencia por defecto
    Given ingresa el alias ROJO.ROSA.ROMULO
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And ingresa el monto <monto>
    And selecciona cuenta corriente
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | monto  |
      | 500    |
      | 500.35 |

  @BDSD-694 @BDSD-646 @BDSD-594
  Scenario Outline: El usuario realiza una transferencia exitosa a la cuenta corriente de un contacto nuevo a través de un CBU con
  motivo de transferencia por defecto
    Given ingresa el cbu 342432234464
    And hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And ingresa el monto <monto>
    And selecciona cuenta corriente
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia

    Examples:
      | monto  |
      | 500    |
      | 500.35 |

  @BDSD-694
  Scenario: El usuario intenta realizar una transferencia a un contacto nuevo con un alias inválido
    Given ingresa el alias ROJO.ROSA.XXXXXX
    When hace click en siguiente
    Then se visualiza el mensaje Corroborá los datos ingresados

  @BDSD-694
  Scenario: El usuario intenta realizar una transferencia a un contacto nuevo con un CBU inválido
    Given ingresa el cbu 111111111111
    When hace click en siguiente
    Then se visualiza el mensaje Corroborá los datos ingresados
    
    
   





