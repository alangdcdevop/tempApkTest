Feature: Sitio Web - Footer (Desktop)

  Como prospect
  Quiero ver el footer del sitio web de Banco del Sol
  Para acceder a la información normativa

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en Información a usuarios financieros y es redireccionado a la pantalla información al usuario financiero
    Given el usuario navega a https://www.bdsol.com.ar
    When el usuario presiona informacion al usuario financiero
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/informacion-usuario-financiero/

  @Regresion1 @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en Código de Ética y es redireccionado al PDF correspondiente.
    Given el usuario navega a https://www.bdsol.com.ar
    When el usuario presiona en codigo de etica
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/codigo-de-etica.pdf

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en Comparación de comisiones y es redireccionado a este link del BCRA: https://www.bcra.gob.ar/BCRAyVos/Comparacion_de_Comisiones.asp
    Given el usuario navega a https://www.bdsol.com.ar
    When el usuario hace click en comparacion de comisiones
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bcra.gob.ar/BCRAyVos/Comparacion_de_Comisiones.asp

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en Términos y condiciones y es redireccionado al PDF correspondiente
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en terminos y condiciones
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/terminos-y-condiciones.pdf

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en Protección de datos personales y es redireccionado a la pantalla “Protección de datos personales”.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en proteccion de datos personales
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/proteccion-datos-personales/

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en Régimen de transparencia y es redireccionado a este link del BCRA: http://www.bcra.gob.ar/BCRAyVos/Regimen_de_transparencia.asp
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en regimen de transparencia
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bcra.gob.ar/BCRAyVos/Regimen_de_transparencia.asp

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en Prevención lavado de dinero y es redireccionado al PDF correspondiente
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en prevencion lavado de dinero
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/prevencion-lavado-de-dinero.pdf

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en Defensa del consumidor y es redireccionado a la pantalla “Defensa del consumidor”.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en defensa del consumidor
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/defensa-consumidor/

  @Regresion @Automation @ESPERANDOPUSHWEB @Issue:BDSD-3393
  Scenario: El usuario hace clic en el logo de Usuarios Financieros y es redireccionado a este link del BCRA: http://www.bcra.gob.ar/BCRAyVos/Usuarios_Financieros.asp
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en el logo de usuarios financieros
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla http://www.bcra.gob.ar/BCRAyVos/Usuarios_Financieros.asp

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en cierre de cuentas y es redireccionado a la pantalla “cierre de cuentas”.
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en Cierre de cuentas
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/cierre-cuenta/

  @Regresion @Issue:BDSD-3393 @Automation
  Scenario: El usuario hace clic en portal del cliente bancario y es redireccionado a la pagina http://www.clientebancario.bcra.gov.ar/
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en portal del cliente bancario
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla http://www.clientebancario.bcra.gov.ar/

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en agente adherente MAE y es redireccionado a la pagina http://web-dev.bdsdigital.com.ar/data/MAE.pdf
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en agente adherente MAE
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/MAE.pdf

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en FATCA - crs y es redireccionado a la pagina http://web-dev.bdsdigital.com.ar/data/FATCA-CRS.pdf
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en FATCA - crs
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/FATCA-CRS.pdf

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en politica de cookies y es redireccionado a la pagina http://web-dev.bdsdigital.com.ar/data/politica-de-cookies.pdf
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en politica de cookies
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/politica-de-cookies.pdf

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en censo agropecuario y es redireccionado a la pagina http://web-dev.bdsdigital.com.ar/data/censo-agropecuario.pdf
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en censo agropecuario
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/censo-agropecuario.pdf

  @Regresion @Manual @Issue:BDSD-3393
  Scenario: El usuario hace clic en precios y comisiones y es redireccionado a la pagina http://web-dev.bdsdigital.com.ar/data/precios-y-comisiones.pdf
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en precios y comisiones
    Then el usuario visualiza la pantalla https://www.bdsol.com.ar/data/precios-y-comisiones.pdf

  @Regresion @Manual @ESPERANDOPUSHWEB
  Scenario: El usuario hace clic en linkedin
    Given el usuario navega a https://www.bdsol.com.ar/
    When el usuario hace click en linkedin
    And el usuario cierra la pantalla principal
    Then el usuario visualiza la pantalla https://www.linkedin.com/company/banco-del-sol/about/

