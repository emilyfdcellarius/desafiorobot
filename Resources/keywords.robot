*** Settings ***
Documentation    Essa suíte contém as keywords do site
Library    SeleniumLibrary    

*** Variables ***
#Elementos da página
${URL}    file:///C:/Users/Emily/Downloads/Cadastrar%20Perfil%20de%20Usu%C3%A1rio%20Inteligente%20%20(1).html
${Campo_Nome}    id=nome 
${Campo_Data_Nascimento}    id=dataNascimento
${Campo_Impressao_Digital}    id=impressao-digital
${Escolher_Arquivo}    id=fotoPerfil
${Campo_Preferencia_Idioma}    id=idioma
${Campo_Nivel_Privacidade}    id=privacidade
${Checkbox_Consentimento_Coleta_De_Dados}    id=consentimento
${Botao_Finalizar_Cadastro}    xpath=//button[contains(@class, 'btn-submit')]
${Botão_cancelar}    xpath=//button[contains(@class, 'btn-cancel')]

#Elementos de entrada
${Nome}    Emily Fernanda Domingues Cellarius 
${Data_Nascimento}    02/02/2000 
${Data_Nascimento_Incorreta}    9
${Impressao_Digital_Realizada}    id=impressao-digital-text
${Foto_De_Perfil}    C:/Users/Emily/OneDrive/Pictures/Screenshots/Captura de tela 2025-03-02 115734.png
${Idioma_Valor}    fr
${Nivel_Privacidade_Valor}    alto
#${Campo_Vazio} (Achei que pra uma string vazia eu precisava criar uma keyword sem escrever nada kkkkk)

*** Keywords *** 
#Test Case 01
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window    

Dado que estou na tela Cadastrar Perfil 
    Go To    url=${URL}    
    Wait Until Page Contains    text=Cadastrar Perfil de Usuário Inteligente
    #Wait Until Element Is Visible    locator=${Menu} 
Quando preencho o campo "Nome Completo" com @Nome_Completo 
    Input Text    ${Campo_Nome}    text=${Nome}
E preencho o campo "Data Nascimento" com @Data_Nascimento
    Input Text    ${Campo_Data_Nascimento}    text=${Data_Nascimento} 
E forneço uma @Impressao_Digital válida no campo “Impressão Digital”
    Click Element    ${Campo_Impressao_Digital}
    Wait Until Element Is Visible    locator=${Impressao_Digital_Realizada}   
E realizo o upload de uma imagem com a opção @Escolher_Arquivo no campo "Escolher Arquivo"
    Choose File    ${Escolher_Arquivo}    ${Foto_De_Perfil}
E seleciono a opção @Francês no dropdown de sugestões do campo "Preferência de Idioma"
    Select From List By Value   ${Campo_Preferencia_Idioma}    ${Idioma_Valor} 
E seleciono a opção @Alto no dropdown de sugestões do campo "Nível de Privacidade"
    Select From List By Value   ${Campo_Nivel_Privacidade}    ${Nivel_Privacidade_Valor}
E seleciono a checkbox no campo "Aceito a coleta de dados para análise personalizada"
    Select Checkbox    ${Checkbox_Consentimento_Coleta_De_Dados}
    Set Window Size    1920    1100
    Capture Page Screenshot
E clico em “Finalizar Cadastro”
    Click Element    ${Botao_Finalizar_Cadastro} 
    # Set Window Size    1920    1100 (Não consegui printar aqui porque ele evidencia a tela vazio pois recarrega após finalizar)
    # Capture Page Screenshot
Então o cadastro é concluído e a página recarrega
    Set Window Size    1920    1100
    Capture Page Screenshot    

#Test Case 02     

E seleciono a checkbox no campo “Aceito a coleta de dados para análise personalizada” por fim
    Select Checkbox    ${Checkbox_Consentimento_Coleta_De_Dados}     #Precisei incluir uma validação aqui pro Test Case dois só para não gerar dois prints
E clico em "Cancelar"
    Click Element     ${Botão_cancelar}
    Wait Until Page Does Not Contain    text=Cadastrar Perfil de Usuário Inteligente

Então o cadastro é cancelado e a página fechada
    Capture Page Screenshot

#Test Case 03 
#Campo obrigatório: Nome
E o campo "Nome Completo" está vazio
    ${campo_nome_valor}    Get Value    ${Campo_Nome}
    Should Be Equal    ${campo_nome_valor}    ${EMPTY}  
Quando clico em "Finalizar Cadastro"
    Click Element    ${Botao_Finalizar_Cadastro}
Então o sistema exibe um modal com a mensagem "Preencha este campo"
    Element Should Be Visible    css=input:invalid  
    Set Window Size    1920    1100
    Capture Page Screenshot
  
#Campo obrigatório: Data de Nascimento
E o campo "Nome Completo" foi preenchido com @Nome_Completo
    Input Text    ${Campo_Nome}    text=${Nome}

#Campo obrigatório Foto de Perfil
E o campo "Data de Nascimento" foi preenchido com @Data_Nascimento
    Input Text    ${Campo_Data_Nascimento}    text=${Data_Nascimento} 
Então o sistema exibe um modal com a mensagem "Selecione um arquivo"
    Element Should Be Visible    css=input:invalid  
    Set Window Size    1920    1100
    Capture Page Screenshot

#Campo obrigatório de permissão: Aceito a coleta de dados para análise personalizada 
E um upload de imagem foi realizado no campo "Foto de Perfil"
    Choose File    ${Escolher_Arquivo}    ${Foto_De_Perfil}
Então o sistema exibe um modal com a mensagem "Marque essa caixa se deseja continuar"
    Element Should Be Visible    css=input:invalid  
    Set Window Size    1920    1100
    Capture Page Screenshot

#Test Case 04
E seleciono a checkbox referente ao campo "Aceito a coleta de dados para análise personalizada"
    Select Checkbox    ${Checkbox_Consentimento_Coleta_De_Dados}
E preencho o campo "Data Nascimento" com um valor indevido para o formato
    Input Text    ${Campo_Data_Nascimento}    text=${Data_Nascimento_Incorreta}
Então a tela apresenta o alerta "Insira um valor válido. O campo está incompleto ou tem uma data inválida." 
    Element Should Be Visible    css=input:invalid  
    Capture Page Screenshot    


Então o navegador é fechado
    Close Browser 