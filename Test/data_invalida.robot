*** Settings ***
Documentation    Essa suíte testa o site Cadastrar Perfil de Usuário Inteligente
Library    SeleniumLibrary    
Resource    ../Resources/keywords.robot      
Test Setup    Abrir navegador
Test Teardown    Então o navegador é fechado
    
*** Test Cases ***    
Caso de teste 04 - Cancelar um cadastro de perfil
    [Documentation]    Esse test case é aplicado para validar o preenchimento no campo de Data Nascimento
    [Tags]   Data_incorreta
    Dado que estou na tela Cadastrar Perfil    
    Quando preencho o campo "Nome Completo" com @Nome_Completo
    E forneço uma @Impressao_Digital válida no campo “Impressão Digital”
    E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"
    E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"
    E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"
    E seleciono a checkbox referente ao campo "Aceito a coleta de dados para análise personalizada"
    E preencho o campo "Data Nascimento" com um valor indevido para o formato
    E clico em “Finalizar Cadastro”
    Então a tela apresenta o alerta "Insira um valor válido. O campo está incompleto ou tem uma data inválida." 
    