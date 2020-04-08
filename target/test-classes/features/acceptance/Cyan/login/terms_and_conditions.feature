# language: en
@TermsAndConditions @Cyan

Feature: Terms and Conditions - App

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com


  @Issue:BDSD-2936
  Scenario: Solicitud de Aceptacion de Terminos y Condiciones unica por cada version
    Given el usuario no acepto terminos y condiciones
    When ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    And se visualiza la home
    And el usuario se desloguea
    And ingresa el passcode 192837
    Then se visualiza la home

  @Issue:BDSD-2936
  Scenario: Solicitud de Aceptacion de Terminos y Condiciones ante actualizacion
    Given el usuario no acepto terminos y condiciones
    When ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    And se visualiza la home
    And se agrega una nueva version de terminos y condiciones
    And el usuario se desloguea
    And ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    Then se visualiza la home