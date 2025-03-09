*** Settings ***
Documentation    Essa suíte testa o site Cadastrar Perfil de Usuário Inteligente
Library    SeleniumLibrary    
Resource    ../Resources/keywords.robot      
Test Setup    Abrir navegador
Test Teardown    Então o navegador é fechado

*** Test Cases ***    
Caso de teste 02 - Cancelar um cadastro de perfil
    [Documentation]    Esse teste preenche os campos para cadastrar perfil e cancela o processo
    [Tags]   Cancelar_cadastro
    Dado que estou na tela Cadastrar Perfil
    Quando preencho o campo "Nome Completo" com @Nome_Completo
    E preencho o campo "Data Nascimento" com @Data_Nascimento
    E forneço uma @Impressao_Digital válida no campo “Impressão Digital”
    E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"
    E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"
    E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"
    E seleciono a checkbox no campo “Aceito a coleta de dados para análise personalizada” por fim
    E clico em "Cancelar"
    Então o cadastro é cancelado e a página fechada

