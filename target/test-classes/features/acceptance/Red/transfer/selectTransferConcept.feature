# language: en
@Issue:BDSD-415
Feature: Seleccionar concepto

  Como usuario
  Quiero poder seleccionar los conceptos de mis operaciones
  Para poder identificar las operaciones segun la normativa vigente

  @Issue:BDSD-594
  Scenario Outline: El usuario realiza una transferencia exitosa con motivo por defecto Haberes

    Given ingresa el alias ROJO.ROSA.ROMULO
    When hace click en siguiente
    And valida los datos ingresados
    And ingresa el monto 500
    And selecciona el motivo de transferencia <motivo_de_transferencia>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia <motivo_de_transferencia>

    Examples:
      | motivo_de_transferencia                   | motivo_de_transferencia                   |
      | "Haberes"                                 | "Haberes"                                 |
      | "Alquileres"                              | "Alquileres"                              |
      | "Cuotas"                                  | "Cuotas"                                  |
      | "Expensas"                                | "Expensas"                                |
      | "Facturas"                                | "Facturas"                                |
      | "Operaciones inmobiliarias"               | "Operaciones inmobiliarias"               |
      | "Operaciones inmobiliarias habitualistas" | "Operaciones inmobiliarias habitualistas" |
      | "Prestamos"                               | "Prestamos"                               |
      | "Seguros"                                 | "Seguros"                                 |
      | "Honorarios"                              | "Honorarios"                              |
      | "Bienes registrables habitualistas"       | "Bienes registrables habitualistas"       |
      | "Bienes registrables no habitualistas"    | "Bienes registrables no habitualistas"    |
      | "Suscripcion obligaciones negociables"    | "Suscripcion obligaciones negociables"    |
      | "Aportes de capital"                      | "Aportes de capital"                      |
      | "Reintegros de obras sociales y prepagas" | "Reintegros de obras sociales y prepagas" |
      | "Siniestros de seguros"                   | "Siniestros de seguros"                   |
      | "Estados expropiaciones u otros"          | "Estados expropiaciones u otros"          |
