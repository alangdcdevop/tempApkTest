Feature: Sitio Web - Home (Responsive)

  Como usuario
  Quiero acceder al sitio Web de Banco del Sol desde un dispositivo móvil
  Para encontrar toda la información del banco.

  @Regresion @Automation @Issue:BDSD-3098
  Scenario: El usuario tapea el menú, tapea en Quiénes Somos y es redireccionado a la pantalla de la historia quienes Somos
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Automation @Issue:BDSD-3098
  Scenario: El usuario tapea el menú, tapea en Productos y es redireccionado a la pantalla de la historia productos
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Automation @Issue:BDSD-3098
  Scenario: El usuario tapea el menú, tapea en Contacto y es redireccionado a la pantalla de la historia contacto
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