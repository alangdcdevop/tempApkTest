Feature: Sitio Web - Cierre de cuentas (Responsive)

  Como usuario
  Quiero ingresar a la sección cierre de cuentas del sitio web de Banco del Sol desde mi computadora

  @Regresion @Issue:BDSD-3358 @Automation
  Scenario: El usuario ingresa al link de “Cierre de cuentas” y visualiza toda la información de la sección.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en Cierre de cuentas
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/cierre-cuenta/

  @Regresion @Issue:BDSD-3358 @Automation
  Scenario: El usuario hace clic en el logo de Banco del Sol  y es redireccionado a la home.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en el logo de banco del sol
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/

  @Regresion @Issue:BDSD-3358 @Automation
  Scenario: El usuario hace clic en “Quienes somos” y es redireccionado a la sección de quienes somos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario hace click en quienes somos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/quienes-somos/

  @Regresion @Issue:BDSD-3358 @Automation
  Scenario: El usuario hace clic en “Productos” y es redireccionado a la sección de productos.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario presiona productos
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/productos/

  @Regresion @Issue:BDSD-3358 @Automation
  Scenario: El usuario hace clic en “Contacto” y es redireccionado a la sección de contacto.
    Given el usuario navega a https://www.bdsol.com.ar/
    And el usuario tapea el menu
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/

  @Regresion @Issue:BDSD-3358 @Manual
  Scenario: El usuario hace clic en el número de whatsapp y es redireccionado a un chat de whatsapp con el banco.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en el numero de whatsapp
    Then el usuario visualiza la pantalla https://api.whatsapp.com/send?phone=541159842523&text=&source=&data=



