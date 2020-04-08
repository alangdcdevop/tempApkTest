#language:en
Feature: Common Utilities

Scenarios que sirven para todas las celulas, la idea es poner escenarios que no son especificos de un feature pero sirven para generar datos o condiciones de pruebas.

  @EliminarContactos
  Scenario Outline: Eliminar contactos de la agenda
    Given Existe un usuario <mail> y passcode <passcode> con Contactos cargados
    When existe usuario <mail> y passcode <passcode> sin contactos en la agenda
    Then valida algo

    Examples:
      | mail                 | passcode |
      | bdsolqered@gmail.com | 192837   |

  @crearmovimientosdesdeelcore
  Scenario Outline: Agregar movimientos en el core para un usuario indicando tipo de movimiento
    Given creo un <movimiento> para el cliente con mail <mail> y passcode <passcode>

  Examples:
  | mail                  | passcode | movimiento  |
  |bdsolqered@gmail.com | 192837   | debin |
  
