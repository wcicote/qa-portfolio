# language: pt

Feature: Carrinho e Checkout SauceDemo
  Como usuário autenticado
  Quero gerenciar produtos no carrinho e finalizar compras
  Para concluir pedidos na plataforma

  Background:
    Given que estou autenticado como "standard_user"
    And estou na página de produtos

  Scenario: Adicionar produto ao carrinho
    When clico em "Add to cart" no produto "Sauce Labs Backpack"
    Then o botão muda para "Remove"
    And o ícone do carrinho exibe badge com o número "1"

  Scenario: Remover produto do carrinho
    Given que o produto "Sauce Labs Backpack" está no carrinho
    When clico no botão "Remove" ao lado do produto
    Then o botão volta para "Add to cart"
    And o badge do carrinho é removido

  Scenario: Checkout completo com dados válidos
    Given que há ao menos 1 produto no carrinho
    When clico no ícone do carrinho
    And clico em "Checkout"
    And preencho First Name com "João"
    And preencho Last Name com "Silva"
    And preencho Zip Code com "01310-100"
    And clico em "Continue"
    And clico em "Finish"
    Then o pedido é concluído com sucesso
    And devo ver a mensagem "Thank you for your order!"
    And o carrinho é esvaziado

  Scenario: Checkout sem preencher First Name
    Given que há ao menos 1 produto no carrinho
    And estou na tela de informações do checkout
    When deixo o campo First Name em branco
    And preencho Last Name com "Silva"
    And preencho Zip Code com "01310-100"
    And clico em "Continue"
    Then devo ver a mensagem "First Name is required."
    And o formulário não avança

  Scenario: Checkout sem preencher CEP
    Given que há ao menos 1 produto no carrinho
    And estou na tela de informações do checkout
    When preencho First Name com "João"
    And preencho Last Name com "Silva"
    And deixo o campo Zip Code em branco
    And clico em "Continue"
    Then devo ver a mensagem "Postal Code is required."
    And o formulário não avança

  Scenario: Ordenação de produtos por nome e preço
    When seleciono a ordenação "Name (Z to A)"
    Then os produtos são reordenados de Z a A
    When seleciono a ordenação "Price (low to high)"
    Then os produtos são reordenados do menor para o maior preço
    When seleciono a ordenação "Price (high to low)"
    Then os produtos são reordenados do maior para o menor preço

  Scenario: Adicionar todos os produtos ao carrinho (boundary)
    When clico em "Add to cart" em todos os 6 produtos disponíveis
    Then o badge do carrinho exibe "6"
    And o carrinho lista todos os 6 produtos com seus respectivos preços

  Scenario: Validar nomes e descrições dos produtos no catálogo (exploratório)
    When verifico os nomes e descrições de todos os produtos na página
    Then todos os produtos devem ter nomes claros em linguagem comercial
    And nenhuma descrição deve conter sintaxe de código inesperada