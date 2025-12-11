-- Script de criação do Data Mart (DDL)
-- Projeto: Análise IPCA e Volatilidade de Alimentos - UFRPE
-- Autores: Jhonnata Carvalho & João Vitor

-- 1. Criação da Dimensão Tempo
CREATE TABLE IF NOT EXISTS dim_tempo (
    cod_dim_tempo SERIAL PRIMARY KEY, 
    mes INTEGER NOT NULL,
    nome_mes TEXT NOT NULL,
    ano INTEGER NOT NULL,
    mes_ano TEXT NOT NULL,
    trimestre INTEGER NOT NULL,
    semestre INTEGER NOT NULL
);

-- 2. Criação da Dimensão Produto
CREATE TABLE IF NOT EXISTS dim_produto (
    cod_dim_produto SERIAL PRIMARY KEY,
    grupo TEXT NOT NULL,
    subgrupo TEXT NOT NULL,
    nome TEXT NOT NULL,
    codigo INTEGER NOT NULL
);

-- 3. Criação da Dimensão Local
CREATE TABLE IF NOT EXISTS dim_local (
    cod_dim_local SERIAL PRIMARY KEY, 
    cod_capital INTEGER NOT NULL,
    nome_capital TEXT NOT NULL
);

-- 4. Criação da Tabela Fato (IPCA)
-- Depende das chaves das 3 dimensões acima
CREATE TABLE IF NOT EXISTS fato_IPCA (
    cod_dim_produto INT NOT NULL,
    cod_dim_tempo INT NOT NULL,
    cod_dim_local INT NOT NULL,
    variacao_mensal NUMERIC(10, 4),
    variacao_acum_anual NUMERIC(10, 4),
    variacao_acum_12_meses NUMERIC(10, 4),
    peso_mensal NUMERIC(10, 4),

    CONSTRAINT fk_fato_produto FOREIGN KEY (cod_dim_produto) REFERENCES dim_produto (cod_dim_produto),
    CONSTRAINT fk_fato_tempo FOREIGN KEY (cod_dim_tempo) REFERENCES dim_tempo (cod_dim_tempo),
    CONSTRAINT fk_fato_local FOREIGN KEY (cod_dim_local) REFERENCES dim_local (cod_dim_local),

    CONSTRAINT pk_fato_ipca PRIMARY KEY (cod_dim_produto, cod_dim_tempo, cod_dim_local)
);