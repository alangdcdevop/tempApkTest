Feature: Sitio Web - Productos (Desktop)

  Como prospect
  Quiero ingresar a la sección de Productos en el sitio web de Banco del Sol desde mi computadora
  Para conocer más acerca de los productos que ofrece el banco y sus características

  @Regresion @Issue:BDSD-2655 @Automation
  Scenario: El usuario ingresa a la sección de Productos y visualiza la información de los productos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Issue:BDSD-2655 @Automation
  Scenario: El usuario hace clic en el logo de Banco del Sol  y es redireccionado a la home.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    And el usuario presiona productos
    When el usuario hace click en el logo de banco del sol
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/

  @Regresion @Issue:BDSD-2655 @Automation
  Scenario: El usuario hace clic en “Quienes somos” y es redireccionado a la sección de quienes somos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    And el usuario presiona productos
    And el usuario tapea el menu
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Issue:BDSD-2655 @Automation
  Scenario: El usuario hace clic en “Contacto” y es redireccionado a la sección de contacto.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    And el usuario presiona productos
    And el usuario tapea el menu
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/


