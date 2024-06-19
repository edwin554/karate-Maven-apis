Feature: Validar api regresin
  Scenario: validar obtener usuario
    Given url 'https://reqres.in/api/users/2'
    When  method GET
    And match response.data.first_name == 'Janet'
    Then status 200

  Scenario: validar creacion de usuario metodo post
    Given url 'https://reqres.in/api/users'
    When request {"name": "Edwin","job": "leader"}
    And method POST
    Then status 201
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