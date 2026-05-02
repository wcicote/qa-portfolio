# language: pt

Feature: API ReqRes - Gerenciamento de Usuários
  Como testador de API
  Quero validar os endpoints de usuários do ReqRes
  Para garantir que o contrato REST está correto

  Background:
    Given que a API ReqRes está disponível em "https://reqres.in"
    And o header "Content-Type: application/json" está configurado

  Scenario: GET /users?page=1 — listar usuários paginados
    When envio uma requisição GET para "/api/users?page=1"
    Then o status code retornado é 200
    And o body contém "page": 1
    And o array "data" contém 6 usuários
    And cada usuário possui os campos: id, email, first_name, last_name, avatar

  Scenario: GET /users/2 — buscar usuário existente
    When envio uma requisição GET para "/api/users/2"
    Then o status code retornado é 200
    And o body contém objeto "data" com id 2
    And o campo "email" é "janet.weaver@reqres.in"

  Scenario: GET /users/999 — usuário inexistente (negativo)
    When envio uma requisição GET para "/api/users/999"
    Then o status code retornado é 404
    And o body retornado é um objeto vazio "{}"

  Scenario: POST /users — criar usuário com payload válido
    When envio uma requisição POST para "/api/users" com o body:
      """
      { "name": "Maria Souza", "job": "QA Engineer" }
      """
    Then o status code retornado é 201
    And o body contém os campos: name, job, id, createdAt

  Scenario: POST /users — criar usuário sem campo 'name' (negativo — BUG SCRUM-9)
    When envio uma requisição POST para "/api/users" com o body:
      """
      { "job": "QA Engineer" }
      """
    Then o status code esperado é 400
    And o body deveria conter mensagem de campo obrigatório
    But o status code retornado é 201
    And a API não valida a ausência do campo "name"

  Scenario: PUT /users/2 — atualizar usuário completo
    When envio uma requisição PUT para "/api/users/2" com o body:
      """
      { "name": "Janet Atualizada", "job": "Senior QA" }
      """
    Then o status code retornado é 200
    And o body contém "name": "Janet Atualizada", "job": "Senior QA"
    And o campo "updatedAt" está presente

  Scenario: PATCH /users/2 — atualizar campo parcial
    When envio uma requisição PATCH para "/api/users/2" com o body:
      """
      { "job": "Lead QA" }
      """
    Then o status code retornado é 200
    And o body contém "job": "Lead QA"
    And o campo "updatedAt" está presente

  Scenario: DELETE /users/2 — deletar usuário
    When envio uma requisição DELETE para "/api/users/2"
    Then o status code retornado é 204
    And o body da resposta é vazio