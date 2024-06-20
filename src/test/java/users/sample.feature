Feature: Validar api regresin
  Scenario: validar obtener usuario
    Given url 'https://reqres.in/api/users/2'
    When  method GET
    And match response.data.first_name == 'Janet'
    Then status 200

  Scenario Outline: validar creacion de usuario metodo post
    Given url 'https://reqres.in/api/users'
    When request {"name": "#(name)","job": "#(job)"}
    And method POST
    Then status 201

    Examples:
    |name    |job       |
    |Carvajal|Futbolista|
    |Ramos   |Quimico   |
    |William |Mototaxi  |
    |Cucurell|Camionero |

  Scenario: validar creacion de usuario metodo post 2
    Given url 'https://reqres.in/api/users'
    When request
  """
{
    "name": "morpheus",
    "job": "leader"
}
  """
    And method POST
    Then status 201

  Scenario: validar eliminar usuario metodo delete
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204

  Scenario: validar metodo put
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "Edwin","job": "zion resident"}
    When method PUT
    Then status 200
    And match $.name == "Edwin"
