# Nome do Projeto
Automação com Robot Framework: Cadastro de Usuário Inteligente

## 📌 Requisitos
- Python 3.x
- Robot Framework
- Library SeleniumLibrary  
- ChromeDriver

## 📝 Descrição
Este projeto implementa testes automatizados na tela **Cadastro de Usuário Inteligente**, validando diferentes cenários, como:
- Cadastro bem-sucedido de um novo usuário.
- Cancelamento do cadastro.
- Exibição de alertas para campos obrigatórios não preenchidos.
- Validação de entradas inválidas.


## 📂 Estrutura do projeto

```plaintext
/DesafioRobot
├── Aplicando_arguments/          
│   ├── cadastro_usuario_inteligente.robot  # Teste isolado que cadastra 3 usuários usando a função [Arguments]
├── Resources/                    
│   ├── keywords.robot  # Contém keywords e variáveis utilizadas nos testes
├── Test/  # Casos de testes automatizados
│   ├── cadastrar_usuario.robot
│   ├── campos_obrigatorios.robot
│   ├── cancelar_cadastro.robot
│   ├── data_invalida.robot
├── interactive_console_output.xml  # Saída interativa da execução
├── log.html  # Log detalhado da execução dos testes
├── output.xml  # Arquivo de saída do Robot Framework
├── report.html  # Relatório final dos testes
├── README.md  # Documentação do projeto
