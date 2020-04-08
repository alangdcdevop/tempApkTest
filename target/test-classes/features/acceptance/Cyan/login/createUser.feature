# language: en
@Cyan
Feature: Keycloak User creation

  @CreateUser

  Scenario Outline: Dar de alta un usuario en keycloak y peoplehub
    Given existe el usuario con mail <mail>, coreId <coreId>, primer nombre <nombre>, apellido <apellido>, fecha de nacimiento 19/05/92, DNI <dni>, CUIL <cuil>, altura de calle 1288, codigo postal <codigoPostal>, passcode 192837

    Examples:

  | mail                              | coreId | nombre   | apellido | dni      | cuil        | codigoPostal |
  | BDSOLQE+pruebasandra123@GMAIL.COM | 100252 | FERNANDA | MONTERO  | 37799573 | 27384995735 | 1076         |

