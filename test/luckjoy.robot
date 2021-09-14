*** Settings ***

Resource    ../resource/luckjoy_resource.robot


*** Test Cases ***

Localizando e abrindo o apk
    Abrindo o aplicativo
    Vericando pagina

Logando no app
    Inserindo o ip
    Vericando pagina
    Entrando no app 
    

Completar cadastro
    Dados pessoais
    Tipo do documento
    País de nascimento
    Local de nascimento