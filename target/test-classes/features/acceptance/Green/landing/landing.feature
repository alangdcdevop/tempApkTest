# language: en
Feature: Landing page teaser front

  Como prospect del sitio,
  Quiero acceder desde mi computadora, celular o tablet a un sitio web,
  Para conocer más sobre el banco, los productos, los canales y las ventajas de abrir una cuenta en Banco del Sol.

  @Regresion @Automation
  Scenario: Usuario hace click en Ayuda y accede a la pantalla de ayuda.
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/lanzamiento/
    When el usuario hace click en Ayuda
    Then el usuario visualiza la pantalla de ayuda

  @Regresion @Automation
  Scenario: Usuario hace click en quienes somos y visualiza una breve historia acerca del Banco del Sol
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/lanzamiento/
    When el usuario hace click en quienes somos
    Then el usuario visualiza una breve historia acerca del banco del sol

  @Regresion @Automation
  Scenario: Usuario hace click en numero de whatsapp y se abre un chat del banco del sol en whatsappweb
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/lanzamiento/
    When el usuario hace click en el numero de whatsapp
    Then el usuario visualiza un chat del banco del sol en whatsappweb

  @Regresion @Automation
  Scenario: Usuario hace click en numero de whatsapp y se abre un chat del banco del sol en whatsappweb
    Given el usuario navega a https://web-dev.bdsdigital.com.ar/lanzamiento/
    When el usuario hace click en el numero de whatsapp
    Then el usuario visualiza un chat del banco del sol en whatsappweb

  @Regresion @Automation
  Scenario: Usuario visualiza 3 bloques de preguntas, sobre la descarga, como abrir una cuenta y sobre la cuenta
    When el usuario navega a https://web-dev.bdsdigital.com.ar/lanzamiento/
    Then el usuario debe visualizar el bloque de "sobre la descarga"
    And el usuario debe visualizar el bloque de "como abrir una cuenta"
    And el usuario debe visualizar el bloque de "sobre la cuenta"

  @Regresion @Automation
  Scenario: Usuario hace click en una pregunta y visuliza la respuesta
    Given un usuario accede a la seccion de ayuda
    When el usuario hace click en una pregunta
    Then el usuario debe visualizar la respuesta

  @Regresion @Automation
  Scenario: Usuario hace click en una pregunta, visuliza la respuesta, vuelve a clickear la pregunta y se oculta la respuesta
    Given un usuario accede a la seccion de ayuda
    And el usuario hace click en una pregunta
    When el usuario debe visualizar la respuesta
    And el usuario clickea la misma pregunta
    Then el usuario deja de visualizar la respuesta

  @Regresion @Automation
  Scenario: Usuario hace click en el logo de banco del sol y es redireccionado a la home
    Given un usuario accede a la seccion de ayuda
    When el usuario clickea el logo de banco del sol
    Then el usuario debe visualizar la home de banco del sol

  @Regresion @Automation
  Scenario: Usuario hace click en quienes somos y es redireccionado a quienes somos
    Given un usuario accede a la seccion de ayuda
    When el usuario hace click en quienes somos
    Then el usuario debe visualizar la seccion de quienes somos

  @Regresion @Automation
  Scenario: Usuario hace click en el numero de whatsapp y es redireccionado a whatsapp web
    Given un usuario accede a la seccion de ayuda
    When el usuario hace click en el numero de whatsapp
    Then el usuario visualiza un chat del banco del sol en whatsappweb
