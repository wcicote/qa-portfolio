# language: pt

Feature: Autenticação SauceDemo
  Como usuário do sistema
  Quero realizar login na plataforma
  Para acessar o catálogo de produtos

  Background:
    Given que estou na página de login "https://www.saucedemo.com"
    And o sistema está disponível e responsivo

  Scenario: Login com credenciais válidas
    When insiro o usuário "standard_user"
    And insiro a senha "secret_sauce"
    And clico no botão "Login"
    Then devo ser redirecionado para a página de produtos "/inventory.html"

  Scenario: Login com senha incorreta
    When insiro o usuário "standard_user"
    And insiro a senha "senha_errada"
    And clico no botão "Login"
    Then devo ver a mensagem "Username and password do not match any user in this service"
    And permaneço na tela de login

  Scenario: Login com usuário bloqueado
    When insiro o usuário "locked_out_user"
    And insiro a senha "secret_sauce"
    And clico no botão "Login"
    Then devo ver a mensagem "Sorry, this user has been locked out."
    And o acesso é negado

  Scenario: Login com campos vazios
    When deixo o campo usuário em branco
    And deixo o campo senha em branco
    And clico no botão "Login"
    Then devo ver a mensagem de validação "Username is required."
    And o formulário não é submetido

  Scenario: Login com e-mail no campo usuário (boundary)
    When insiro "standard_user@teste.com" no campo usuário
    And insiro a senha "secret_sauce"
    And clico no botão "Login"
    Then devo ver mensagem de erro informando usuário inválido
    And o acesso é negado

  Scenario: Logout após autenticação
    Given que estou autenticado como "standard_user"
    And estou na página de produtos
    When clico no ícone de menu "≡"
    And clico em "Logout"
    Then a sessão é encerrada com sucesso
    And sou redirecionado para a tela de login "/"