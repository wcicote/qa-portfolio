# 📋 Portfólio QA — Testes de Software

Projeto de testes manuais desenvolvido para portfólio,
cobrindo testes funcionais, exploratórios, negativos e de regressão.

## 🌐 Aplicações Testadas
- **SauceDemo** — https://www.saucedemo.com (testes funcionais e UI)
- **ReqRes** — https://reqres.in (testes de API REST)

## 🗂️ Estrutura do Projeto
- `casos-de-teste/` — Planilha com os 26 casos documentados
- `evidencias/saucedemo/` — Prints dos testes funcionais
- `evidencias/reqres/` — Prints dos testes de API
- `features/` — Cenários de teste em Gherkin (BDD) — Given/When/Then
- `bug-report/` — Evidências dos bugs registrados (SCRUM-7 e SCRUM-9)
- `PLANO_DE_TESTE.md` — Plano de testes com escopo, critérios e estratégia de testes

## ✅ Cobertura de Testes
| Suite | Casos | Tipo |
|---|---|---|
| SauceDemo – Autenticação | 6  | Funcional, Negativo, Boundary |
| SauceDemo – Carrinho & Checkout | 8 | Funcional, Negativo, Boundary |
| ReqRes – API Usuários | 8 | REST, Negativo |
| ReqRes – API Autenticação | 4 | REST, Negativo |

## 🐛 Bugs Registrados
| Bug ID | Suite | Severidade | Status |
|---|---|---|---|
| SCRUM-7 | SauceDemo – Carrinho & Checkout | Baixa | Documentado |
| SCRUM-9 | ReqRes – API Usuários | Alta | Documentado |

## 📄 Cenários Gherkin (BDD)
Cenários escritos em Gherkin cobrindo os principais fluxos testados:
- `saucedemo_autenticacao.feature` — 6 cenários
- `saucedemo_carrinho_checkout.feature` — 8 cenários
- `reqres_api_usuarios.feature` — 8 cenários
- `reqres_api_autenticacao.feature` — 4 cenários

## 🛠️ Ferramentas Utilizadas
- **Postman** — Testes de API REST (GET, POST, PUT, PATCH, DELETE)
- **Jira (Scrum)** — Rastreamento e documentação de bugs
- **Gherkin (BDD)** — Cenários de teste estruturados (Given/When/Then)
- **Excel** — Gestão e documentação dos casos de teste

## 👤 Autor
Wesley Cicote