*** Settings ***
Documentation    Essa suíte testa o site Cadastrar Perfil de Usuário Inteligente utilizando a função [Arguments]
Library    SeleniumLibrary        
Test Setup    Abrir navegador
Test Teardown    Então o cadastro é concluído 

*** Variables ***
#Test case 01
${Nome}    Killua 
${Data_Nascimento}    07/08/1987
${Foto_Perfil}    C:\\Users\\emilycellarius\\desafiorobot\\imagens\\foto.jpg
${Idioma}    fr
${Nivel_Privacidade}    alto

#Test case 02
${Nome_Dois}   Gon
${Data_Nascimento_Dois}    05/06/1987
${Foto_Perfil_Dois}    C:\\Users\\emilycellarius\\desafiorobot\\imagens\\foto.jpg
${Idioma_Dois}    pt
${Nivel_Privacidade_Dois}    medio

#Test case 03
${Nome_Tres}    Leorio
${Data_Nascimento_Tres}    04/05/1982   
${Foto_Perfil_Tres}   C:\\Users\\emilycellarius\\desafiorobot\\imagens\\foto.jpg
${Idioma_Tres}    es
${Nivel_Privacidade_Tres}    padrao

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window  
Dado que estou na tela Cadastrar Perfil
    Go To    url= https://desafio-equipe.vercel.app/  
    Wait Until Page Contains    text=Cadastrar Perfil de Usuário Inteligente 
Quando preencho o campo "Nome Completo" com @Nome_Completo 
    [Arguments]    ${Nome}     
    Input Text    id=nome    ${Nome}

E preencho o campo "Data Nascimento" com @Data_Nascimento
    [Arguments]    ${Data_Nascimento}   
    Input Text    id=dataNascimento    text=${Data_Nascimento} 

E forneço uma @Impressao_Digital válida no campo “Impressão Digital”
    Click Element    id=impressao-digital
    Wait Until Element Is Visible   id=impressao-digital-text 
E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"
    [Arguments]    ${Foto_Perfil}     
    Choose File    id=fotoPerfil    file_path=${Foto_Perfil}

E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"
    [Arguments]    ${Idioma}   
    Select From List By Value  id=idioma    ${Idioma} 

E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"
    [Arguments]    ${Nivel_Privacidade}    
    Select From List By Value   id=privacidade    ${Nivel_Privacidade}

E seleciono a checkbox no campo "Aceito a coleta de dados para análise personalizada"
    Select Checkbox   id=consentimento
    Set Window Size    1920    1100
    Capture Page Screenshot
E clico em “Finalizar Cadastro”
    Click Element     xpath=//button[contains(@class, 'btn-submit')] 
Então o cadastro é concluído 
    Close Browser

*** Test Cases ***
Caso de teste 01 - Cadastro Perfil de Usuário Inteligente do Killua
    [Documentation]    Esse teste realiza o cadastro de um usuário 
    [Tags]    Cadastro_perfil
    Dado que estou na tela Cadastrar Perfil    
    Quando preencho o campo "Nome Completo" com @Nome_Completo    ${Nome}    
    E preencho o campo "Data Nascimento" com @Data_Nascimento    ${Data_Nascimento}   
    E forneço uma @Impressao_Digital válida no campo “Impressão Digital”  
    E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"    ${Foto_Perfil}     
    E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"    ${Idioma}    
    E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"    ${Nivel_Privacidade}    
    E seleciono a checkbox no campo "Aceito a coleta de dados para análise personalizada"
    E clico em “Finalizar Cadastro”
    Então o cadastro é concluído

 Caso de teste 02 - Cadastro Perfil de Usuário Inteligente do Gon
     [Documentation]    Esse teste realiza o cadastro de um usuário 
     [Tags]    Cadastro_perfil
     Dado que estou na tela Cadastrar Perfil    
     Quando preencho o campo "Nome Completo" com @Nome_Completo     ${Nome_Dois}    
     E preencho o campo "Data Nascimento" com @Data_Nascimento       ${Data_Nascimento_Dois}
     E forneço uma @Impressao_Digital válida no campo “Impressão Digital”  
     E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"        ${Foto_Perfil_Dois}
     E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"      ${Idioma_Dois}
     E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"       ${Nivel_Privacidade_Dois}
     E seleciono a checkbox no campo "Aceito a coleta de dados para análise personalizada"
     E clico em “Finalizar Cadastro”
     Então o cadastro é concluído

 Caso de teste 03 - Cadastro Perfil de Usuário Inteligente do Leorio
     [Documentation]    Esse teste realiza o cadastro de um usuário 
     [Tags]    Cadastro_perfil
     Dado que estou na tela Cadastrar Perfil    
     Quando preencho o campo "Nome Completo" com @Nome_Completo     ${Nome_Tres}    
     E preencho o campo "Data Nascimento" com @Data_Nascimento       ${Data_Nascimento_Tres}
     E forneço uma @Impressao_Digital válida no campo “Impressão Digital”  
     E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"        ${Foto_Perfil_Tres}
     E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"      ${Idioma_Tres}
     E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"       ${Nivel_Privacidade_Tres}
     E seleciono a checkbox no campo "Aceito a coleta de dados para análise personalizada"
     E clico em “Finalizar Cadastro”
     Então o cadastro é concluído