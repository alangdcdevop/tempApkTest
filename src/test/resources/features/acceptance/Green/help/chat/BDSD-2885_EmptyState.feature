Feature: Empty state chat (Botmaker off)

  Como usuario
  Quiero que me notifiquen si el chat de la app está caído.

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837
    And se visualiza la home

  @Regresion @Manual @Issue:BDSD-2885
  Scenario: El cliente entra al chat cuando Botmaker no esta funcionado y visualiza la pantalla de empty state.
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat cuando botmaker no esta funcionando
    Then el usuario visualiza la pantalla de empty state

  @Regresion @Automation @Issue:BDSD-2885
  Scenario: El cliente entre al chat cuando Botmaker esta funcionando, y visualiza la pantalla de chat
    Given el usuario ingresa a la pantalla ayuda
    When el usuario tapea el chat
    Then el usuario visualiza la pantalla del chat