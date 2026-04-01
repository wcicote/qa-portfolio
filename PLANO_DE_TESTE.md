# 📋 Plano de Teste — Portfólio QA

**Projeto:** Portfólio de Testes Manuais  
**Autor:** Wesley Cicote  
**Versão:** 1.0  
**Data:** 2026-03-31  
**Status:** Concluído  

---

## 1. Objetivo

Validar as funcionalidades das aplicações **SauceDemo** e **ReqRes** por meio de testes manuais,
cobrindo fluxos funcionais, cenários negativos, limites de boundary e contratos de API REST,
com o objetivo de demonstrar domínio do ciclo completo de Quality Assurance.

---

## 2. Escopo

### ✅ Dentro do escopo

| Aplicação | URL | O que será testado |
|---|---|---|
| SauceDemo | https://www.saucedemo.com | Autenticação, Carrinho, Checkout, Ordenação, UI |
| ReqRes | https://reqres.in | Endpoints de Usuários e Autenticação (GET, POST, PUT, PATCH, DELETE) |

### ❌ Fora do escopo

- Testes automatizados (Selenium, Cypress, etc.)
- Testes de performance e carga
- Testes de segurança (Pentest)
- Demais páginas e funcionalidades não listadas nas suítes
- Testes em navegadores que não sejam o Chrome

---

## 3. Tipos de Teste Aplicados

| Tipo | Descrição | Onde foi aplicado |
|---|---|---|
| **Funcional** | Valida se o fluxo principal funciona conforme esperado | SauceDemo — Login, Carrinho, Checkout |
| **Negativo** | Valida o comportamento com dados inválidos ou ações inesperadas | SauceDemo e ReqRes |
| **Boundary** | Valida os limites do sistema (mínimo, máximo, extremos) | SauceDemo — campos e quantidade de produtos |
| **REST/API** | Valida endpoints HTTP: status code, body, headers e contratos | ReqRes — todos os endpoints |
| **Exploratório** | Testes sem script definido, baseados na percepção do testador | SauceDemo — identificação de anomalias visuais |
| **Regressão** | Reexecução de casos após correção de bugs para garantir que não reapareçam | TC-027 após correção do BUG SCRUM-5 |

---

## 4. Suítes e Distribuição de Casos

| Suite | Casos | Tipos Cobertos |
|---|---|---|
| SauceDemo – Autenticação | TC-001 a TC-006 (6 casos) | Funcional, Negativo, Boundary |
| SauceDemo – Carrinho & Checkout | TC-007 a TC-013 + TC-026 (8 casos) | Funcional, Negativo, Boundary, Regressão |
| ReqRes – API Usuários | TC-014 a TC-021 (8 casos) | REST, Negativo |
| ReqRes – API Autenticação | TC-022 a TC-025 (4 casos) | REST, Negativo |
| **Total** | **26 casos** | |

---

## 5. Ferramentas Utilizadas

| Ferramenta | Finalidade |
|---|---|
| **Google Sheets / Excel** | Gestão e documentação dos casos de teste |
| **Jira (Scrum)** | Rastreamento de bugs e gestão de sprints |
| **Postman / Insomnia** | Execução dos testes de API REST |
| **Chrome 146+** | Navegador utilizado para testes funcionais |
| **Google Drive** | Armazenamento das evidências (prints e vídeos) |
| **GitHub** | Versionamento e publicação do portfólio |

---

## 6. Critérios de Entrada

Os testes só devem ser iniciados quando:

- [ ] Ambiente de testes disponível e acessível (SauceDemo e ReqRes online)
- [ ] Todos os casos de teste documentados e revisados na planilha
- [ ] Ferramentas configuradas (Postman com endpoints importados)
- [ ] Acesso ao Jira para abertura de bugs
- [ ] Pasta de evidências criada e organizada

---

## 7. Critérios de Saída

Os testes serão considerados concluídos quando:

- [ ] 100% dos 26 casos executados (status diferente de "Não Iniciado")
- [ ] Todos os bugs encontrados registrados no Jira com evidência
- [ ] Casos de regressão executados após correções dos bugs
- [ ] Dashboard atualizado com o resultado final
- [ ] Evidências organizadas e linkadas na planilha

---

## 8. Critérios de Aprovação

| Métrica | Meta |
|---|---|
| Taxa de execução | 100% dos casos executados |
| Taxa de aprovação | ≥ 80% dos casos com status "Passou" |
| Bugs críticos abertos | 0 bugs com severidade Crítica sem resolução |
| Evidências | 100% dos casos com evidência anexada |

---

## 9. Gestão de Bugs

Todos os bugs encontrados seguem o fluxo abaixo:

```
Anomalia identificada durante execução
        ↓
[OBS] registrado no campo "Resultado Obtido" do caso
        ↓
Bug aberto no Jira com template padrão:
  - Ambiente
  - Pré-condições
  - Passos para reproduzir
  - Resultado Obtido vs Esperado
  - Evidência anexada
        ↓
Bug vinculado à Epic correspondente
        ↓
Caso de regressão criado na planilha
        ↓
Após correção: reexecução do caso → status "Passou" → bug fechado no Jira
```

### Template de Bug (Jira)

```
Ambiente: [URL] — [Browser e versão] / [Sistema Operacional]

Pré-condições: [O que precisa estar pronto]

Passos para reproduzir:
1. [Passo 1]
2. [Passo 2]
3. [Passo 3]

Resultado Obtido:
[O que aconteceu]

Resultado Esperado:
[O que deveria acontecer]

Evidência: [link do print/vídeo]
```

---

## 10. Riscos e Mitigações

| Risco | Probabilidade | Impacto | Mitigação |
|---|---|---|---|
| SauceDemo fora do ar | Baixa | Alto | Aguardar restabelecimento ou usar cache offline |
| ReqRes com instabilidade | Média | Alto | Retentar requisições; documentar comportamento |
| Dados de teste resetados | Baixa | Médio | Casos independentes, sem dependência de estado persistente |
| Comportamento diferente entre browsers | Média | Médio | Escopo limitado ao Chrome — documentar se testado em outro browser |

---

## 11. Epics no Jira

| Epic | ID | Descrição |
|---|---|---|
| Interface e Experiência do Usuário | SCRUM-6 | Bugs e melhorias relacionados à UI, textos e elementos visuais |
| Qualidade e Contratos de API | SCRUM-8 | Bugs e melhorias relacionados à Validações de endpoints HTTP: status code, body, headers e contratos |

---

## 12. Referências

- Casos de Teste: `casos-de-teste/QA_Portfolio_26casos_de_teste.xlsx`
- Evidências SauceDemo: `evidencias/saucedemo/`
- Evidências ReqRes: `evidencias/reqres/`
- Bugs registrados: Jira — Projeto SCRUM
