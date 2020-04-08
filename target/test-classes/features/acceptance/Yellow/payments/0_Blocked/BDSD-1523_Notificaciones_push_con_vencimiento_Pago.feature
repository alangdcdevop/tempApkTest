@BDSD-1523
Feature: Notificaciones push con vencimientos - Pago

  Como usuario,
  Quiero recibir notificaciones push sobre próximos vencimientos de servicio agendados
  Para completar mis pagos a tiempo.



# Usuario edita un servicio agendado y habilita notificaciones
  @BDSD-1523_HappyPath
  Scenario: Usuario edita un servicio agendado y habilita notificaciones.
    When  usuario accede a pagos
    And   usuario selecciona Ir a servicios agendados
    And   usuario selecciona Olvidar el servicio EdenorConFactNoEditable Edenor
    And   usuario selecciona Editar Servicio
    And   usuario selecciona Habilitar Notificaciones
    And   usuario selecciona Guardar
    Then  sistema envía push notification a usuario.
    And   usuario recibe notificación.


#  Happy path:
#  Usuario realiza flujo de primer pago de servicio con vencimiento,
#    Sistema permite agendar o no
#     por default activa notificaciones (si usuario agenda)
#  Sistema envía notificación push el primer día que figura ese servicio en el batch de vencimientos,
#    usuario acciona sobre dicha notificación
#    y llega a la pantalla de input del servicio consistente con la notificación.
#
#    Usuario acciona en notificacion y accede al pago
#        - Facturas con vencimiento
#        - Facturas mixtas.
#
#
#  Validación de errores/alertas:
#   - Usuario realiza flujo de pago de servicio con vencimientos (no primer pago),
#    sistema no permite modificar el agendamiento ni notificación.
#
#   - Usuario paga vencimiento desde la home previo a recibir notificación
#    → no debe recibir notificación de ese vencimiento.
#
#   - Usuario recibe notificación pero vencimiento no está disponible porque pagó por otro medio
#    →  al seleccionar, sistema debe mostrar modal donde indica que ya abonó o la factura ya no está disponible
#    →  y llevarlo a home de pagos.
#
#   - Usuario recibe notificación pero vencimiento no está disponible porque pagó via la app pero sin accionar la notificación
#    → sistema lleva al comprobante correspondiente dentro de Historial
#
#   - Usuario borra de agenda un servicio,
#    → no debe recibir notificaciones (todos los tipos de notificación) de ese servicio en adelante.
#
#   - Usuario está realizando un pago y recibe una notificación y acciona sobre esa notificación,
#    el pago que estaba realizando:
#            - no se debe confirmar si no estaba completado y confirmado.
#            - se debe confirmar si ya estaba completado y confirmado.
#
#   - Usuario recibe notificación de vencimiento, ingresa a la app (no vía notificación)
#    → sistema debe persistir la notificación.
#     - A futuro, considerar si otro tipo de notificaciones
#     - (que no involucren vencimientos) pueden tener otro tratamiento.
#
#
#
#  adb shell am start -a android.intent.action.VIEW -d https://open-dev.bdsdigital.com.ar/link-account?token=eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJGcDFxNlRLaHM5VHNXWTZoakx3TEFaTUswTWI1djhtY3VrNmlkQzJ2QW5BIn0.eyJqdGkiOiI5YTNiZjlmOS01YWNmLTQ3ZDktYmQwYi1iZDkyYTk5Y2ZhYjMiLCJleHAiOjE1Nzc5ODc4NDcsIm5iZiI6MCwiaWF0IjoxNTc3MzgzMDQ3LCJpc3MiOiJodHRwOi8va2V5Y2xvYWstZGV2LWh0dHAua2V5Y2xvYWstZGV2LnN2Yy5jbHVzdGVyLmxvY2FsL2F1dGgvcmVhbG1zL2Jkcy1kZXYiLCJzdWIiOiI0YjAwNDMyZS0zNmM5LTQwOTctYmMwYi0yYzAxYzEyZDNjNWQiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJjbGllbnRzLWF1dGgtc2lnbnVwIiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiYmNmOTBkNTUtZmI2YS00YWRkLTliZGQtNDdjNjU2ZGVjMTViIiwiY29yZUNsaWVudElkIjoiMTAwMjExIiwibmFtZSI6IkFsYW4gRHVhcnRlIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYmRzb2xxZXllbGxvd0BnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiQWxhbiIsImlkTnVtYmVyIjoiMzM1NTc0NDQiLCJ1c2VySWQiOiI0YjAwNDMyZS0zNmM5LTQwOTctYmMwYi0yYzAxYzEyZDNjNWQiLCJmYW1pbHlfbmFtZSI6IkR1YXJ0ZSIsImRldmljZUlkIjoiOTkyNjg2ZGEwMTBkN2I3OCIsImVtYWlsIjoiYmRzb2xxZXllbGxvd0BnbWFpbC5jb20ifQ.MSjNk5yfLWtn9i2onxRydBcIAF4xv1M49wu6XBFrUs0xtcuPFceO31GnS0kk2uT29D9yNmJgsQ9IW4GLReWw2u2f3aCMUwgUplGNVCI71zaP22hfIoF5R0Q6bTuAgiuX-vRshz_qWHyH9MHRjg6lp23mmIVONTntwbOokoh-F4qUPEuJgJw2qjQzvQG3Ctrvpl3ayMPrhf7rMv_g297doaoFARec-RBWU2qWQu54KsxaZRH3NTR1YlPbOkNEubkbFt51xxlozU16Lj80V_ECeEFgHOZQ7VcJkXjYndFuUX7mioisOp00RMDkQ7Aa93FieXF2VrMyUswfkBLTaV7Qvw
