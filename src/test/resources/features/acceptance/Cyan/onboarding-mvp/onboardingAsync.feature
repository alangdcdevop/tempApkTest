# language: en

@OnboardingAsync @Cyan
Feature: Onboarding with FacePhi

  Background:
    Given el dispositivo no se encuentra vinculado
    When el usuario intenta registrarse
    And el usuario comienza el proceso
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo


@manual @NewHappyPath
Scenario: Onboarding Happy Path - MVP
When el usuario intenta registrarse
And el usuario acepta los requisitos de identificacion
And el usuario ingresa el correo bdsolqe@gmail.com
And accedo por magic link con mail bdsolqe@gmail.com
And el usuario acepta los requisitos de prueba de vida
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente del DNI
And el usuario confirma la foto del frente del DNI
And el usuario saca la foto del dorso del DNI
And el usuario confirma la foto del dorso del DNI
    # PRIMER LOADING
And el usuario completa DDJJ sin aplicar cambios
    # SEGUNDO LOADING
And el usuario acepta terminos y condiciones
    # TERCER LOADING
And el usuario crea su clave
And el usuario confirma su contraseña
    # CUARTO LOADING (PH + ORQUESTADOR)
And se visualiza mensaje de usuario registrado con exito
And el usuario debe ingresar su contraseña
Then se visualiza la home

@manual @NoUIF
Scenario: Onboarding - Sujeto Obligado en DDJJ no matchea con UIF
Given el usuario es Sujeto Obligado en UIF
When el usuario intenta registrarse
And el usuario comienza el proceso
And el usuario ingresa el correo bdsolqe@gmail.com
And el usuario confirma el correo
And el usuario acepta los requisitos de identificacion
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente del DNI
And el usuario confirma la foto del frente del DNI
And el usuario saca la foto del dorso del DNI
And el usuario confirma la foto del dorso del DNI
    # PRIMER LOADING
And el usuario completa DDJJ indicando que no es Sujeto Obligado
    # SEGUNDO LOADING
And el usuario acepta terminos y condiciones
And el usuario crea su clave
And el usuario confirma su contraseña
    # TERCER LOADING (PH + ORQUESTADOR)
And se visualiza mensaje de usuario registrado con exito
And el usuario debe ingresar su contraseña
Then se visualiza mensaje de error de DDJJ y recibe mail indicando que debe comunicarse
    # EN REFINAMIENTO

@manual @DelayOrquestador @UnhappiestPath
Scenario: Onboarding - Orquestador demora en popular datos
When el usuario intenta registrarse
And el usuario comienza el proceso
And el usuario ingresa el correo bdsolqe@gmail.com
And el usuario confirma el correo
And el usuario acepta los requisitos de identificacion
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente del DNI
And el usuario confirma la foto del frente del DNI
And el usuario saca la foto del dorso del DNI
And el usuario confirma la foto del dorso del DNI
    # PRIMER LOADING
And el usuario completa DDJJ vacia
    # SEGUNDO LOADING
And el usuario acepta terminos y condiciones
And el usuario crea su clave
And el usuario confirma su contraseña
    # TERCER LOADING (PH + ORQUESTADOR)
And se visualiza mensaje de usuario registrado con exito
And el usuario debe ingresar su contraseña
Then se visualiza mensaje de completar datos con pantallas subsiguientes
    # EN REFINAMIENTO


@manual @BlackList
Scenario: Onboarding - Usuario en lista negra
Given el usuario se encuentra en lista negra
When el usuario intenta registrarse
And el usuario comienza el proceso
And el usuario ingresa el correo bdsolqe@gmail.com
And el usuario confirma el correo
And el usuario acepta los requisitos de identificacion
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente del DNI
And el usuario confirma la foto del frente del DNI
And el usuario saca la foto del dorso del DNI
And el usuario confirma la foto del dorso del DNI
    # PRIMER LOADING
And el usuario completa DDJJ vacia
    # SEGUNDO LOADING
And el usuario acepta terminos y condiciones
And el usuario crea su clave
And el usuario confirma su contraseña
    # TERCER LOADING (PH + ORQUESTADOR)
And se visualiza mensaje de usuario registrado con exito
And el usuario debe ingresar su contraseña
Then se visualiza mensaje de "Aun seguimos procesando tus datos" con opcion de ayuda
    # EN REFINAMIENTO

@manual @WhiteList
Scenario: Onboarding - Usuario no se encuentra en whitelist
Given el usuario no se encuentra en lista blanca
When el usuario intenta registrarse
And el usuario comienza el proceso
And el usuario ingresa el correo bdsolqe@gmail.com
And el usuario confirma el correo
And el usuario acepta los requisitos de identificacion
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente del DNI
And el usuario confirma la foto del frente del DNI
And el usuario saca la foto del dorso del DNI
And el usuario confirma la foto del dorso del DNI
    # PRIMER LOADING
And el usuario completa DDJJ vacia
    # SEGUNDO LOADING
And el usuario acepta terminos y condiciones
And el usuario crea su clave
And el usuario confirma su contraseña
    # TERCER LOADING (PH + ORQUESTADOR)
And se visualiza mensaje de usuario registrado con exito
And el usuario debe ingresar su contraseña
Then se visualiza mensaje de "Aun seguimos procesando tus datos" con opcion de ayuda
    # EN REFINAMIENTO

@manual @FacephiFailedMatch
Scenario: Onboarding - Limite de intentos de biometria FacePhi por fallo en matcheo
Given el usuario se encuentra en lista blanca
When el usuario intenta registrarse
And el usuario comienza el proceso
And el usuario ingresa el correo bdsolqe@gmail.com
And el usuario confirma el correo
And el usuario acepta los requisitos de identificacion
And el usuario saca una selfie
And el usuario confirma los requisitos de la foto de DNI
And el usuario saca la foto del frente de un DNI que no le pertenece
Then visualiza error de validacion de Facephi

