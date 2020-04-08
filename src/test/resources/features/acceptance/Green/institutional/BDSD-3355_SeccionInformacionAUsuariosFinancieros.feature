Feature: Sitio Web - Sección Información a Usuarios Financieros (Desktop)

  Como prospect
  Quiero ingresar a la sección de Información de usuario financiero del sitio web de banco del sol desde mi computadora.

  @Automation @Issue:BDSD-3355 @Regresion
  Scenario: El usuario ingresa al link de “Información al usuario financiero” que se encuentra en el footer y visualiza toda la información de la sección.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario presiona informacion al usuario financiero
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/informacion-usuario-financiero/

  @Automation @Issue:BDSD-3355 @Regresion
  Scenario: El usuario hace clic en “www.usuariosfinancieros.gob.ar” y es redireccionado al sitio web: http://www.bcra.gob.ar/BCRAyVos/Usuarios_Financieros.asp
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario presiona informacion al usuario financiero
    And el usuario presiona el link de usuarios financieros
    Then el usuario visualiza la pantalla https://www.bcra.gob.ar/BCRAyVos/Usuarios_Financieros.asp
