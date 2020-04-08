@Payment_Regretion_HappyPath
@BDSD-3951
Feature: BDSD-3951 Pago Monotributista

  Como usuario,
  Quiero poder realizar o agendar un pago de monotributo a traves de la app de BDS
  Para no tener que entrar a la web

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   
#  Background: Login
#    Given existe el usuario con passcode 192837
#    And   el usuario ingresa a la pantalla de login
#    And   el usuario acepta los requisitos de identificacion
#    And   el usuario ingresa el correo bdsolqe@gmail.com
#    And   el usuario confirma el correo
#    And   accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
#    Then  ingresa el passcode 192837

#  Happy Path:

  @BDSD-3951_HappyPath
  Scenario: Usuario realiza flujo de pago para un pago de monotributo.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Monotr. Aut. Activo
    And   usuario selecciona Ir a rubros de Monotr. Aut. Activo
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20335574430
    And   usuario selecciona Continuar
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 122012
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 999
    And   usuario selecciona Continuar
    And   usuario selecciona Pagar
    Then  sistema indica Finalizar


#  Validaciones de errores y alertas

  Scenario: Usuario intenta realizar flujo de pago para un pago de monotributo con CUIT Inexistente.
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Monotr. Aut. Activo
    And   usuario selecciona Ir a rubros de Monotr. Aut. Activo
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20335574999
    And   usuario selecciona Continuar
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 122012
    And   usuario selecciona Continuar
    Then  sistema muestra elemento mensaje de error con texto El código ingresado no es válido


  Scenario: Usuario intenta realizar flujo de pago para un pago de monotributo con Mes/Año erroneo
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Monotr. Aut. Activo
    And   usuario selecciona Ir a rubros de Monotr. Aut. Activo
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20335574430
    And   usuario selecciona Continuar
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 122011
    And   usuario selecciona Continuar
    Then  sistema muestra elemento mensaje de error con texto El código ingresado no es válido


