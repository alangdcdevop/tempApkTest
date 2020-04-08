@Payment_Regretion_HappyPath
@BDSD-1195
Feature:BDSD-1195 Primer Pago

  Como Usuario,
  Quiero buscar un servicio, impuesto o tarjeta a través de la app de BDS.
  Para poder hacer el pago del mismo.

 Background: Reiniciar Datos
   Given Reset wiremock
   When  usuario accede a pagos

# Happy paths!:

  @BDSD-1195_HappyPath
  Scenario: Usuario paga un servicio con con monto editable para ARRIBA no modifica el monto y paga OK
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar empresa
    And   usuario completa el campo Buscar empresa con el valor Anticipo (Gcia.)
    And   usuario selecciona Ir a rubros de Anticipo (Gcia.)
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

  Scenario: Usuario paga un servicio con con monto editable para ARRIBA e indica el monto para ARRIBA y paga OK
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Anticipo (Gcia.)
    And   usuario selecciona Ir a rubros de Anticipo (Gcia.)
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario presiona borrar 2 veces
    And   usuario ingresa el valor 99
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

  Scenario: Usuario paga un servicio con con monto editable e indica el monto para ARRIBA y paga OK
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Multa 140
    And   usuario selecciona Ir a rubros de Multa 140
    And   usuario ingresa el valor 1234567890
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario presiona borrar 2 veces
    And   usuario ingresa el valor 99
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

  Scenario: Usuario paga un servicio con con monto editable e indica el monto para ABAJO y paga OK
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Multa 140
    And   usuario selecciona Ir a rubros de Multa 140
    And   usuario ingresa el valor 1234567890
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario presiona borrar 4 veces
    And   usuario ingresa el valor 1
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

## Validaciones de errores/altertas:

  Scenario: Usuario paga un servicio sin saldo en la cuenta
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Medcar
    And   usuario selecciona Ir a rubros de Medcar
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    Then  usuario ingresa el valor 999999999

  Scenario: Usuario paga un servicio con con monto editable para ARRIBA e indica el monto para ABAJO
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Anticipo (Gcia.)
    And   usuario selecciona Ir a rubros de Anticipo (Gcia.)
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario presiona borrar 4 veces
    Then  usuario ingresa el valor 1

  Scenario: Usuario paga un servicio con con monto editable y deja el monto vacio
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Medcar
    And   usuario selecciona Ir a rubros de Medcar
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario presiona borrar 4 veces
    Then  usuario ingresa el valor 0


