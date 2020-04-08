@BDSD-3485
Feature: Notificaciones push con vencimiento - Agenda

  Como usuario,
  Quiero recibir notificaciones sobre próximos vencimientos de servicio agendados
  para completar mis pagos a tiempo.



  Scenario: Usuario paga un servicio con con monto editable para ARRIBA no modifica el monto y paga OK
    When  usuario revisa notificaciones


#  Usuario edita un servicio agendado y habilita notificaciones
  @BDSD-3485_HappyPath
  Scenario: Usuario edita un servicio agendado y habilita notificaciones.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Editar Servicio
    And   usuario selecciona Habilitar Notificaciones
    And   usuario selecciona Guardar
    Then  sistema envía push notification a usuario.
    And   usuario recibe notificación.


#  Usuario agenda un servicio nuevo, y habilita notificaciones
  Scenario: Usuario agenda un servicio nuevo, y habilita notificaciones
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Agendar nuevo servicio
    And   usuario selecciona categoria
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Habilitar Notificaciones
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar
    And   sistema envía push notification a usuario.
    And   usuario recibe notificación.

#Validaciones y alertas:
#Usuario edita un servicio agendado y deshabilita notificaciones
  Scenario: Usuario edita un servicio agendado y habilita notificaciones.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Editar Servicio
    And   usuario selecciona NO Habilitar Notificaciones
    And   usuario selecciona Guardar
    Then  sistema NO envía push notification a usuario.
    And   usuario NO recibe notificación.

#Usuario agenda un servicio nuevo, y deshabilita notificaciones
  Scenario: Usuario agenda un servicio nuevo, y deshabilita notificaciones:
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Agendar nuevo servicio
    And   usuario selecciona categoria
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario completa el campo campo de texto con el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona NO Habilitar Notificaciones
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   sistema indica Finalizar
    Then  sistema NO envía push notification a usuario.
    And   usuario NO recibe notificación.
