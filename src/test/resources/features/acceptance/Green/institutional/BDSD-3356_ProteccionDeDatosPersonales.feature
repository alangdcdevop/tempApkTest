Feature: Sitio Web - Cierre de cuentas (Desktop)

  Como prospect
  Quiero ingresar a la sección de Protección de datos personales.

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario ingresa al link de “Protección de datos personales” y visualiza toda la información de la sección.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en proteccion de datos personales
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/proteccion-datos-personales/

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario hace clic en el logo de Banco del Sol  y es redireccionado a la home.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en proteccion de datos personales
    When el usuario hace click en el logo de banco del sol
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario hace clic en “Quienes somos” y es redireccionado a la sección de quienes somos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en proteccion de datos personales
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario hace clic en “Productos” y es redireccionado a la sección de productos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en proteccion de datos personales
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario hace clic en “Contacto” y es redireccionado a la sección de contacto.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario hace click en proteccion de datos personales
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/

  @Regresion @Issue:BDSD-3356 @Automation
  Scenario: El usuario hace clic en “Dirección Nacional de Protección de Datos Personales” y visualiza la pagina correspondiente
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en proteccion de datos personales
    And el usuario hace click en direccion nacional de proteccion de datos personales
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/proteccion-datos-personales/


