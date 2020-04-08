# language: en
@Payment_Regretion
@BDSD-5714
Feature:BDSD-5714 Buscador de servicios - Nueva Home



 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos

#Happy path
#Usuario selecciona FAB,
# sistema muestra modal con la opcion de “buscar servicio”.
#Usuario selecciona “ buscar servicio”,
# sistema redirige al usuario a la home de busqueda.
#Usuario escribe en el buscador una empresa,
# sistema muestra resultados de la busqueda.
#Usuario tapea una empresa de las buscadas,
# sistema redirige al flujo de pago.
#Usuario finaliza el pago,
# sistema redirige a la home de pagos.

  @BDSD-5714_HappyPath
  Scenario: Usuario selecciona FAB, sistema muestra modal con la opcion de “buscar servicio”, usuario realiza flujo de pago.
    When usuario accede a pagos
    And   usuario selecciona FAB
    And   sistema indica MODALCONOPCIONBUSCARSERVICIO
    And   usuario selecciona BUSCARSERVICIO
    And   sistema indica HOMEDEBUSQUEDA
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123123123123
    And   usuario selecciona Continuar
    And   usuario selecciona Edenor 24/12/19 212.31
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar


#Validación de errores/alertas
# Usuario realiza una busqueda de una empresa de recarga “ SUBE”,
#   sistema muestra los resultados.
  Scenario: Usuario realiza una busqueda de una empresa de recarga “ SUBE”, usuario realiza flujo de recarga.
    When usuario accede a pagos
    And   usuario selecciona FAB
    And   sistema indica MODALCONOPCIONBUSCARSERVICIO
    And   usuario selecciona BUSCARSERVICIO
    And   sistema indica HOMEDEBUSQUEDA
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    And   usuario selecciona Recargar 150
    And   Reset wiremock
    And   usuario selecciona Pagar
    Then   usuario selecciona Finalizar



# Usuario selecciona una empresa desde la pantalla principal del buscador,
# sistema redirige al flujo de pago.

  Scenario: Usuario selecciona una empresa desde la pantalla principal del buscador,sistema redirige al flujo de pago.
    When usuario accede a pagos
    And   usuario selecciona FAB
    And   sistema indica MODALCONOPCIONBUSCARSERVICIO
    And   usuario selecciona Edenor
    And   usuario ingresa el valor 123123123123
    And   usuario selecciona Continuar
    And   usuario selecciona Edenor 24/12/19 212.31
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    And   usuario selecciona Finalizar