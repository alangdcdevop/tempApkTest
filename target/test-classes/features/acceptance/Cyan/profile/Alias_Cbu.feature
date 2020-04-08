@Red

Feature: Cambiar Alias

  Background:
    Given existe el usuario con passcode 663755
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe+int1@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe+int1@gmail.com y password Bdsol123
    And ingresa el passcode 663755
    And el usuario acepta terminos y condiciones


  @Issue:BDSD-3407:HappyPath
  Scenario: Modificar alias correctamente
    Given el usuario selecciona Ver Mis datos
    When presiona el boton Cambiar Alias
    And completa el campo TOLDO.PARDO.AMIGO.04
    And hace click en Continuar
    Then el usuario visualiza su nuevo alias TOLDO.PARDO.AMIGO.04

  @Issue:BDSD-3407
  Scenario: Modificar alias por otro usuario activo
    Given el usuario selecciona Ver Mis datos
    When presiona el boton Cambiar Alias
    And completa el campo ASD.BNNM.QWE
    And hace click en Continuar
    Then el usuario visualiza su nuevo alias ASD.BNNM.QWE
    
    @Issue:BDSD-3407
  Scenario: Hint error al editar mas de 1 vez el alias en 24 hs

    @Issue:BDSD-3407
  Scenario: Hint error al editar mas de 12 veces durante 1 año


