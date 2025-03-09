*** Settings ***
Documentation    Essa suíte testa o site Cadastrar Perfil de Usuário Inteligente
Library    SeleniumLibrary    
Resource    ../Resources/keywords.robot   
Test Setup    Abrir navegador
Test Teardown    Então o navegador é fechado

*** Test Cases ***    
Caso de teste 03 - Validação dos campos obrigatórios
    [Documentation]    Esse teste valida a obrigatoriedade do preenchimento nos campos:    
    ...                Nome, Data de Nascimento, Foto de Perfil, Prefêrencia de navegação, Idioma e Permissão.
    [Tags]    Campos_obrigatorios

#Campo obrigatório: Nome
    Dado que estou na tela Cadastrar Perfil
    E o campo "Nome Completo" está vazio
    Quando clico em "Finalizar Cadastro"
    Então o sistema exibe um modal com a mensagem "Preencha este campo" 

#Campo obrigatório: Data de Nascimento
    Dado que estou na tela Cadastrar Perfil
    E o campo "Nome Completo" foi preenchido com @Nome_Completo
    Quando clico em "Finalizar Cadastro"
    Então o sistema exibe um modal com a mensagem "Preencha este campo"

#Campo obrigatório Foto de Perfil
    Dado que estou na tela Cadastrar Perfil
    E o campo "Nome Completo" foi preenchido com @Nome_Completo
    E o campo "Data de Nascimento" foi preenchido com @Data_Nascimento
    Quando clico em "Finalizar Cadastro"
    Então o sistema exibe um modal com a mensagem "Selecione um arquivo"

#Campo obrigatório de permissão: Aceito a coleta de dados para análise personalizada 
    Dado que estou na tela Cadastrar Perfil
    E o campo "Nome Completo" foi preenchido com @Nome_Completo
    E o campo "Data de Nascimento" foi preenchido com @Data_Nascimento
    E um upload de imagem foi realizado no campo "Foto de Perfil"
    Quando clico em "Finalizar Cadastro"
    Então o sistema exibe um modal com a mensagem "Marque essa caixa se deseja continuar"
