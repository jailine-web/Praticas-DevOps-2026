#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   file_operations.sh
# Description:   Multi-functional file operations script
# Written by:    JAILINE_RONDINELE
# Maintenance:   JAILINE_RONDINELE
# ------------------------------------------------------------------------ #

# VARIABLES --------------------------------------------------------------- #
OPERATION="$1"
ARG1="$2"
ARG2="$3"

# FUNCTIONS --------------------------------------------------------------- #

show_menu() {
    clear
    echo "=========================================="
    echo "     FILE OPERATIONS - DevOps Tools"
    echo "=========================================="
    echo ""
    echo "1. Rename files (add prefix/suffix)"
    echo "2. Convert images (JPG to PNG)"
    echo "3. Compress files/directories"
    echo "4. Extract compressed files"
    echo "5. Change file permissions"
    echo "6. Search files by pattern"
    echo "0. Exit"
    echo ""
    echo -n "Choose an option: "
}

# 1. Renomear arquivos
rename_files() {
    read -p "Enter file extension (ex: txt): " ext
    read -p "Enter prefix: " prefix

    for file in *.$ext; do
        [ -f "$file" ] || continue
        mv "$file" "${prefix}_$file"
    done

    echo "Files renamed successfully!"
}

# 2. Converter imagens JPG → PNG
convert_images() {
    read -p "Enter directory (default .): " dir
    dir=${dir:-.}

    for img in "$dir"/*.jpg; do
        [ -f "$img" ] || continue
        convert "$img" "${img%.jpg}.png"
    done

    echo "Conversion completed!"
}

# 3. Compactar arquivos
compress_files() {
    read -p "Enter output file name (ex: backup.tar.gz): " output
    read -p "Enter files or directory: " target

    tar -czf "$output" $target

    echo "Compression completed!"
}

# 4. Extrair arquivos
extract_files() {
    read -p "Enter file to extract: " file

    if [[ "$file" == *.tar.gz ]]; then
        tar -xzf "$file"
    elif [[ "$file" == *.zip ]]; then
        unzip "$file"
    else
        echo "Unsupported format"
    fi

    echo "Extraction completed!"
}

# 5. Alterar permissões
change_permissions() {
    read -p "Enter file: " file
    read -p "Enter permission (ex: 755): " perm

    chmod "$perm" "$file"

    echo "Permission updated!"
}

# 6. Buscar arquivos
search_files() {
    read -p "Enter search pattern: " pattern

    find . -name "*$pattern*"

    echo "Search completed!"
}

# MAIN CODE --------------------------------------------------------------- #

if [ "$OPERATION" = "--menu" ] || [ -z "$OPERATION" ]; then
    while true; do
        show_menu
        read option
        
        case $option in
            1) rename_files ;;
            2) convert_images ;;
            3) compress_files ;;
            4) extract_files ;;
            5) change_permissions ;;
            6) search_files ;;
            0) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid option" ;;
        esac
        
        echo ""
        echo -n "Press Enter to continue..."
        read
    done
else
    case "$OPERATION" in
        "rename") rename_files ;;
        "convert") convert_images ;;
        "compress") compress_files ;;
        "extract") extract_files ;;
        "chmod") change_permissions ;;
        "search") search_files ;;
        *) echo "Usage: $0 [--menu|rename|convert|compress|extract|chmod|search]" ;;
    esac
fi
