# language: en
@Payment_Regretion
@BDSD-1558
Feature:BDSD-1558 Recargas Habituales



#  Background:
#    Given existe el usuario con passcode 192837
#    And el usuario ingresa a la pantalla de login
#    And el usuario acepta los requisitos de identificacion
#    And el usuario ingresa el correo bdsolqe@gmail.com
#    And el usuario confirma el correo
#    And accedo por magic link con mail bdsolqe@gmail.com
#    And ingresa el passcode 192837
#    And el usuario acepta terminos y condiciones
#    And se visualiza la home

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos

#Happy path:
#Usuario realiza recarga  → sistema retiene información de ID de usuario.
  @Payment_Regretion_HappyPath
  @BDSD-1558_HappyPath
  Scenario: Usuario Realiza Recarga, sistema retiene informacion de ID de usuario.
    When usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario presiona Nueva Recarga
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    And   usuario selecciona Recargar 150
    And   Reset wiremock
    And   usuario selecciona Pagar
    Then   usuario selecciona Finalizar


##Realizar una recarga a traves de shortcut:
##Usuario tapea card de recarga favorita en home de recargas que se identifica con un alias personalizado y la estrella amarilla, sistema auto completa datos de cliente y ofrece ingresar monto.
  Scenario: Usuario tapea card de recarga favorita en home de recargas, sistema auto completa datos de cliente y ofrece ingresar monto.
    When   usuario selecciona Seccion de recargas
    And    usuario selecciona Sube Manu de SUBE
    And    usuario selecciona Recargar 150
    And    usuario selecciona Pagar
    Then   usuario selecciona Finalizar


#
##Usuario tapea recarga reciente al entrar a empresas que se identifica con el numero de tarjeta/cliente y con la estrella vacía , sistema auto completa datos de cliente y ofrece ingresar monto.
  Scenario: Usuario tapea recarga reciente, sistema auto completa datos de cliente y ofrece ingresar monto.
    When   usuario selecciona Seccion de recargas
    And    usuario selecciona Empresas de Transporte
    And    usuario selecciona nullSUBE

    And    usuario selecciona VALOR EN RECIENTES

    And    usuario selecciona Recargar 150
    And    usuario selecciona Pagar
    Then   usuario selecciona Finalizar


##Desfavoritear una recarga:
##Usuario desfavoritea una recarga desde home de recargas al tocar la estrella amarilla, sistema muestra modal preguntando si esta seguro que quiere desfavoritear y no muestra mas la recarga en la home de recargas pero si aparece en home de pagos como una recarga reciente con numero de tarjeta/cliente en vez de alias personalizado.
Scenario: Usuario desfavoritea una recarga desde home de recargas, sistema no muestra mas la recarga en la home.
  When   usuario selecciona Seccion de recargas
  And    usuario selecciona Empresas de Transporte
  And    usuario selecciona nullSUBE

  And    usuario selecciona DESFAVORITEAR LABEL
  And    usuario selecciona Eliminar de favoritos
  And    usuario selecciona Eliminar Confirmar
  Then   sistema indica Tarjeta olvidada

#Usuario desfavoritea una recarga favorita desde home de recargas
# y no tiene otros favoritos,
# sistema muestra empty state.

#Usuario desfavoritea una recarga favorita desde home de empresas
# y no tiene otros favoritos,
# sistema muestra empty state o solo recargas favoritas.

  Scenario: Usuario accede por 1era vez a la home de recargas, sistema muestra empty state.
    Given  Get to wiremock /emptyState
    When   usuario selecciona Seccion de recargas
    And    usuario selecciona Empresas de Transporte
    And    sistema indica Acá vas a poder recargar tus servicios de manera fácil y segura

#Favoritear una recarga:
#Usuario favoritea una recarga reciente desde la home de empresas,
# sistema muestra modal para ingresar un alias personalizado
# y luego muestra la recarga como favorita en home de recargas y home de empresas.
  Scenario: Usuario favoritea una recarga reciente desde la home de empresas.
    Given  Get to wiremock /emptyState
    When   usuario selecciona Seccion de recargas
    And    usuario selecciona Empresas de Transporte
    And    usuario selecciona nullSUBE
    And    usuario selecciona Ingresa el codigo de pago
    And    usuario ingresa el valor 6061268061710543
    And    usuario selecciona Continuar

    Then   usuario selecciona FAVORITEAR ESTRELLA



#Usuario swipea una recarga favorita, sistema ofrece seleccionar la opción de editar.
  Scenario: Usuario swipea una recarga favorita, sistema ofrece seleccionar la opción de editar.
    When   usuario selecciona Seccion de recargas
    #  FALTA ACCION DE SWIPEAR
    And    sistema indica Editar detalle ${alias} ${companyName}



#Usuario selecciona la opción de editar al swipear una recarga favorita, sistema muestra:
#    Opción de editar alias.
#    Opción de tapear la estrella amarilla de favoritos para que sea una recarga reciente y deje de ser favorito ( no muestra modal preguntando).
  Scenario: Usuario selecciona la opción de editar, sistema ofrece seleccionar la opción de editar.
    When   usuario selecciona Seccion de recargas
    #  FALTA ACCION DE SWIPEAR
    And    usuario selecciona Editar detalle ${alias} ${companyName}
    Then   sistema indica EDITAR ALIAS
    And    sistema indica DESFAVORITEAR



#Validación de errores/ alertas:
#Usuario edita alias de una recarga favorita, sistema debe cambiar alias de recarga en home de recargas y en home de empresas.
  Scenario: Usuario edita alias de una recarga favorita.
    When   usuario selecciona Seccion de recargas
    And    usuario selecciona Editar detalle ${alias} ${companyName}
    And    usuario presiona Editar alias de tarjeta
    And    usuario completa el campo campo de texto con el valor Alias Recarga
    Then   usuario presiona guardar alias



