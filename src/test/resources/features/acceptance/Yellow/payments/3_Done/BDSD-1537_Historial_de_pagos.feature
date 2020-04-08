@Payment_Regretion_HappyPath
@BDSD-1537
Feature: BDSD-1537 Historial de Pagos

  Como usuario,
  Quiero poder visualizar pagos pasados y comprobantes.
  Para comparar con pagos actuales, usar en reclamos u otros.
 
 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
# Happy path:
#     Usuario paga un servicio, debe encontrar el registro en el historial scrolleando.
#     Usuario genera un pago singular con vencimiento, sistema debe guardar en historial.


  @BDSD-1537_HappyPath
  Scenario: Usuario paga un servicio, debe encontrar el registro en el historial scrolleando
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123456789012
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Continuar
    And   usuario selecciona Editar alias de servicio
    And   usuario completa el campo campo de texto con el valor Electricidad
    And   usuario selecciona Guardar nuevo alias de servicio
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar
    And   usuario selecciona Ir a historial de pagos
    And   usuario selecciona Ver pagos efectuados el 2019
    Then sistema indica Electricidad Edenor de 10055.00 pagado el 2019-12-16T14:50:50.904+00:00


##    Usuario paga un servicio, debe encontrar el registro en el historial buscando por criterio relevante.

  Scenario: Usuario pago un servicio, debe encontrar el registro en el historial buscando por empresa
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    And   usuario completa el campo Buscar pagos efectuados con el valor Edenor
    Then sistema indica Electricidad Edenor de 10055.00 pagado el 2019-12-16T14:50:50.904+00:00

  Scenario: Usuario pago un servicio, debe encontrar el registro en el historial buscando por alias
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    And   usuario completa el campo Buscar pagos efectuados con el valor Electricidad
    Then sistema indica Electricidad Edenor de 10055.00 pagado el 2019-12-16T14:50:50.904+00:00

#  Usuario ingresa a una card del historial, sistema debe permitir compartir.
  Scenario: Usuario ingresa a una card del historial, sistema debe permitir compartir.
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    And   usuario completa el campo Buscar pagos efectuados con el valor Electricidad
    Then  usuario selecciona Electricidad Edenor de 10055.00 pagado el 2019-12-16T14:50:50.904+00:00
    And   sistema permite compartir

#  Usuario despliega card de año, sistema debe mostrar todos los pagos agrupados por mes y todos los meses desplegados.
  Scenario: Usuario despliega card de año, sistema debe mostrar todos los pagos agrupados por mes.
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    And   usuario completa el campo Buscar pagos efectuados con el valor Electricidad
    And   usuario selecciona Ver pagos efectuados el 2019


#  Usuario ingresa a historial sin pagos, sistema muestra mensaje
  Scenario: Usuario ingresa a historial sin pagos, sistema muestra mensaje
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    Then  Sistema muestra alerta con texto Acá vas a encontrar los comprobantes de pago de tus servicios

#
#  Usuario ingresa texto que no corresponde con alias o empresa existente en pagos, sistema muestra mensaje

  Scenario: Usuario pago un servicio, debe encontrar el registro en el historial buscando por empresa
    When  usuario accede a pagos
    And   usuario selecciona Ir a historial de pagos
    And   usuario completa el campo Buscar pagos efectuados con el valor NOEXISTENTE
    Then  Sistema muestra alerta con texto "NOEXISTENTE" no corresponde a ningún pago anterior en tu historial


