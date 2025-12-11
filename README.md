# Análise da Volatilidade de Preços e Inflação de Alimentos (IPCA)

Projeto de Business Intelligence desenvolvido para a disciplina de Sistemas de Apoio à Decisão (SAD), curso de Sistemas de Informação da UFRPE/UAST.

## O que é este projeto

Construímos uma solução completa de BI para entender como os preços dos alimentos variaram nas principais capitais brasileiras nos últimos dois anos (agosto de 2023 a agosto de 2025). Usamos dados reais do IBGE para responder perguntas práticas como:

- Qual categoria de alimentos (frutas, carnes, cereais) subiu mais de preço?
- A inflação foi maior em São Paulo ou Rio de Janeiro?
- Existe sazonalidade em produtos festivos como bacalhau e chocolate?
- Quais produtos mostram maior estabilidade de preço ao longo do tempo?

Os dados são do IPCA (Índice Nacional de Preços ao Consumidor Amplo), coletados mensalmente pelo IBGE nas dez principais regiões metropolitanas do Brasil.

## Tecnologias usadas

- **Fonte:** Tabela 7060 do SIDRA (IBGE)
- **Extração e transformação:** Pentaho Data Integration (PDI)
- **Banco de dados:** PostgreSQL
- **Visualização:** Microsoft Power BI
- **Modelagem:** Star Schema (esquema estrela)

## Como o projeto está organizado

| Pasta | O que tem |
| :--- | :--- |
| `dados/input/` | Dataset original do SIDRA em CSV |
| `dados/output/` | Arquivos tratados exportados do ETL |
| `etl/` | Fluxos de transformação do Pentaho (.ktr) |
| `sql/` | Scripts para criar as tabelas no PostgreSQL |
| `dashboard/` | Arquivo do Power BI com os painéis |
| `docs/` | Documentação completa em PDF e Dicionário de Dados |

## Como usar este projeto

1. **Configurar o banco de dados**
   - Crie um banco PostgreSQL
   - Execute os scripts da pasta `sql/`

2. **Rodar o ETL**
   - Abra os arquivos `.ktr` em `etl/` no Pentaho Data Integration
   - Configure a conexão com seu banco local
   - Execute na ordem: dimensões primeiro (tempo, local, produto), depois a tabela fato

3. **Carregar o dashboard**
   - Abra o arquivo `.pbix` da pasta `dashboard/` no Power BI
   - Aponte para seu banco PostgreSQL local
   - Atualize os dados

## O que o dashboard mostra

O painel responde seis consultas analíticas principais:

1. Variação mensal de preços por categoria de alimentos
2. Comparação de inflação entre regiões
3. Produtos que mais subiram e seu peso no IPCA
4. Subgrupos com maior estabilidade de preço
5. Padrões sazonais em produtos festivos
6. Regiões com maior deflação em hortaliças

## Estrutura do banco de dados

O Data Mart segue o modelo Star Schema com três dimensões e uma tabela fato:

- **dim_produto:** grupos, subgrupos e nomes dos alimentos
- **dim_local:** capitais analisadas
- **dim_tempo:** períodos mensais com ano, mês, trimestre e semestre
- **fato_ipca:** métricas de inflação (variação mensal, acumulada anual, acumulada 12 meses, peso)

## Autores

Jhonnata Carvalho Santos  
João Vitor Alcântara da Silva

Projeto acadêmico - UFRPE/UAST
