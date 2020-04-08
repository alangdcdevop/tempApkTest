# language: en
@MultipleLinking @Cyan

Feature: Vinculacion Multiple (Segundo Dispositivo)

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com


  @Issue:BDSD-2182
  Scenario: Vincular segundo dispositivo
    Given el dispositivo no se encuentra vinculado
    When el usuario ya posee 1 dispositivos vinculados
    And ingresa el passcode 192837
    And el usuario acepta terminos y condiciones
    Then se visualiza la home