Feature: Sitio Web - ¿Quiénes somos? (Responsive)

  Como usuario
  Quiero ingresar a la sección de Quiénes somos en el sitio web de Banco del Sol desde dispositivo móvil
  Para conocer más acerca del banco y su historia

  @Regresion @Automation @Issue:BDSD-3099
  Scenario: El usuario tapea el menú, tapea “quienes somos”, luego tapea el logo de Banco del sol y es redireccionado a la home del sitio web.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Automation @Issue:BDSD-3099
  Scenario: El usuario tapea “Productos” y es redireccionado a la sección de productos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Automation @Issue:BDSD-3099
  Scenario: El usuario tapea “Contacto” y es redireccionado a la sección de contacto.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/

  @Regresion @Automation @Issue:BDSD-3098
  Scenario: El usuario tapea el menú, luego tapea el botón cerrar y visualiza la home.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario tapea cerrar
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/