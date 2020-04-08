@Payment_Regretion_HappyPath
@BDSD-1339
Feature: BDSD-1339 Primera Recarga

  Como Usuario,
  Quiero encontrar una empresa a través de la app de BDS.
  Para poder hacer la recarga de un servicio.

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
  
# Happy path SUBE:
#  Usuario recarga servicio OK
  @BDSD-1339_HappyPath
  Scenario: Usuario recarga servicio, sistema muestra el mismo con su alias en home de recargas
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
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



##  Usuario ingresa a recargas, sistema debe mostrar rubros.
  Scenario: Usuario ingresa a recargas, sistema debe mostrar rubros
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    Then  sistema indica Empresas de Transporte
    And   sistema indica Empresas de Celular
    And   sistema indica Empresas de Television


# N/A las empresas son dinamicas
#  Usuario elige rubro “transporte”, sistema debe mostrar empresas de transporte.


#  Usuario elige empresa SUBE, sistema debe ofrecer ingresar 16 digitos.
# OK
  Scenario: Usuario elige empresa SUBE, sistema debe ofrecer ingresar 16 digitos
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario presiona Nueva Recarga
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto Son 16 dígitos

#  Usuario ingresa nro de tarjeta y confirma, sistema muestra montos pre determinables:  50, 100, 150, 200, 250, 300, 400, 500, 600, 700, 800.
  
  Scenario: Usuario elige empresa SUBE, sistema muestra los siguientes montos: 50, 100, 150, 200, 250, 300, 400, 500, 600, 700, 800.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario presiona Nueva Recarga
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    Then  sistema indica Recargar 50
    And   sistema indica Recargar 100
    And   sistema indica Recargar 150
    And   sistema indica Recargar 200

#  Usuario elige monto, sistema muestra pantalla de pre confirmación.
  Scenario: Usuario ingresa nro de tarjeta y confirma, sistema muestra montos pre determinables
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario presiona Nueva Recarga
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    And   usuario selecciona Recargar 50
    Then  sistema indica Vas a pagar a SUBE 50 pesos

#  Sistema muestra pantalla de pre confirmación,  usuario debe poder editar alias y confirmar pago.
  Scenario: Sistema muestra pantalla de pre confirmación,  usuario debe poder editar alias y confirmar pago.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario presiona Nueva Recarga
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    And   usuario selecciona Recargar 50
    And   usuario presiona Editar alias de tarjeta
    And   usuario completa el campo campo de texto con el valor SUBETE
    And   usuario presiona guardar alias
    And   usuario selecciona Pagar
    Then  usuario selecciona Finalizar

#  Usuario finaliza flujo con empresa SUBE, sistema muestra bajada “ Recarga efectuada, Acordate de acreditar la carga en una Terminal Automática SUBE”.
  #OK
  Scenario: Usuario recarga servicio, sistema muestra el mismo con su alias en home de recargas
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSUBE
    And   usuario selecciona Entendido
    And   usuario presiona Nueva Recarga
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 6061268061710543
    And   usuario selecciona Continuar
    And   usuario selecciona Recargar 50
    And   usuario selecciona Pagar
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="accessibilityLabel.mesage"]/android.widget.TextView[2] con texto Recordá acreditar la carga en una Terminal Automática SUBE o en un dispositivo con NFC.
  
##  Sistema debe guardar comprobante por default.


###  Usuario elige empresa MOVI, sistema debe ofrecer ingresar 16 digitos.
  Scenario: Usuario elige empresa MOVI, sistema debe ofrecer ingresar 16 digitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullMOVI
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto Son 16 dígitos

###  Usuario elige empresa SAETA, sistema debe ofrecer ingresar de 7 a 8 digitos.
  Scenario: Usuario elige empresa SAETA, sistema debe ofrecer ingresar de 7 a 8 digitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSAETA
#    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto De 7 a 8 dígitos

###  Usuario elige empresa REDBUS, sistema debe ofrecer ingresar de 7 a 8 digitos.
  Scenario: Usuario elige empresa REDBUS Cordoba, sistema debe ofrecer ingresar de 7 a 8 digitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullREDBUS Cordoba
#    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto De 7 a 8 dígitos
 
  Scenario: Usuario elige empresa nullREDBUS Mendoza, sistema debe ofrecer ingresar de 7 a 8 digitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullREDBUS Mendoza
#    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto De 7 a 8 dígitos

  Scenario: Usuario elige empresa nullREDBUS Tucuman, sistema debe ofrecer ingresar de 7 a 8 digitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullREDBUS Tucuman
#    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto De 7 a 8 dígitos

###  Usuario elige empresa DirectTV, sistema debe ofrecer ingresar 16 digitos que comiencen con 057.
  Scenario: Usuario elige empresa DirectTV, sistema debe ofrecer ingresar 16 digitos que comiencen con 057.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Celular
    And   usuario selecciona nullClaro
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto Con el código de área y sin el 15

###  Usuario elige cualquier empresa telefónica, sistema debe ofrecer ingresar (no menos ni mas) de 10 dígitos.
  Scenario: Usuario elige cualquier empresa telefónica, sistema debe ofrecer ingresar (no menos ni mas) de 10 dígitos.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Celular
    And   usuario selecciona nullClaro
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el codigo de pago"]/android.view.ViewGroup[3]/android.widget.TextView con texto Con el código de área y sin el 15


###  Usuario elige empresa SAETA, sistema debe ofrecer cargar cualquier monto desde 50 hasta 500.
  Scenario: Usuario elige empresa SAETA, sistema debe ofrecer cargar cualquier monto desde 50 hasta 500.
    When  usuario accede a pagos
    And   usuario selecciona Seccion de recargas
    And   usuario selecciona Empresas de Transporte
    And   usuario selecciona nullSAETA
    And   usuario selecciona Ingresa el codigo de pago
    And   usuario ingresa el valor 1234567
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario esconde teclado
    Then  sistema muestra xpath //android.view.ViewGroup[@content-desc="Ingresa el monto a pagar"]/android.widget.TextView con texto Entre $50 y $500

