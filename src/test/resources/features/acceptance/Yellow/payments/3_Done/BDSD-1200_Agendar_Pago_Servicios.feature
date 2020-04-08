## language: en
@Payment_Regretion_HappyPath
@BDSD-1200

Feature: BDSD-1200 Agenda de pagos
  Como usuario,
  Quiero agendar un servicio
  Para Identificarlo con un alias , Recibir alertas de vencimiento y Pagar recurrentemente.

 Background: Reiniciar Datos
    Given Reset wiremock
    When  usuario accede a pagos

# Happy paths:
  @BDSD-1200_HappyPath
  Scenario: Usuario paga un servicio, elige agendar, aparece en lista de servicios agendados
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123456789012
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar
    And   usuario selecciona Ir a servicios agendados
    Then  sistema indica EdenorConFactNoEditable Edenor

  Scenario: Usuario busca un servicio para agendarlo.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario presiona Agendar Nuevo
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123123123123
    And   usuario selecciona Continuar
    Then  usuario presiona Guardar Servicio
    And   sistema indica EdenorConFactNoEditable Edenor

  Scenario: Usuario busca servicio ya agendado, modifica alias
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario presiona Editar Alias
    And   usuario selecciona campo de texto
    And   usuario presiona borrar 4 veces
    And   usuario ingresa el valor 1
    And   usuario presiona Guardar

  Scenario: Usuario busca servicio ya agendado, olvida servicio desde Detalle
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Olvidar este servicio
    And   usuario presiona Olvidar Confirmar

  Scenario: Usuario busca servicio ya agendado, olvida servicio desde Swipe
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Olvidar este servicio
    And   usuario presiona Olvidar Confirmar

  Scenario: Usuario intenta agendar un servicio ya pagado y agendado, sistema no lo permite e informa a usuario
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario presiona Agendar Nuevo
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123456789012
    And   usuario selecciona Continuar
    Then  sistema muestra elemento mensaje de error con texto Este servicio ya se encuentra en tu agenda
