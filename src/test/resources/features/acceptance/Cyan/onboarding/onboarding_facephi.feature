# language: en

@LoginOnboardingFacePhi @Cyan
Feature: Onboarding with FacePhi

  Background:
    Given el dispositivo no se encuentra vinculado
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo

  @Issue:BDSD-638
  Scenario: camara frontal se activa automaticamente para obtener prueba de vida
    When el usuario confirma el MagicLink con correo "bdsolqe@gmail.com"
    Then se visualizan requisitos de identificacion

  @Issue:BDSD-638 @Manual
  Scenario: camara frontal se activa automaticamente para obtener prueba de vida
    Given el step es manual
    When el usuario confirma el MagicLink con correo "bdsolqe@gmail.com"
    Then la camara frontal se activa automaticamente

  @Issue:BDSD-638 @Manual
  Scenario: captura automatica de selfie para obtener prueba de vida
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la camara frontal se activa automaticamente
    And el usuario coloca su cara dentro del recuadro
    Then la selfie se toma automaticamente


  @Issue:BDSD-517 @manual
  Scenario: La aplicacion solicita confirmacion de captura de DNI
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And se visualizan requisitos de captura de dni
    And el usuario saca foto de frente de dni
    Then la aplicacion solicita confirmacion de la captura del dni

  @Issue:BDSD-517 @Manual
  Scenario: Sacar una nueva foto del frente del DNi
    Given el step es manual
    When el usuario saca foto de frente de dni
    And el usuario opta por sacar otra foto del frente
    Then la camara trasera se activa automaticamente

  @Issue:BDSD-517 @Manual
  Scenario: Sacar una nueva foto del dorso del DNi
    Given el step es manual
    When el usuario saca foto de dorso de dni
    And el usuario opta por sacar otra foto del dorso
    Then la camara trasera se activa automaticamente

  @Issue:BDSD-517 @Issue:BDSD-1183 @Manual
  Scenario: obtener informacion de DNi con FacePhi
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    Then el usuario visualiza informacion extraida del DNI

  @Issue:BDSD-530 @Manual
  Scenario: intentar continuar con MagicLink caduco
    When el usuario confirma magiclink con mail email@gmail.com luego de 15 minutos
    Then el usuario debe ingresar nuevamente un mail

  @Issue:BDSD-517 @Issue:BDSD-1183 @Manual
  Scenario: obtener informacion de DNi con FacePhi
    Given el step es manual
    When el usuario confirma el MagicLink con correo email@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario visualiza informacion extraida del DNI
    And el usuario confirma informacion extraida del DNI
    Then el usuario puede continuar con el proceso

  @Issue:BDSD-1183 @Manual
  Scenario: Rechazar datos incorrectos capturados del DNI
    Given el step es manual
    When el usuario confirma el MagicLink con correo email@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario visualiza informacion extraida del DNI
    And el usuario elige volver a escanear
    Then el usuario comienza nuevamente el proceso de captura
    And el usuario finaliza el onboarding
    Then el usuario visualiza informacion extraida del DNI en Perfil

  @Issue:BDSD-1183 @Manual
  Scenario: Volver a captura de dorso de DNI desde Confirmacion de Datos extraidos
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario intenta volver atras
    Then se le solicita realizar prueba de vida

  @Issue:BDSD-1340 @Manual
  Scenario: Se persiste el score de coincidencia
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario confirma los datos extraidos del DNI
    Then se persiste el score de coincidencia

  @Issue:BDSD-519 @Manual
  Scenario: Validacion de identidad con coincidencia menor al minimo establecido
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario confirma los datos extraidos del DNI
    And el score de coincidencia es menor al minimo establecido
    Then la solicitud queda pendiente de revision

  @Issue:BDSD-1185 @Manual
  Scenario: Volver desde la pantalla de DDJJ
    Given el step es manual
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario confirma los datos extraidos del DNI
    And el usuario visualiza pantalla de DDJJ
    And el usuario intenta volver atras
    Then el usuario visualiza informacion extraida del DNI

  @Issue:BDSD-517 @Manual
  Scenario: intentar capturar DNI con condiciones de luz pobres
    Given el step es manual
    And las condiciones de luz no permiten una captura nitida
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario coloca el DNI dentro del recuadro
    Then se visualiza error de captura de DNI

  @Issue:BDSD-517 @Manual
  Scenario: intentar capturar DNI con fondo de captura complejo
    Given el step es manual
    And el fondo de captura es complejo
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario coloca el DNI dentro del recuadro
    Then se visualiza error de captura de DNI

  @Issue:BDSD-517 @Manual
  Scenario: intentar capturar DNI extranjero
    Given el step es manual
    And el DNI a capturar es extranjero
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario coloca el DNI emitido en el extranjero dentro del recuadro
    Then se visualiza error de captura de DNI

  @Issue:BDSD-638 @Manual
  Scenario: intentar obtener prueba de vida con condiciones de luz pobres
    Given el step es manual
    And las condiciones de luz no permiten una captura nitida
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario coloca su cara dentro del recuadro
    Then se visualiza error de captura de prueba de vida

  @Issue:BDSD-519 @Manual
  Scenario: Registro exitoso con ReNaPeR no disponible y coincidencia menor al minimo establecido
    Given el step es manual
    And el servicio de validacion de ReNaPeR no se encuentra disponible
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario confirma los datos extraidos del DNI
    And el score de coincidencia es menor al minimo establecido
    Then el usuario se registra correctamente

  @Issue:BDSD-519 @Manual
  Scenario: Registro exitoso contra ReNaPeR con datos no coincidentes con DNI
    Given el step es manual
    And el servicio de validacion de ReNaPeR no se encuentra disponible
    When el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And la selfie se toma automaticamente
    And el usuario saca foto de frente de dni
    And el usuario confirma la foto del frente del DNI
    And el usuario saca foto de dorso de dni
    And el usuario confirma la foto del dorso del DNI
    And el usuario confirma los datos extraidos del DNI
    And el numero de DNI no coincide con los datos ingresados
    And el score de coincidencia es menor al minimo establecido
    Then el usuario se registra correctamente

  @Issue:BDSD-971 @Manual
  Scenario: Captura de prueba de vida
    Given el step es manual
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    Then se obtiene prueba de vida


  @Issue:BDSD-971 @Manual
  Scenario: Sacar foto del frente del DNI
    Given el step es manual
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario saca la foto del frente del DNI
    Then se visualiza la foto del frente del DNI

  @Issue:BDSD-971 @Manual
  Scenario: Sacar foto del dorso del DNI
    Given el step es manual
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario confirma el MagicLink con correo bdsolqe@gmail.com
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario saca la foto del frente del DNI
    And el usuario confirma la foto del frente del DNI
    And el usuario saca la foto del dorso del DNI
    Then se visualiza la foto del dorso del DNI

  @Issue:BDSD-971 @Manual
  Scenario: Completar los datos y terminar el proceso
    Given el step es manual
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario acepta los requisitos de identificacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario saca la foto del frente del DNI
    And el usuario confirma la foto del frente del DNI
    And el usuario saca la foto del dorso del DNI
    And el usuario confirma la foto del dorso del DNI
    And el usuario indica que es persona politicalmente expuesta
    And el usuario indica que es sujeto obligado
    And el usuario indica que se aplica FATCA
    And el usuario confirma los regimenes que aplican
    And el usuario confirma que es el sujeto obligado
    And el usuario indica que su cargo es Senador
    And el usuario confirma su cargo
    And el usuario indica que su empleo es Soy escribano publico
    And el usuario confirma su empleo
    And el usuario acepta los terminos y condiciones
    Then se visualiza la confirmacion del proceso finalizado


  @manual
  Scenario: Intentar onboardearse con un DNI de un usuario de tipo prospecto
    Given existe un usuario de tipo LEAD con un DNI valido
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And el usuario acepta los requisitos de identifºicacion
    And el usuario saca una selfie
    And el usuario confirma la selfie
    And el usuario acepta los requisitos de video
    And el usuario confirma el video
    And el usuario confirma los requisitos de la foto de DNI
    And el usuario saca la foto del frente del DNI
    And el usuario confirma la foto del frente del DNI
    And el usuario saca la foto del dorso del DNI
    And el usuario confirma la foto del dorso del DNI
    And el usuario finaliza la aplicacion
    And el usuario vuelve a comenzar el proceso con el mismo DNI
    Then el usuario puede finalizar el proceso de onboarding correctamente


