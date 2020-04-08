@Payment_Regretion_HappyPath
@BDSD-4163
Feature:BDSD-4163 Boton de Pago Espontaneo



  Como usuario,
  Quiero poder realizar pagos espontáneos en todas las facturas mixtas
  para poder realizar pagos sin “matar” las facturas por vencer.

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos

  @BDSD-4163_HappyPath
  Scenario: Usuario selecciona a pagar una factura mixta selecciona el botón de pago espontaneo y realiza un pago.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Efectuar un pago espontáneo
    And   sistema muestra elemento Título con texto El importe que ingreses no cancelará ningún vencimiento vigente.
    And   usuario selecciona Efectuar
    And   sistema indica Este importe no cancelará ningún vencimiento vigente
    And   usuario completa el campo Ingresa el monto a pagar con el valor 400
    And   usuario selecciona Continuar
    And   sistema indica Vas a efectuar un pago espontáneo a Visa por 400 pesos
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar


  Scenario: Usuario selecciona a pagar una factura mixta selecciona el botón de pago espontaneo e ingresa monto 0.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Efectuar un pago espontáneo
    And   sistema indica El importe que ingreses no cancelará ningún vencimiento vigente.
    And   usuario selecciona Efectuar
    And   sistema indica Este importe no cancelará ningún vencimiento vigente
    And   usuario completa el campo campo de texto con el valor 0
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Vas a efectuar un pago espontáneo a Visa por 400 pesos


  Scenario: Usuario selecciona a pagar una factura mixta selecciona el botón de pago espontaneo e ingresa monto mayor a saldo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Efectuar un pago espontáneo
    And   sistema indica El importe que ingreses no cancelará ningún vencimiento vigente.
    And   usuario selecciona Efectuar
    And   sistema indica Este importe no cancelará ningún vencimiento vigente
    And   usuario completa el campo campo de texto con el valor 9999999
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Vas a efectuar un pago espontáneo a Visa por 400 pesos



  Scenario: Usuario selecciona a pagar una factura mixta de un servicio no agendado,no tiene vencimientos selecciona el botón de pago espontaneo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   sistema indica Agendar servicio
    And   sistema muestra elemento Informacion con texto No tenés vencimientos informados para este servicio


  Scenario: Usuario selecciona a pagar una factura mixta de un servicio ya agendado, no tiene vencimientos selecciona el botón de pago espontaneo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   sistema no muestra el valor Agendar servicio
    And   sistema muestra elemento Informacion con texto No tenés vencimientos informados para este servicio
    And   usuario selecciona Pago espontáneo
    And   sistema indica El importe que ingreses no cancelará ningún vencimiento vigente.
    And   usuario selecciona Efectuar
    And   sistema indica Este importe no cancelará ningún vencimiento vigente
    And   usuario completa el campo campo de texto con el valor 9999999
    And   usuario selecciona Continuar
    Then  sistema muestra elemento mensaje de error con texto No tenés saldo suficiente en tu Caja de Ahorro


