# language: en
Feature: Landing page teaser front

  Yo como administrador del sitio
  Quiero presentar una serie de preguntas en la teaser del sitio
  Para tener informacion de quienes quieran ingresar antes que el sitio este disponible

  @Regresion @Automation
  Scenario: el usuario hace click en "Quiero participar", responde preguntas, envia correo electronico y visualiza cartel de agradecimiento
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When el usuario completa la primera pregunta
    And completa la segunda pregunta
    And completa la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de agradecimiento

  @Regresion @Automation
  Scenario: el usuario hace click en "Quiero participar", responde preguntas, envia correo electronico y visualiza cartel de agradecimiento
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When usuario omite la primera pregunta
    And completa la segunda pregunta
    And completa la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de agradecimiento

  @Regresion @Automation
  Scenario: el usuario hace click en "Quiero participar", responde preguntas, envia correo electronico y visualiza cartel de agradecimiento
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When usuario omite la primera pregunta
    And omite la segunda pregunta
    And completa la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de agradecimiento

  @Regresion @Automation
  Scenario: el usuario hace click en "Quiero participar", responde preguntas, envia correo electronico y visualiza cartel de agradecimiento
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When usuario omite la primera pregunta
    And omite la segunda pregunta
    And omite la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de agradecimiento

  @Regresion @Automation
  Scenario: el usuario hace click en "Quiero participar", responde preguntas, envia correo electronico y visualiza cartel de agradecimiento
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When el usuario completa la primera pregunta
    And omite la segunda pregunta
    And omite la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de agradecimiento

  @Regresion @Manual
  Scenario: el usuario complete las preguntas y envíe su correo electronico con el campo vacío
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When el usuario completa la primera pregunta
    And completa la segunda pregunta
    And completa la tercera pregunta
    And completa su correo electronico bdsolqe@gmail.com
    And envia su correo electronico
    Then el usuario visualiza un cartel de que no ingreso correo valido

  @Regresion @Manual
  Scenario: el usuario complete las preguntas y envíe su correo electronico en formato incorrecto
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/teaser/
    And hace click en "Quiero participar"
    When el usuario completa la primera pregunta
    And omite la segunda pregunta
    And omite la tercera pregunta
    And envia su correo electronico
    Then el usuario visualiza un cartel de que no ingreso correo valido

