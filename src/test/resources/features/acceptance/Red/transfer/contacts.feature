#language:en
Feature: Agendar contactos nuevos

Como usuario quiero poder agregar, eliminar y modificar mi agenda de contactos
 
  #Background: Acceder a Home de transferencias
  #  Given el usuario ingresa a la pantalla de login
  #  And el usuario acepta los requisitos de identificacion
  #  And el usuario ingresa el correo Bdsolqe@gmail.com
  #  And el usuario confirma el correo
  #  And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
  #  And ingresa el passcode 368257
  #  And el usuario acepta terminos y condiciones
 #   And se visualiza la home
  #  And el usuario accede a transferencias
  
  @Issue:BDSD-694 @happypath
  Scenario Outline: Usuario presiona Boton volver en modal consulta titularidad en flujo alta de contacto nuevo.
  Given el usuario ingresa a la pantalla de login
  And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
  And el usuario selecciona Ver Agenda
  And presiona el boton Agregar un contacto en la vista agenda
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad 
  Then presiona botón volver en modal consulta titularidad
  And el usuario ve la home de transferencias

       Examples:
      |    banco              | cuil        | cbu-cvu-alias             | nombre              |  tipo cuenta                |
      | BANCO DEL SOL DIGITAL | 20397727433 | 3108100900010000011195    | DOMINGUEZ FRANCISCO | Caja de Ahorro en pesos     |    
 

 
  @Issue:BDSD-683 @happypath1
  Scenario Outline: Grabar contacto nuevo a través de un CBU en flujo transferencia exitoso
  motivo de transferencia por defecto grabando nuevo contacto con descripcion por defecto
        Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
    And existe usuario <mail> y passcode <passcode> sin contactos en la agenda
    And hace click en Nueva Transferencia
    And ingresa el cbu <cbu>
    When hace click en siguiente
    And valida nombre destinatario <nombre>
    And valida cuil destinatario <cuil>
    And valida banco destinatario <banco>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente modal consulta titularidad
    And ingresa el monto <monto>
    And hace click en siguiente view monto
    And confirma la transferencia
 #   Then presiona botón Finalizar
    Then scroll down para recargar la vista
    And el usuario selecciona Ver Agenda
    And visualiza el nuevo contacto <nombre> en la agenda

        Examples:
      |     monto    | nombre              | banco                | ncuenta   | tcuenta                 | cuil        | cbu                     | mail | passcode |
     # |     10       | VERGARA, LEONEL/    | HSBC BANK ARG. S.A   | 0596373553| Caja de Ahorro en pesos | 20121547652 | 1500009100005963735532  | Bdsolqered@gmail.com | 368257 | 
      |   11         | LAURA GIORDANO      | BANCO DEL SOL DIGITAL | 1000001569| Caja de Ahorro en pesos | 27224379094 | 3108100900010000015692 |Bdsolqered@gmail.com | 368257 |    

  @Issue:BDSD-683 @happypath
  Scenario Outline: Grabar contacto nuevo a través de un ALIAS en flujo transferencia exitoso
        Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
    And existe usuario <mail> y passcode <passcode> sin contactos en la agenda
    And hace click en Nueva Transferencia
    And ingresa el alias <alias>
    And hace click en siguiente
    When valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida tipo cuenta destinatario <tcuenta>
    And hace click en siguiente modal consulta titularidad
    And ingresa el monto <monto>
    And hace click en siguiente view monto
    Then confirma la transferencia
    And la transferencia se realiza exitosamente con motivo de transferencia varios
    And presiona botón Finalizar
    And el usuario selecciona Ver Agenda
    And visualiza el nuevo contacto <nombre> en la agenda

        Examples:
     |   monto | nombre              | banco                 | ncuenta   | tcuenta                 |   cuil      | cbu                     | alias          | mail                | passcode |
     |   11    |LAURA GIORDANO       | BANCO DEL SOL DIGITAL | 1000001569| Caja de Ahorro en pesos | 27224379094 | 3108100900010000015692  | BDS.PRUEBA.02 |Bdsolqered@gmail.com | 368257 |    
 
      
  @Issue:BDSD-683 @happypath
  Scenario Outline: El usuario realiza una Tx con motivo x defecto mediante CBU que falla en el ultimo paso y se guarda el contacto
        Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
    And existe usuario <mail> y passcode <passcode> sin contactos en la agenda
   And hace click en Nueva Transferencia
    And ingresa el cbu <cbu>
    When hace click en siguiente
    And valida cuil destinatario <cuil>

    Examples:
      | monto | nombre              | banco                 | ncuenta    | tcuenta                 | cuil        | cbu                    | alia        | mail                   | passcode |
      | 11    | DOMINGUEZ FRANCISCO | BANCO DEL SOL DIGITAL | 1000001119 | Caja de Ahorro en pesos | 20397727433 | 3108100900010000011195 | LOVE.SHERPA | Bdsolqe+int1@gmail.com | 663755   |

  @Issue:BDSD-683 @happypath
  Scenario Outline: El usuario realiza una Tx con motivo x defecto mediante ALIAS que falla en el ultimo paso y se guarda el contacto
       Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
    And existe usuario <mail> y passcode <passcode> sin contactos en la agenda
    And hace click en Nueva Transferencia
    And ingresa el alias <alias>
    And hace click en siguiente
    And hace click en siguiente modal consulta titularidad
    And ingresa el monto <monto>
    And hace click en siguiente view monto
    Then confirma la transferencia
    And presiona botón Volver a Transferencias
    And el usuario selecciona Ver Agenda
    And visualiza el nuevo contacto <nombre> en la agenda

        Examples:
     |   monto | nombre              | banco                 | ncuenta   | tcuenta                 |   cuil      | cbu                     | alias          | mail                | passcode |
     |   11    |LAURA GIORDANO       | BANCO DEL SOL DIGITAL | 1000001569| Caja de Ahorro en pesos | 27224379094 | 3108100900010000015692  | BDS.PRUEBA.02 |Bdsolqered@gmail.com  | 368257 |     

 @BDSD-683
  Scenario Outline: El usuario realiza una transferencia exitosa, a la caja de ahorro de bdsol, de un contacto nuevo a través de un CBU con
  motivo de transferencia por defecto grabando el nuevo contacto en su agenda
    Given ingresa el cbu <cbu>
    When hace click en siguiente
    And valida cuil destinatario <cuil>
    And valida nombre destinatario <nombre>
    And valida banco destinatario <banco>
    And valida numero cuenta destinatario <ncuenta>
    And valida tipo cuenta destinatario <tcuenta>
    And ingresa el monto <monto>
    And confirma la transferencia
    Then la transferencia se realiza exitosamente con motivo de transferencia varios
    And puede ver el comprobante de transferencia
#    And valida la existencia del nuevo contacto en la agenda
    Examples:
      | monto | nombre                | banco                   | ncuenta    | tcuenta | cuil        | cbu                    |
      | 500   | "DOMINGUEZ FRANCISCO" | "BANCO DEL SOL DIGITAL" | 1000001119 | "CA"    | 20397727433 | 3108100900010000011195 |
#      |     500.35    | "DOMINGUEZ FRANCISCO" | "BANCO DEL SOL DIGITAL"  | 1000001119	| "CA"    | 20397727433 | 3108100900010000011195  |
  
  @Issue:BDSD-694 @happypath @ERRORESPORFALTADELABEL
  Scenario Outline: Agendar un nuevo contacto de manera manual desde home de transferencias dejando descripcion x defecto x CBU
       Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
    And existe usuario <mail> y passcode <passcode> sin contactos en la agenda
  And presiona el boton Agregar un contacto
  When completa el campo <cbu>
  And hace click en siguiente flow agregar contacto  
  Then valida <nombre> del nuevo contacto en modal consulta titularidad
  And valida el banco <banco> en modal consulta titularidad
  And valida el cuil <cuil> en modal consulta titularidad
  And valida el tipo de cuenta <tipo cuenta> en modal consulta titularidad
  And valida el cbu <cbu> en modal consulta titularidad
  And hace click en siguiente modal consulta titularidad
  And valida el nombre <nombre> del nuevo contacto en pantalla confimación
  And valida el banco <banco> del nuevo contacto en pantalla confimación
#  And valida el cuil <cuil> del nuevo contacto en pantalla confimación  FALTA LABEL
#  And valida el cbu <cbu> del nuevo contacto en pantalla confimación    FALTA LABEL
  And presion botón Agendar Contacto
  And el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And el usuario selecciona Ver Agenda
  And visualiza el nuevo contacto <nombre> en la agenda

      Examples:
    | nombre               | banco                 | ncuenta        | tipo cuenta                 |   cuil      | cbu                     |  mail                | passcode |
    | PETRONE MURIEL ELINA | ICBC                  | 05280111019012 | Cuenta Corriente en pesos   | 23321289584 | 0150506102000109480710  | Bdsolqered@gmail.com | 368257   |

  @Issue:BDSD-694 @happypath
  Scenario Outline: Agendar un nuevo contacto de manera manual x Alias desde home de transferencias
        Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
  And presiona el boton Agregar un contacto
  When completa el campo <cbu>
  And hace click en siguiente flow agregar contacto  
  Then valida <nombre> del nuevo contacto en modal consulta titularidad
  And valida el banco <banco> en modal consulta titularidad
  And valida el cuil <cuil> en modal consulta titularidad
  And valida el tipo de cuenta <tipo cuenta> en modal consulta titularidad
  And valida el cbu <cbu> en modal consulta titularidad
  And hace click en siguiente modal consulta titularidad
  And valida el nombre <nombre> del nuevo contacto en pantalla confimación
  And valida el banco <banco> del nuevo contacto en pantalla confimación
#  And valida el cuil <cuil> del nuevo contacto en pantalla confimación  FALTA LABEL
#  And valida el cbu <cbu> del nuevo contacto en pantalla confimación    FALTA LABEL
  And presion botón Agendar Contacto
  And el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And el usuario selecciona Ver Agenda
  And visualiza el nuevo contacto <nombre> en la agenda

        Examples:
     | nombre              | banco                 | tipo cuenta             |   cuil      | cbu           | alias          | mail                | passcode |
     | LAURA GIORDANO      | BANCO DEL SOL DIGITAL | Caja de Ahorro en pesos | 27224379094 | 3108100900010000015692  | BDS.PRUEBA.02 |Bdsolqered@gmail.com | 368257   |

 @Issue:BDSD-694 @happypathxx
  Scenario Outline: Agendar un nuevo contacto de manera manual desde Agenda x CBU
  dejando descripcion x defecto
  Given existe usuario <mail> y passcode <passcode> sin contactos en la agenda
  And el usuario selecciona Ver Agenda
  When presiona el boton Agregar un contacto en la vista agenda
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad 
  Then valida <nombre> del nuevo contacto en modal consulta titularidad
  And valida el banco <banco> en modal consulta titularidad
  And valida el cuil <cuil> en modal consulta titularidad
  And valida el tipo de cuenta <tipo cuenta> en modal consulta titularidad
  And valida el cbu <cbu> en modal consulta titularidad
  And hace click en siguiente modal consulta titularidad 
  And valida el nombre <nombre> del nuevo contacto en pantalla confimación
  And valida el banco <banco> del nuevo contacto en pantalla confimación
  And valida el cuil <cuil> del nuevo contacto en pantalla confimación
  And valida el tipo de cuenta <tipo cuenta> del nuevo contacto en pantalla confimación
  And valida el cbu <cbu> del nuevo contacto en pantalla confimación
  And presion botón Agendar Contacto
  And el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And visualiza el nuevo contacto <nombre> en la agenda


       Examples:
     | nombre               | banco                 | ncuenta        | tipo cuenta                 |   cuil      | cbu-cvu-alias           |  mail                | passcode |
     | LAURA GIORDANO       | BANCO DEL SOL DIGITAL | 1000001569     | Caja de Ahorro en pesos     | 27224379094 | 3108100900010000015692  | Bdsolqered@gmail.com | 368257   |    
     | PETRONE MURIEL ELINA | ICBC                  | 05280111019012 | Cuenta Corriente en pesos   | 23321289584 | 0150506102000109480710  | Bdsolqered@gmail.com | 368257   |

    
 
 #EN ADELANTE NO ESTAN VALIDADAS LAS CORRIDAS
 
 
  @Issue:BDSD-6944444
  Scenario Outline: Toast Agendar contacto existente de manera manual
   Given el usuario selecciona Ver Agenda
  And selecciona contacto <nombre>
  And presiona boton Agregar nueva cuenta
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad  
  And presion botón Agendar Contacto
  Then el usuario ve toast El contacto ya está agendado
    Then se muestra error en transferencia

    Examples:
      | monto | cuil      | cbu-cvu-alias |
      | 500   | 454535353 | LOVE.SHERPA   |


  @Issue:BDSD-694
  Scenario Outline: Agendar un nuevo contacto de manera manual desde Agenda x Alias
    Given el usuario selecciona Ver Agenda
    When presiona el boton Agregar un contacto en la vista agenda
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente modal consulta titularidad
    Then valida <nombre> del nuevo contacto en modal consulta titularidad
    And valida el banco <banco> en modal consulta titularidad
    And valida el cuil <cuil> en modal consulta titularidad
    And valida el tipo de cuenta <tipo cuenta> en modal consulta titularidad
    And valida el cbu <cbu> en modal consulta titularidad
    And hace click en siguiente modal consulta titularidad
    And valida el nombre <nombre> del nuevo contacto en pantalla confimación
    And valida el banco <banco> del nuevo contacto en pantalla confimación
    And valida el cuil <cuil> del nuevo contacto en pantalla confimación
    And valida el tipo de cuenta <tipo cuenta> del nuevo contacto en pantalla confimación
    And valida el cbu <cbu> del nuevo contacto en pantalla confimación
    And presion botón Agendar Contacto
    And el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And visualiza el nuevo contacto <nombre> en la agenda

    Examples:
      | banco                 | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta               |
      | ICBC                  | 23321289584 | love-sherpa | PETRONE MURIEL ELINA | Cuenta Corriente en pesos |
      | BANCO DEL SOL DIGITAL | 20397727433 | love-sherpa | DOMINGUEZ FRANCISCO  | Caja de Ahorro en pesos   |

 @Issue:BDSD-694
  Scenario Outline: Agendar un nuevo contacto de manera manual modificando el Alias
    Given existe usuario <mail> sin contactos en la agenda
    And presiona el boton Agregar un contacto
    When completa el campo <cbu-cvu-alias>
    And hace click en siguiente modal consulta titularidad
    And presiona boton Agregar descripción
    And completa descripcion del contacto
    And presiona aceptar
    And presion botón Agendar Contacto
    Then el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And usuario regresa a ver la agenda

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             | mail                   |
      | ICBC  | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA | Caja de Ahorro en pesos | Bdsolqe+int1@gmail.com |

  @Issue:BDSD-694
  Scenario Outline: Visualizar mensaje de error en alta de nuevo contacto de cuenta en Dolares
    Given el usuario selecciona Ver Agenda
    And presiona el boton Agregar un contacto
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente modal consulta titularidad
    And ve mensaje de error

    Examples:
      | cbu-cvu-alias          |
      | 0150506111000114203087 |


  @Issue:BDSD-694 @WIP
  Scenario Outline: Agendar una cuenta de contacto existente de manera manual x alias desde Agenda
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <contacto>
    And presiona boton Agregar nueva cuenta
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente
    And presion botón Agendar Contacto
    Then el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario vuelve a la agenda
#  And visualiza el nuevo contacto revisar como implementar si es necesario hacer scroll o accedo sin verlo

    Examples:
      | monto | cuil      | cbu-cvu-alias        |
      | 500   | 454535353 | SHERPA.LOVE.ACCOUNT2 |

  @WIP
  Scenario: Error conexion con prisma al cargar nuevo contacto de manera manual x CBU
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <contacto>
    And presiona boton Agregar nueva cuenta
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente
    And presion botón Agendar Contacto
    Then el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario vuelve a la agenda
# And visualiza el nuevo contacto revisar como implementar si es necesario hacer scroll o accedo sin verlo

  @Issue:BDSD-694 @WIP
  Scenario: Alias inexistente al cargar nuevo contacto de manera manual
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <contacto>
    And presiona boton Agregar nueva cuenta
    And completa el campo LOVESHERPA
    And hace click en siguiente
    Then el usuario ve mensaje Corroborá los datos ingresados
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente
    And presion botón Agendar Contacto
    And el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario vuelve a la agenda

  @Issue:BDSD-694 @WIP
  Scenario: Dato CBU erroneo al cargar nuevo contacto de manera manual
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <contacto>
    And presiona boton Agregar nueva cuenta
    And completa el campo 12345678912345678987
    And hace click en siguiente
    Then el usuario ve mensaje Corroborá los datos ingresados
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente
    And presion botón Agendar Contacto
    And el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario vuelve a la agenda

  @Issue:BDSD-694 @manual
  Scenario: Error al confirmar nuevo contacto de manera manual x CBU

  @Issue:BDSD-694 @manual
  Scenario: Error al confirmar nuevo contacto de manera manual x Alias

@Issue:BDSD-1976 @happypath @SELEVANTATECLADOENANDROIDENCONSULTATITULAURDAD
  Scenario Outline: Agendar una nueva cuenta a contacto existente de manera manual desde Agenda x CBU
  Given el usuario selecciona Ver Agenda
  And selecciona contacto <nombre>
  And presiona boton Agregar nueva cuenta
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad  
  And presion botón Agendar Contacto
  Then el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And el usuario selecciona Ver Agenda

       Examples:
      |    banco              | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta               |
      | ICBC                  | 23321289584 | 0150528301000110190124    | PETRONE MURIEL ELINA| Caja de Ahorro en pesos   |    

@Issue:BDSD-1976 @happypathxx
  Scenario Outline: Agendar una nueva cuenta a contacto existente de manera manual desde vista de transferencias X CBU
  Given el usuario ingresa a la pantalla de login
  And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
  And selecciona contacto <nombre>
  And presiona boton Agregar nueva cuenta
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad  
  And presion botón Agendar Contacto
  Then el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And el usuario selecciona Ver Agenda

       Examples:
      |    banco              | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta               |
      | ICBC                  | 23321289584 | 0150528301000110190124    | PETRONE MURIEL ELINA| Caja de Ahorro en pesos   |

 @Issue:BDSD-1976 @happypathxx
  Scenario Outline: Agendar una nueva cuenta a contacto existente de manera manual desde vista de transferencias X ALIAS
  Given el usuario ingresa a la pantalla de login
  And el usuario acepta los requisitos de identificacion
  And el usuario ingresa el correo Bdsolqe@gmail.com
  And el usuario confirma el correo
  And accedo por magic link con mail bdsolqered@gmail.com y password Bdsol123
  And ingresa el passcode 368257
  And el usuario acepta terminos y condiciones
  And el usuario accede a transferencias
  And selecciona contacto <nombre>
  And presiona boton Agregar nueva cuenta
  And completa el campo <cbu-cvu-alias>
  And hace click en siguiente modal consulta titularidad  
  And presion botón Agendar Contacto
  Then el usuario ve pantalla Contacto Agregado
  And presiona botón Finalizar
  And el usuario selecciona Ver Agenda

       Examples:
      |    banco              | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta               |
      | ICBC                  | 23321289584 | LOVE-SHERPA               | PETRONE MURIEL ELINA| Caja de Ahorro en pesos   |

  @Issue:BDSD-1976
  Scenario Outline: Agendar una nueva cuenta a contacto existente de manera manual desde Agenda x Alias
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    And presiona boton Agregar nueva cuenta
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente modal consulta titularidad
    And presion botón Agendar Contacto
    Then el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario selecciona Ver Agenda
  #implementar validacion redir agenda cuando se desarrolle

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             |
      | ICBC  | 23321289584 | love-sherpa | PETRONE MURIEL ELINA | Caja de Ahorro en pesos |    
       
  @Issue:BDSD-1976
  Scenario Outline: Agendar cuenta nueva de manera manual ingresando desde el detalle de otro contacto
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre1>
    And presiona boton Agregar nueva cuenta
    And completa el campo <cbu-cvu-alias>
    And hace click en siguiente modal consulta titularidad
    And presion botón Agendar Contacto
    Then el usuario ve pantalla Contacto Agregado
    And presiona botón Finalizar
    And el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
  #implementar validacion redir agenda cuando se desarrolle

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             | banco1                | nombre1             |
      | ICBC  | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA | Caja de Ahorro en pesos | BANCO DEL SOL DIGITAL | DOMINGUEZ FRANCISCO |

  @Issue:BDSD-1976 @WIP
  Scenario: Consultar detalle contacto guardado con mas de 1 banco

  @Issue:BDSD-1972
  Scenario Outline: Agregar Alias de contacto a contacto existente
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When hace click en Editar descripción
    And modifica nickname <nickname> del contacto
    And presiona guardar para grabar el nuevo nickname
    Then el usuario ve el nickname <nickname> nuevo en el detalle del contacto

    Examples:
      |    banco          | cuil        | cbu-cvu-alias             | nombre           | tipo cuenta                | nickname |
      | ICBC         | 23321289584 | 0150506102000109480710    | PETRONE MURIEL ELINA| Cuenta Corriente en pesos   | NICK NUEVO  |
    
  @Issue:BDSD-1972
  Scenario Outline: Modificar Alias de contacto a contacto existente por segunda vez
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When hace click en Editar descripción
    And modifica nickname <nickname> del contacto
    And presiona guardar para grabar el nuevo nickname
    Then el usuario ve el nickname <nickname> nuevo en el detalle del contacto

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             | nickname    |
      | ICBC  | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA | Caja de Ahorro en pesos | PETRONENICK |

  @Issue:BDSD-1972  @VALIDARDATOSCONCASOANTERIOR
  Scenario Outline: Modificar Alias de contacto a contacto de la agenda con mismo alias que otro contacto
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When hace click en Editar descripción
    And modifica nickname <nickname> del contacto
    And presiona guardar para grabar el nuevo nickname
    Then el usuario ve el nickname <nickname> nuevo en el detalle del contacto

    Examples:
      |    banco     | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta                 | nickname     | ncuenta |
      | ICBC         | 23321289584 | 0150528301000110190124    | PETRONE MURIEL ELINA| Caja de Ahorro en pesos     | NICK 1       | 05280111019012 |


  @Issue:BDSD-1972
  Scenario Outline: Editar nickname intentado ingresar mas de 12 caracteres
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When hace click en Editar descripción
    And modifica nickname JHONLOVESHERP del contacto
    Then el usuario no puede ingresar el caracter P por superar los 12 maximos
    And presiona guardar para grabar el nuevo nickname
    And el usuario ve el nickname JHONLOVESHER nuevo en el detalle del contacto

    Examples:

      |    banco     | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta                 | nickname     | ncuenta |
      | ICBC         | 23321289584 | 0150528301000110190124    | PETRONE MURIEL ELINA| Caja de Ahorro en pesos     | PETRONENICK  | 05280111019012 |
  
  @WRESOLVERCOMOFORZARELERRORISSUE1972
  Scenario Outline: Error al confirmar modificación de Alias de contacto
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    And hace click en Editar descripción
    And modifica nickname <nickname> del contacto
    When presiona guardar para grabar el nuevo nickname
    Then el usuario ve mensaje de error al guardar nickname Error al guardar

    Examples:
      |    banco | cuil        | cbu-cvu-alias          | nombre              | tipo cuenta              |  nickname     | ncuenta        |
      | ICBC     | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA| Caja de Ahorro en pesos  |  PETRONENICK  | 05280111019012 |

  @Issue:BDSD-1975
   Scenario Outline: Transferir dinero a un contacto guardado en la agenda con cuenta unica
  Given el usuario selecciona Ver Agenda
  And selecciona contacto <contacto>
  And el usuario ingresa en detalle de una cuenta
  When hace click en Nueva Transferencia 
  And ingresa el monto <monto> 
  And confirma la transferencia
  Then la transferencia se realiza exitosamente con motivo de transferencia varios
    
        Examples:
      |     monto    | contacto              | banco                | ncuenta   | tcuenta                 | cuil        | cbu                     |      
      |     10       | VERGARA, LEONEL/      | HSBC BANK ARG. S.A   | 0596373553| Caja de Ahorro en pesos | 20347123200 | 1500009100005963735532  |
 
   @Issue:BDSD-1975
   Scenario Outline: Transferir dinero desde detalle de cuenta teniendo mas de 1 contacto en la agenda
  Given el usuario selecciona Ver Agenda
  And selecciona contacto <contacto>
  And el usuario ingresa en detalle de una cuenta
  When hace click en Nueva Transferencia 
  And ingresa el monto <monto> 
  And confirma la transferencia
  Then la transferencia se realiza exitosamente con motivo de transferencia varios
    
        Examples:
      |     monto    | contacto              | banco                | ncuenta   | tcuenta                 | cuil        | cbu                     |      
      |     10       | VERGARA, LEONEL/      | HSBC BANK ARG. S.A   | 0596373553| Caja de Ahorro en pesos | 20347123200 | 1500009100005963735532  |
 
 @Issue:BDSD-1975 @IMPLEMENTARFALTANTE
  Scenario Outline: Boton Cancelar modal de confirmacion al borrar una cuenta
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    And el usuario ingresa en detalle de una cuenta <banco>
    When presiona boton Cancelar

    Examples:
      |    banco | cuil        | cbu-cvu-alias          | nombre              | tipo cuenta              |  nickname     | ncuenta |
      | ICBC     | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA| Caja de Ahorro en pesos  |  PETRONENICK  | 05280111019012 |
      
  @Issue:BDSD-1975
  Scenario Outline: Se visualiza la card abierta para detalle de contacto con unica cuenta
    Given el usuario selecciona Ver Agenda
    When selecciona contacto <nombre>
    Then el boton CBU copia al portapapeles el <cbu-cvu-alias> correcto
    And estas visible el boton transferir
    And estas visible el boton Eliminar

    Examples:
      |    banco | cuil        | cbu-cvu-alias          | nombre              | tipo cuenta              |  nickname     | ncuenta |
      | ICBC     | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA| Caja de Ahorro en pesos  |  PETRONENICK  | 05280111019012|
     
 @Issue:BDSD-1975
  Scenario Outline: Eliminar una cuenta de un contacto con mas de una cuenta en forma exitosa
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    And el usuario ingresa en detalle de una cuenta <banco>
    And presiona boton eliminar
    Then el usuario ve modal Esta seguro de eliminar la cuenta asociada a este contacto?
    And presiona boton confirmar
    And regresa a vista del contacto visualizando mensaje Cuenta Eliminada
    And valida que la cuenta se elimino correctamente <banco>

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             | nickname    |
      | ICBC  | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA | Caja de Ahorro en pesos | PETRONENICK |


  @Issue:BDSD-1975
  Scenario: Eliminar una cuenta, de contacto con solo una cuenta asociada en forma exitosa teniendo 2 contactos en la agenda
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    And el usuario ingresa en detalle de una cuenta <banco>
    When presiona boton eliminar
    Then el usuario ve modal Esta seguro de eliminar la cuenta asociada a este contacto?
    And presiona boton confirmar
    And regresa a vista del contacto visualizando mensaje Cuenta Eliminada
    And valida que la cuenta se elimino correctamente <banco>

  @Issue:BDSD-1975
  Scenario Outline: Eliminar cuenta unica de contacto de la agenda en forma exitosa
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When presiona boton eliminar
    Then el usuario ve modal Esta seguro de eliminar este contacto de su lista?
    And presiona boton confirmar
    And regresa a vista del contacto visualizando mensaje Cuenta Eliminada
 # And visualiza el mensaje contacto eliminado
 # And la app va directo a la agenda y el usuario confirma que tambien se elimino el contacto
      
       Examples:
      |    banco              | cuil         | cbu-cvu-alias          | nombre              | tipo cuenta              |  nickname     |
      |  HSBC BANK ARG. S.A   |  0596373553  | 1500009100005963735532 | VERGARA, LEONEL/   | Caja de Ahorro en pesos   |  NICK 2       |    
  
  @Issue:BDSD-1975 @manual
  Scenario: Hint al intentar eliminar un contacto de la agenda

  @Issue:BDSD-2105
  Scenario Outline: Boton Cancelar en flujo eliminar contacto
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When presiona boton Eliminar contacto
    Then presiona boton cancelar
#  Then visualiza el label Contacto

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta               | nickname   |
      | ICBC  | 23321289584 | 0150506102000109480710 | PETRONE MURIEL ELINA | Cuenta Corriente en pesos | NICK NUEVO |

  @Issue:BDSD-2105
  Scenario Outline: Eliminar contacto en forma exitosa desde agenda de contactos
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <nombre>
    When presiona el boton eliminar contacto
    And presiona cancelar
    And visualiza mensaje Estás seguro de eliminar este contacto de tu lista?
    And confirma la eliminacion presionando boton Confirmar
    Then vuelve a la agenda y ya no visualiza el contacto <nombre>

    Examples:
      |    banco     | cuil        | cbu-cvu-alias             | nombre              | tipo cuenta                 | nickname    |
      | ICBC         | 23321289584 | 0150528301000110190124    | PETRONE MURIEL ELINA| Caja de Ahorro en pesos     | NICK NUEVO  |
  
   @Issue:BDSD-2105 @manual
  Scenario Outline: Toast por fallo al Eliminar contacto desde agenda de contactos
    Given el usuario selecciona Ver Agenda
    And selecciona contacto <contacto>
    When presiona el boton eliminar contacto
    And presiona cancelar
    And visualiza mensaje para confirmar la eliminación del contacto
    And confirma la eliminacion presionando boton Confirmar
    Then visualiza toast con mensaje de error

    Examples:
      | banco | cuil        | cbu-cvu-alias          | nombre               | tipo cuenta             | nickname   |
      | ICBC  | 23321289584 | 0150528301000110190124 | PETRONE MURIEL ELINA | Caja de Ahorro en pesos | NICK NUEVO |
