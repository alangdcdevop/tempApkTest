Feature: Calificación FAQs - App

  Como usuario
  Quiero poder calificar las respuestas de las Preguntas Frecuentes

  Background:
    Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion

  @Regresion @Issue:BDSD-2703 @Automation
  Scenario: El usuario consulta una pregunta frecuente, lee la respuesta, visualiza el recurso para calificar la respuesta y califica la respuesta con si.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    And el usuario tapea una de las preguntas frecuentes
    When el usuario visualiza la opcion para calificar si la respuesta fue util o no
    And el usuario tapea que si
    Then el usuario visualiza un agradecimiento por feedback

  @Regresion @Issue:BDSD-2703 @Automation
  Scenario: El usuario consulta una pregunta frecuente, lee la respuesta, visualiza el recurso para calificar la respuesta y califica la respuesta con no.
    Given el usuario ingresa a la pantalla ayuda no loggeado
    And el usuario tapea una de las preguntas frecuentes
    When el usuario visualiza la opcion para calificar si la respuesta fue util o no
    And el usuario tapea que no
    Then el usuario visualiza un agradecimiento por feedback



