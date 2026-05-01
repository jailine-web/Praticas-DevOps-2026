#!/usr/bin/env bash
# ------------------------------------------------------------------------#
# Script Name: Script_multifuncional
# Description: Script multifuncional para operações com arquivos
# Site: https://github.com/jailine-web/Praticas-DevOps-2026
# Written by: Jailine e Rondinele
# Maintenance: Jailine e Rondinele
# ------------------------------------------------------------------------#
#
# Usage: 
#	$ ./script_multifuncional.sh [opção] [argumentos]
#	$ ./script_multifuncional.sh --menu (para modo interativo)
#
# ------------------------------------------------------------------------ #

# Variaveis -------------------------------------------------------------- #
OPERACAO="$1"
ARG1="$2"
ARG2="$3"
opcao=0

# FUNCTIONS -------------------------------------------------------------- #

show_menu(){
    clear
    echo "======================================================="
    echo "        OPERAÇÕES DE ARQUIVO - Ferramentas DevOps"
    echo "======================================================="
    echo ""
    echo "1. Renomear arquivos"
    echo "2. Converter imagens (JPG to PNG)"
    echo "3. Comprimir arquivos/diretórios"
    echo "4. Extrair arquivos compactados"
    echo "5. Alterar permissões"
    echo "6. Buscar arquivos"
    echo "0. Sair"
    echo ""
    echo -n "Escolher uma opção: "
}

renomear(){
    local nome_antigo
    local nome_novo

    # modo linha de comando
    if [ -n "$ARG1" ] && [ -n "$ARG2" ]; then
        nome_antigo="$ARG1"
        nome_novo="$ARG2"
    else
        # modo interativo
        echo -n "Entre com o nome do arquivo antigo: "
        read nome_antigo

        echo -n "Entre com o nome do novo arquivo: "
        read nome_novo
    fi

    # execução
    if [ -f "$nome_antigo" ]; then
        mv "$nome_antigo" "$nome_novo"
        echo "Arquivo renomeado com sucesso!"
    else
        echo "Arquivo não encontrado!"
    fi
}

converter_imagens(){

    local imagem_antiga
    local imagem_nova

    if [ -n "$ARG1" ] && [ -n "$ARG2" ]; then
        imagem_antiga="$ARG1"
        imagem_nova="$ARG2"

    else
        echo -n "Insira a imagem que deseja converter (ex foto.png): "
        read imagem_antiga

        echo -n "Insira o nome da imagem que deseja como resultado (ex foto.jpg): "
        read imagem_nova

    fi

    if [ -f "$imagem_antiga" ]; then

    # verifica se magick está disponível no PATH
    if command -v magick >/dev/null 2>&1; then
        CMD="magick"
    else
        # fallback para caminho padrão no Windows (Git Bash)
        CMD="C:/Program Files/ImageMagick-7.1.2-Q16-HDRI/magick.exe"
    fi

    # executa conversão
    if "$CMD" "$imagem_antiga" "$imagem_nova"; then
        echo "Imagem convertida com sucesso! ✔"
    else
        echo "Erro na conversão!"
    fi

else 
    echo "Arquivo não encontrado!"
fi

}

# MAIN CODE -------------------------------------------------------------- #

if [ "$OPERACAO" = "--menu" ] || [ -z "$OPERACAO" ]; then
    while true; do
        show_menu
        read opcao

        case $opcao in
            1) renomear ;;
            2) converter_imagens ;;
            3) compress_files ;;
            4) extract_files ;;
            5) change_permissions ;;
            6) search_files ;;
            0) echo "Até logo!"; exit 0 ;;
            *) echo "Opção inválida" ;;
        esac

        echo ""
        echo -n "Pressione enter para continuar..."
        read
    done
else
    case "$OPERACAO" in
        "rename") renomear ;;
        "convert") converter_imagens ;;
        "compress") compress_files ;;
        "extract") extract_files ;;
        "chmod") change_permissions ;;
        "search") search_files ;;
        *) echo "Usage: $0 [--menu|rename|convert|compress|extract|chmod|search]" ;;
    esac
fi