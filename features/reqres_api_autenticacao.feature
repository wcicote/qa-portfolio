# language: pt

Feature: API ReqRes - Autenticação e Registro
  Como testador de API
  Quero validar os endpoints de login e registro do ReqRes
  Para garantir a segurança e integridade do fluxo de autenticação

  Background:
    Given que a API ReqRes está disponível em "https://reqres.in"

  Scenario: POST /login — autenticação com credenciais válidas
    When envio uma requisição POST para "/api/login" com o body:
      """
      { "email": "eve.holt@reqres.in", "password": "cityslicka" }
      """
    Then o status code retornado é 200
    And o body contém o campo "token" com valor não nulo

  Scenario: POST /login — sem campo 'password' (negativo)
    When envio uma requisição POST para "/api/login" com o body:
      """
      { "email": "eve.holt@reqres.in" }
      """
    Then o status code retornado é 400
    And o body contém: { "error": "Missing password" }

  Scenario: POST /register — registro com dados válidos
    When envio uma requisição POST para "/api/register" com o body:
      """
      { "email": "eve.holt@reqres.in", "password": "pistol" }
      """
    Then o status code retornado é 200
    And o body contém os campos "id" e "token" com valores não nulos

  Scenario: POST /register — sem campo 'email' (negativo)
    When envio uma requisição POST para "/api/register" com o body:
      """
      { "password": "pistol" }
      """
    Then o status code retornado é 400
    And o body contém: { "error": "Missing email or username" }