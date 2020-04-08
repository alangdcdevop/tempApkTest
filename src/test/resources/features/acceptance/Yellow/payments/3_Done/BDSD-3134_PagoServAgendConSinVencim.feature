@Payment_Regretion_HappyPath
@BDSD-3134
Feature: BDSD-3134 Pago servicios agendados con sin vencimiento


 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   

  @BDSD-3134_HappyPath
  Scenario: Usuario selecciona una factura con vencimiento, sistema redirige al usuario al flujo de pago bajo
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Edenor
    And   usuario selecciona EdenorConFactNoEditable Edenor
    And   sistema indica Edenor con vencimiento el 04/12/21
    And   sistema indica Desde tu caja de ahorro con saldo de 1097927.29 pesos
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  Dado que el usuario agendó un servicio sin vencimiento previamente:

  Scenario: Usuario selecciona una factura sin vencimiento, sistema redirige al usuario al flujo de pago bajo
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Medcar
    And   usuario selecciona Olvidar el servicio MedcarNoFact Medcar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  Dado que el usuario agendó un servicio mixto con factura previamente:

  Scenario: Usuario selecciona una factura de servicio mixto con vencimiento, sistema redirige al usuario al flujo de pago bajo
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Visa
    And   usuario selecciona Olvidar el servicio VisaConFact Visa
    And   usuario selecciona Visa 31/05/19 990.00
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  Dado que el usuario agendó un servicio mixto con factura previamente:

  Scenario: Usuario selecciona una factura de servicio mixto sin vencimiento, sistema redirige al usuario al flujo de pago bajo
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Visa
    And   usuario selecciona Olvidar el servicio VisaSinFact Visa
    And   usuario selecciona Pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  Validaciones de errores/alertas:
#  Usuario no confirma pago desde shortcut, no tiene que desaparecer de home de servicios.

  Scenario: Usuario no confirma pago desde shortcut, no tiene que desaparecer de home de servicios.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Edenor
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Continuar
    And   usuario presiona Boton Volver Atras
    And   usuario presiona Boton Volver Atras
    And   usuario presiona Boton Volver Atras
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Pagar servicio agendado
    And   usuario completa el campo Buscar servicio agendado con el valor Edenor
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    Then  sistema indica Continuar





