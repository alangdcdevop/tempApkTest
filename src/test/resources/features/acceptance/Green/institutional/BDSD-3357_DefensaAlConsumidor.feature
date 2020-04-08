Feature: Sitio Web - Defensa al consumidor (Desktop)

  Como usuario
  Quiero ingresar a la sección de defensa del consumidor

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario ingresa al link de “Defensa al Consumidor” y visualiza toda la información de la sección.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en defensa del consumidor
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/defensa-consumidor/

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario ingresa al link de “Defensa al Consumidor”, presiona en click aca y redirecciona a la pagina https://www.argentina.gob.ar/defensadelconsumidor
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en defensa del consumidor
    And el usuario presiona en click aca
    Then el usuario visualiza la pantalla https://www.argentina.gob.ar/defensadelconsumidor

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario hace clic en el logo de Banco del Sol  y es redireccionado a la home.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en defensa del consumidor
    When el usuario hace click en el logo de banco del sol
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario hace clic en “Quienes somos” y es redireccionado a la sección de quienes somos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en defensa del consumidor
    And el usuario tapea el menu
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario hace clic en “Productos” y es redireccionado a la sección de productos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en defensa del consumidor
    And el usuario tapea el menu
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Issue:BDSD-3357 @Automation
  Scenario: El usuario hace clic en “Contacto” y es redireccionado a la sección de contacto.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en defensa del consumidor
    And el usuario tapea el menu
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/

