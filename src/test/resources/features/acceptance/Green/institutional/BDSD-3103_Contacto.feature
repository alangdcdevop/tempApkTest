Feature: Sitio Web - Contacto (Desktop)

  Como prospect
  Quiero ingresar a la sección de Contacto en el sitio web de Banco del Sol desde mi computadora
  Para ver las distintas formas de comunicarme con el banco

  @Regresion @Issue:BDSD-3103 @Automatizado
  Scenario: El usuario ingresa a la sección de contacto y visualiza la información correspondiente.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en contacto
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/contacto/
