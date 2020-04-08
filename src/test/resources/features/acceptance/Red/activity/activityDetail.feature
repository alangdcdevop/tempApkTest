# language: en
@Issue:BDSD-424
Feature: Detalle de una actividad

  Yo como usuario
  Quiero que al tocar un movimiento me permita acceder a información detallada del mismo
  Para tener mayor conocimiento sobre mis consumos

  Background:
    Given existe el usuario con passcode 192837
    And el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo bdsolqe@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com
    And ingresa el passcode 192837

  @Issue:BDSD-418
  Scenario Outline: El usuario visualiza el detalle de una actividad exitosamente
    Given existe la actividad <nombre_actividad> de la categoria <categoria> realizada el 26/11/2018 a las 18:12 hs con la tarjeta Visa terminada en 7788 por un monto de 341.21
    When el usuario accede al detalle de la actividad
    Then se visualiza la pantalla de detalle de la actividad correspondiente a <categoria>

    Examples:
      | nombre_actividad       | categoria         |
      | "Carrefour San Martin" | "Supermercados"   |
      | "Zara"                 | "Indumentaria"    |
      | "Siga la Vaca"         | "Gastronomia"     |
      | "Village Avellaneda"   | "Entretenimiento" |
      | "Falabella"            | "Hogar"           |
      | "Galeno"               | "Salud"           |
      | "YPF"                  | "Automotor"       |
      | "El mundo del juguete" | "Otros"           |

  @Issue:BDSD-418
  Scenario: Visualizar error al intentar ver detalle de una actividad de la categoria Supermercados
    Given existe la actividad Carrefour San Martin de la categoria Supermercados realizada el 26/11/2018 a las 18:12 hs con la tarjeta Visa terminada en 7788 por un monto de 341.21
    When el usuario accede al detalle de la actividad y no se pueden obtener los datos
    Then se visualiza el mensaje 'Error al obtener la actividad'



    
