# language: en
@FingerPrintLogin @Cyan

Feature: Fingerprint Login

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    And el usuario decide ingresar por huella dactilar
    And se visualiza la home

  @Manual @Issue:BDSD-2376
  Scenario: Login con huella dactilar valida
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella dactilar
    Then se visualiza la home

  @Manual @Issue:BDSD-2376
  Scenario: Login sin huella dactilar registrada
    Given el usuario se desloguea
    And el usuario elimino su huella dactilar
    When el usuario ingresa a la pantalla de login
    Then debe ingresar password

  @Manual @Issue:BDSD-2376
  Scenario: Falla validacion de huella en login
    Given el step es manual
    And el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    Then el modal vibra

  @Manual @Issue:BDSD-2376
  Scenario: Deshabilitar ingreso por huella dactilar
    Given se visualiza la home
    When se navega al perfil
    And se navega a configuracion
    And el usuario deshabilita huella dactilar
    And el usuario se desloguea
    Then debe ingresar password

  @manual @Issue:BDSD-2376
  Scenario: Login luego de deshabilitar identificacion por huella dactilar
    Given se visualiza la home
    When se navega al perfil
    And se navega a configuracion
    And el usuario deshabilita huella dactilar
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    Then se visualiza la home

  @Manual @Issue:BDSD-2711
  Scenario: Boton de Huella dactilar bloqueada luego introducirla incorrectamente 3 veces
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    Then el boton de huella no esta disponible

  @Manual @Issue:BDSD-2711
  Scenario: Notificacion de huella dactilar bloqueada luego de introducirla incorrectamente 3 veces
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    Then se visualiza notificacion de error ???

  @Manual @Issue:BDSD-2711
  Scenario: Volver a habilitar ingreso por huella dactilar luego de bloqueo
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And ingresa el passcode 192837
    And se navega al perfil
    And se navega a configuracion
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    Then se solicita huella dactilar

  @Manual @Issue:BDSD-2711
  Scenario: Boton de huella no disponible luego de bloquearla y loguearse de nuevo
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And ingresa el passcode 192837
    And se navega al perfil
    And se navega a configuracion
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario rechaza
    Then el boton de huella no esta disponible

  @Manual @Issue:BDSD-2720
  Scenario: Opcion de huella dactilar deshabilitada en configuracion luego de bloqueo
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    And ingresa el passcode 192837
    And se navega al perfil
    And se navega a configuracion
    Then el ingreso por huella dactilar esta deshabilitado

  @manual @Issue:BDSD-2720
  Scenario: Opcion de huella dactilar habilitada en configuracion luego de aceptar la biometria como metodo de login
    When se navega al perfil
    And se navega a configuracion
    Then el ingreso por huella dactilar esta habilitado

  @manual @Issue:BDSD-2720
  Scenario: Deshabilitar biometria desde configuracion
    When se navega al perfil
    And se navega a configuracion
    And se deshabilita la biometria
    And se confirma el cambio
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    Then se visualiza la home

  @manual @Issue:BDSD-2720
  Scenario: Habilitar biometria desde configuracion
    When se navega al perfil
    And se navega a configuracion
    And se deshabilita la biometria
    And se confirma el cambio
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    And ingresa el passcode 192837
    And se navega al perfil
    And se navega a configuracion
    And se habilita la biometria
    And se confirma el cambio
    And el usuario se desloguea
    And el usuario ingresa a la pantalla de login
    Then el boton de huella esta disponible

  @manual @Issue:BDSD-2720
  Scenario: Cancelar deshabilitacion de biometria
    When se navega al perfil
    And se navega a configuracion
    And se deshabilita la biometria
    And se cancela el cambio
    Then el switch de biometria esta habilitado

  @manual @Issue:BDSD-2720
  Scenario: Cancelar habilitacion de biometria
    When se navega al perfil
    And se navega a configuracion
    And se deshabilita la biometria
    And se confirma el cambio
    And se habilita la biometria
    And se cancela el cambio
    Then el switch de biometria esta deshabilitado

  @manual @Issue:BDSD-2720
  Scenario: Volver a Configuracion desde Configuracion de Biometria
    When se navega al perfil
    And se navega a configuracion
    And se presiona boton Atras
    Then se visualiza Configuracion

  @manual @Issue:BDSD-2712
  Scenario: Visualizar modal de advertencia de bloqueo de login con biometria
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And se solicita huella dactilar
    And el usuario ingresa su huella erroneamente
    And el usuario ingresa su huella erroneamente
    Then se visualiza modal de advertencia de bloqueo de biometria

  @manual @Issue:BDSD-2712
  Scenario: Visualizar opcion de biometria ante ingresos de clave erroneos
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And ingresa el passcode 123456
    And ingresa el passcode 155432
    Then se visualiza modal de opcion de ingreso con biometria

  @manual @Issue:BDSD-2712
  Scenario: Bloqueo de clave luego de rechazar opcion de biometria
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And ingresa el passcode 123456
    And ingresa el passcode 155432
    And rechaza ingreso de biometria
    And ingresa el passcode 155432
    Then se bloquea la cuenta

  @manual @Issue:BDSD-2712
  Scenario: Bloqueo de clave luego de rechazar opcion de biometria
    Given el usuario se desloguea
    When el usuario ingresa a la pantalla de login
    And ingresa el passcode 123456
    And ingresa el passcode 155432
    And el usuario ingresa su huella erroneamente
    And ingresa el passcode 155432
    Then se bloquea la cuenta



