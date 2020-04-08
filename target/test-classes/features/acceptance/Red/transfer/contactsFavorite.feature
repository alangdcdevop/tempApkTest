#language:en
@Issue:BDSD-2939
Feature: Agendar contactos nuevos

Yo como usuario
Quiero poder organizar contactos favoritos 
Para agilizar las transferencias y reducir los pasos
Criterios de aceptación:
Una vez que cuento con más de 4 contactos la agenda ya se divide en dos secciones favoritos y contactos.
Por default los primeros 4 contactos son los favoritos.
El siguiente contacto (un quinto) se fija como contacto. (Se agrupan de manera temporal)
Se pueda visualizar en la agenda el botón de organizar favorito. (Siempre y cuando cuente con al menos 5 contactos).
Pueda seleccionar como máximo 4 favoritos. Con toque. (De bajar un favorito en la home se debería visualizar el agregar contacto) → Este criterio no aplica, quedamos en no poner límites.
De tocar sobre un favorito baja a la lista de contactos
En la home debería quedar el botón de agregar favoritos. → Este criterio no aplica
Aquellos contactos que pongo en favoritos son lo que se visualizan en la home.
De eliminar un contacto que se encuentra dentro de favoritos en la home se deberá visualizar el agregar favorito.
Dicho botón me deberá llevar a la pantalla de organizar favoritos. De no tener contactos me deberá llevar al flujo de agregar contacto de manera manual.
AGREGAR LÓGICA DE CUANDO ELIMINA UN FAVORITO: BOTÓN DE LA HOME ME LLEVA AL MODO FAVORITEAR Y SINO TENGO CONTACTOS A AGREGAR CONTACTOS.
PONER LOS + Y -
HACERLO EN UNA SOLA PANTALLA

  Background: Ingresar en agenda
    Given el usuario ingresa a la pantalla de login
    And el usuario acepta los requisitos de identificacion
    And el usuario ingresa el correo Bdsolqe+int1@gmail.com
    And el usuario confirma el correo
    And accedo por magic link con mail bdsolqe@gmail.com y password Bdsol123
    And ingresa el passcode 663755
    And el usuario acepta terminos y condiciones
 #   And se visualiza la home
    And el usuario accede a transferencias
    And el usuario selecciona Ver Agenda
  
  @Issue:BDSD-558
  Scenario Outline: Selecciona un contacto favorito
    Given existe usuario <mail> y passcode <passcode> sin contactos en la agenda


        Examples:
      |     monto    | nombre              | banco                | ncuenta   | tcuenta                 | cuil        | cbu                     | mail | passcode |
      |     10       | VERGARA, LEONEL/    | HSBC BANK ARG. S.A   | 0596373553| Caja de Ahorro en pesos | 20121547652 | 1500009100005963735532  | Bdsolqe+int1@gmail.com | 663755 |    


  @Issue:BDSD-558 @WIP
  Scenario: Seleccionar contacto favorito en agenda con no mas de 3 favoritos

  @Issue:BDSD-558 @WIP
  Scenario: Seleccionar contacto favorito en agenda con 4 favoritos elegidos