@Payment_Regretion_HappyPath
@BDSD-3297
Feature:BDSD-3297 Pago VEP

  Como usuario
  Quiero poder pagar o agendar un VEP desde la app de BDS
  Para no tener que entrar a la web.

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
#  Background: Reiniciar Datos
#    Given Reset wiremock
#    And   existe el usuario con passcode 192837
#    And   el usuario ingresa a la pantalla de login
#    And   el usuario acepta los requisitos de identificacion
#    And   el usuario ingresa el correo bdsolqe@gmail.com
#    And   el usuario confirma el correo
#    And   accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
#    Then  ingresa el passcode 192837

#  Happy Path:
#  Usuario realiza flujo de primer pago para un VEP y confirma pago.

  @BDSD-3297_HappyPath
  Scenario: Usuario realiza flujo de primer pago para un VEP y confirma pago.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor VEP
    And   usuario selecciona Ir a rubros de VEP
    And   usuario ingresa el valor 12345678901
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 12345678902
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar

#  Validaciones de errores y alertas
#  Usuario ingresa CUIT erroneos, sistema muestra pantalla de error.

  Scenario: Usuario realiza flujo de primer pago para un VEP e ingresa CUIT Generador erroneo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor VEP
    And   usuario selecciona Ir a rubros de VEP
    And   usuario ingresa el valor 12345678901
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 99999999999
    And   usuario selecciona Continuar


  Scenario: Usuario realiza flujo de primer pago para un VEP e ingresa CUIT Beneficiario erroneo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor VEP
    And   usuario selecciona Ir a rubros de VEP
    And   usuario ingresa el valor 99999999999
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 12345678902
    And   usuario selecciona Continuar


