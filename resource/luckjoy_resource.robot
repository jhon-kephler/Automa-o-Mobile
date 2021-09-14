*** Settings ***

Library          AppiumLibrary
Resource         ./login.robot

*** Variables ***
###     MENU

${IP_CONFIG}          id=com.projeto.appob5piloto:id/btn_ip_conf
${ABRIR_CONTA}        id=com.projeto.appob5piloto:id/btn_apresentacao_abrir_conta
${JA_TENHO_CONTA}     id=com.projeto.appob5piloto:id/btn_tenho_conta

###     SET IP

${SET_IP}             id=com.projeto.appob5piloto:id/text_input_edit_ip
${SALVAR_BUTTON}      id=com.projeto.appob5piloto:id/btn_salvar
${VOLTAR}             xpath=//android.widget.ImageButton[@content-desc="Navigate up"]

###      LOGIN

${LOGIN_VIEW}         id=com.projeto.appob5piloto:id/cardView_login
${LOGIN_CPF}          id=com.projeto.appob5piloto:id/text_input_edit_cpf
${LOGIN_SENHA}        id=com.projeto.appob5piloto:id/text_input_edit_senha
${BUTTON_ENTRAR}      id=com.projeto.appob5piloto:id/btn_entrar_conta
${NOME_USER}          id=com.projeto.appob5piloto:id/txt_nome
${INICIAIS-USER}      id=com.projeto.appob5piloto:id/box_iniciais_nome
${CONTINUAR}          id=com.projeto.appob5piloto:id/icon_continuar

###       CRIANDO CONTA

${PROXIMA_ETAPA}      id=com.projeto.appob5piloto:id/btn_etapa
${SITUACAO_CAD}       id=com.projeto.appob5piloto:id/txt_inf_passo 

###        TIPO DE DOCUMENTO

${TIPO_DOC}           id=com.projeto.appob5piloto:id/auto_tipo_documento 
${RG_VERIFICADO}      id=com.projeto.appob5piloto:id/tv_rg
${CER_NASCIMENT}      id=com.projeto.appob5piloto:id/tv_certidao_nasc
${RNE_VERIFICADO}     id=com.projeto.appob5piloto:id/tv_rne 

###       PAÍS DE NASCIMENTO

${PAIS_NASCIMENT}     id=com.projeto.appob5piloto:id/auto_pais_nascimento

###       lOCAL DE NASCIMENTO

${LOCAL_NASCIMENT}    id=com.projeto.appob5piloto:id/auto_local_nascimento

*** Keywords ***

Abrindo o aplicativo
    Open Application   http://localhost:4725/wd/hub   
        ...  platformName=Android   
        ...  deviceName=device
        ...  appPackage=com.projeto.appob5piloto
        ...  appActivity=com.projeto.appob5piloto.view.MainActivity

Vericando pagina   
     Wait Until Page Contains Element     ${IP_CONFIG} 
     Wait Until Page Contains Element     ${ABRIR_CONTA}
     Wait Until Page Contains Element     ${JA_TENHO_CONTA}

Inserindo o ip
    Click Element                        ${IP_CONFIG}
    Input Text                           ${SET_IP}           192.95.42.16
    Click Element                        ${SALVAR_BUTTON}
    Click Element                        ${VOLTAR}

Entrando no app 
    Click Element                          ${JA_TENHO_CONTA}
    Wait Until Element Is Visible          ${LOGIN_VIEW}      
    Input Text                             ${LOGIN_CPF}                ${CPF_USUARIO} 
    Input Text                             ${LOGIN_SENHA}              ${SENHA_USUARIO}
    Click Element                          ${BUTTON_ENTRAR}
    Wait Until Page Contains Element       ${NOME_USER} 
    Wait Until Page Contains Element       ${INICIAIS-USER}
    Wait Until Page Contains Element       ${CONTINUAR} 

Dados pessoais
    Click Element                          ${CONTINUAR}
    Wait Until Page Contains Element       ${SITUACAO_CAD}      
    Click Element                          ${PROXIMA_ETAPA}
                 
Tipo do documento
    Click Element                          ${TIPO_DOC}    
    Wait Until Page Contains Element       ${RG_VERIFICADO}
    Wait Until Page Contains Element       ${CER_NASCIMENT}
    Wait Until Page Contains Element       ${RNE_VERIFICADO}
    Click Element                          ${RG_VERIFICADO}   

País de nascimento
    Click Element                          ${PAIS_NASCIMENT}   
 
Local de nascimento
    Click Element                          ${PAIS_NASCIMENT} 