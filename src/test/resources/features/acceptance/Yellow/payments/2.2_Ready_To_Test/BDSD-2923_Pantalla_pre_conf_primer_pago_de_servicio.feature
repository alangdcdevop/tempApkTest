@Payment_Regretion_HappyPath
@BDSD-2923
Feature: BDSD-2923 Pantalla pre conf primer pago de servicio

  Como usuario,
  Quiero poder realizar o agendar un pago de monotributo a traves de la app de BDS
  Para no tener que entrar a la web

 Background: Reiniciar Datos
    Given Reset wiremock
   When  usuario accede a pagos
   

#  Happy Path:
  @BDSD-2923_HappyPath
  Scenario: Usuario intenta pagar un servicio con Factura NO agendado, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123456789012
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#           Usuario intenta pagar un servicio sin Vencimiento NO agendado, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
# OK
  Scenario: Usuario intenta pagar un servicio sin Vencimiento NO agendado, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.    
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Medcar
    And   usuario selecciona Ir a rubros de Medcar
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 999
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#           Usuario intenta pagar un servicio Mixto con factura pendiente NO agendado	, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
  #OK
  Scenario: Usuario intenta pagar un servicio Mixto con factura pendiente NO agendado, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario ingresa el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Visa 31/05/19 990.00
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar

#           Usuario intenta pagar un servicio Mixto sin factura pendiente NO agendado	, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
  Scenario: Usuario intenta pagar un servicio Mixto sin factura pendiente NO agendado	, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario ingresa el valor 210987654321
    And   usuario selecciona Continuar
    And   usuario selecciona Pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#           Usuario intenta pagar un servicio Domesticas NO agendado					, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
  Scenario: Usuario intenta pagar un servicio Domesticas NO agendado					, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Act.06hs hasta 4/2019
    And   usuario selecciona Ir a rubros de  Act.06hs hasta 4/2019
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20334446660
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 20334446761
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 042019
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#           Usuario intenta pagar un servicio Monotributista NO agendado				, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
  Scenario: Usuario intenta pagar un servicio Monotributista NO agendado				, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Monotr. Aut. Activo
    And   usuario selecciona Ir a rubros de Monotr. Aut. Activo
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20335574430
    And   usuario selecciona Continuar
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 122012
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 999
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#           Usuario intenta pagar un servicio Vep NO agendado							, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
  Scenario: Usuario intenta pagar un servicio Vep NO agendado							, en pantalla pre confirmacion se visualiza la opcion "Agendar servicio", si se deshabilita se esconde de la vista la opcion de editar el Alias del Servicio.
    Given Get to wiremock /emptyState
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor VEP
    And   usuario selecciona Ir a rubros de VEP
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 12345678901
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 12345678902
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   sistema muestra xpath //android.view.ViewGroup[@content-desc="Editar etiqueta"]/android.widget.TextView con texto Editar
    And   usuario selecciona Agendar servicio
    Then  sistema no muestra el valor Editar alias de servicio

#
#  Validacion de errores/alertas:
#
#           Usuario intenta pagar un servicio con Factura agendado			, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
  Scenario: Usuario intenta pagar un servicio con Factura agendado			, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Edenor
    And   usuario selecciona Ir a rubros de Edenor
    And   usuario ingresa el valor 123456789012
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio sin Vencimiento agendado		, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
  Scenario: Usuario intenta pagar un servicio sin Vencimiento agendado		, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Medcar
    And   usuario selecciona Ir a rubros de Medcar
    And   usuario ingresa el valor 123456789
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 99999
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio Mixto con factura pendiente	, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio". 
  Scenario: Usuario intenta pagar un servicio Mixto con factura pendiente agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario ingresa el valor 123456789012
    And   usuario selecciona Continuar
    And   usuario selecciona Visa 31/05/19 990.00
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio Mixto sin factura pendiente agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
@BDSD-2923_Pendiente
  Scenario: Usuario intenta pagar un servicio Mixto sin factura pendiente agendado,  en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Visa
    And   usuario selecciona Ir a rubros de Visa
    And   usuario ingresa el valor 210987654321
    And   usuario selecciona Continuar
    And   usuario selecciona Pago espontáneo
    And   usuario selecciona Efectuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 123
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio Domesticas agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
 @BDSD-2923_Pendiente
  Scenario: Usuario intenta pagar un servicio Domesticas agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Act.06hs hasta 4/2019
    And   usuario selecciona Ir a rubros de  Act.06hs hasta 4/2019
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20334446660
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 20334446761
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 042019
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio Monotributista agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
  @BDSD-2923_Pendiente
  Scenario: Usuario intenta pagar un servicio Monotributista agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor Monotr. Aut. Activo
    And   usuario selecciona Ir a rubros de Monotr. Aut. Activo
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 20335574430
    And   usuario selecciona Continuar
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 122012
    And   usuario selecciona Continuar
    And   usuario selecciona Ingresa el monto a pagar
    And   usuario ingresa el valor 999
    And   usuario selecciona Continuar

    Then  sistema no muestra el valor Agendar servicio

#           Usuario intenta pagar un servicio Vep agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
  @BDSD-2923_Pendiente
  Scenario: Usuario intenta pagar un servicio Vep agendado, en pantalla pre confirmacion NO se visualiza la opcion "Agendar servicio".
    When  usuario accede a pagos
    And   usuario selecciona Buscar Empresa
    And   usuario selecciona Buscar Empresa
    And   usuario completa el campo Buscar empresa con el valor VEP
    And   usuario selecciona Ir a rubros de VEP
    And   usuario selecciona campo de texto
    And   usuario ingresa el valor 12345678901
    And   usuario selecciona Continuar
    And   usuario ingresa el valor 12345678902
    And   usuario selecciona Continuar
    And   usuario esconde teclado
    And   usuario selecciona Continuar
    Then  sistema no muestra el valor Agendar servicio


