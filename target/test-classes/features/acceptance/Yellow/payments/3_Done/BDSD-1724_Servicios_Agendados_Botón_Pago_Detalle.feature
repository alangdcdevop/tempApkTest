@Payment_Regretion_HappyPath
@BDSD-1724
Feature: BDSD-1724 Servicios Agendados: Botón Pago Detalle

  Como usuario,
  Quiero tener acceso a pagar servicios desde agenda (informen factura, no informen o sean mixtos).
  Para no tener que recorrer el camino de primer pago cada vez.


 Background: Reiniciar Datos
    Given Reset wiremock
     When  usuario accede a pagos

#Happy path:

  @BDSD-1724_HappyPath
    Scenario: Usuario ingresa a agenda selecciona el detalle de un servicio con vencimiento y elige pagar.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Edenor
    And   usuario selecciona EdenorConFactNoEditable Edenor
    And   usuario selecciona Pagar servicio
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar


#  Dado que el usuario agendó un servicio sin vencimiento previamente:

  Scenario: Usuario ingresa a agenda selecciona el detalle de un servicio sin vencimiento y elige pagar.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Medcar
    And   usuario selecciona MedcarNoFact Medcar
    And   usuario selecciona Pagar servicio
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar

#  Dado que el usuario agendó un servicio mixto previamente:

  Scenario: Usuario ingresa a agenda selecciona el detalle de un servicio mixto con vencimiento y elige pagar factura.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Visa
    And   usuario selecciona VisaConFact Visa
    And   usuario selecciona Pagar servicio
    And   usuario selecciona Visa 31/05/19 990.00
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar

  Scenario: Usuario ingresa a agenda selecciona el detalle de un servicio mixto con vencimiento y elige hacer un pago espontaneo.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Visa
    And   usuario selecciona VisaConFact Visa
    And   usuario selecciona Pagar servicio
    And   usuario selecciona Efectuar un pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar

  Scenario: Usuario ingresa a agenda selecciona el detalle de un servicio mixto sin vencimiento y elige pagar.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Visa
    And   usuario selecciona VisaSinFact Visa
    And   usuario selecciona Pagar servicio
    And   usuario selecciona Pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar


#Validaciones de errores/alertas:
#  Usuario no confirma pago desde servicios agendados, no tiene que desaparecer de home de servicios.
  Scenario: Usuario no confirma pago desde servicios agendados, no tiene que desaparecer de home de servicios.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario completa el campo Buscar servicio agendado con el valor Edenor
    And   usuario selecciona EdenorConFactNoEditable Edenor
    And   usuario selecciona Pagar servicio
    And   usuario presiona Boton Volver Atras
    And   usuario presiona Boton Volver Atras
    And   usuario presiona Boton Volver Atras
    Then  sistema indica EdenorConFactNoEditable con vencimiento el 04/12/21 por un monto de 10055

#  Usuario intenta pagar por detalle una factura con vencimiento sin facturas pendientes

  Scenario: Usuario intenta pagar por detalle una factura con vencimiento sin facturas pendientes
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona EdenorSinFact Edenor
    And   usuario selecciona Pagar servicio
    Then  sistema indica accessibilityLabel.emptyStateText
