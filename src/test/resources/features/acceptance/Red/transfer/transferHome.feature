#lenguage:en
@Issue:BDSD-2938
Feature: Validar Home transferencias

  Como usuario quiero tener una home de transferencias donde acceder a mi agenda y acciones como transferir o agendar
  nuevos contactos

  @Issue:BDSD-2938 @transferHomeEmptyState
  Scenario: El usuario ingresa en la home de transferencias emptystate
    Given existe el usuario con passcode 663755
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo gabriel.nicora+test4@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail gabriel.nicora@gmail.com y password carolinatomas6
    And ingresa el passcode 663755
#    And el usuario acepta terminos y condiciones
    And el usuario accede a transferencias
    Then visualiza la home de transferencias empty state


  @Issue:BDSD-2938 @VerAgenda
  Scenario: El usuario ingresa en la home de transferencias y luego a su agenda de contactos
    Given existe el usuario con passcode 663755
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo gabriel.nicora+test4@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail gabriel.nicora@gmail.com y password carolinatomas6
    And ingresa el passcode 663755
#    And el usuario acepta terminos y condiciones
    And el usuario accede a transferencias
    And visualiza la home de transferencias empty state
    And el usuario accede a pantalla de contactos
    Then el usuario visualiza su agenda

  @Issue:BDSD-2938 @AccedeATransferencias
  Scenario: El usuario ingresa en la home de transferencias y presiona el boton transferir
    Given existe el usuario con passcode 663755
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo gabriel.nicora+test4@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail gabriel.nicora@gmail.com y password carolinatomas6
    And ingresa el passcode 663755
#    And el usuario acepta terminos y condiciones
    And el usuario accede a transferencias
    And el usuario presiona boton de transferencia nueva
    Then el usuario accede a transfer View.
    
  @Issue:BDSD-2883
  Scenario: Ingresar en Home de transferencias con favorito guardado y sin transacciones

  @Issue:BDSD-2883
  Scenario: Ingresar en Home de transferencias sin favoritos con transacciones

  @Issue:BDSD-2883
  Scenario: Ingresar en Home de transferencias con favoritos y con transacciones
  
  @Issue:BDSD-2883
  Scenario: Validar ordenamiento alfabetico de lista de contactos favoritos