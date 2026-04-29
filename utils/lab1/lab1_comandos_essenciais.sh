#!/usr/bin/env bash
# ------------------------------------------------------------------------------------------------ #
# Script Name:  essential_commands.sh
# Description:    Demonstrates essential DevOps commands
# Site:                https://github.com/jailine-web
# Written by:     Jailine Almeida
# Maintenance: Jailine Almeida
# -------------------------------------------------------------------------------------------------- #
# Usage:
#       $ ./essential_commands.sh
# -------------------------------------------------------------------------------------------------- #
# Repository:
#       Path: utils/essential_commands.sh
# -------------------------------------------------------------------------------------------------- #
# History:
#        v1.0 22/04/2026 - Jailine Almeida:
#           - Initial version
# --------------------------------------------------------------------------------------------------- #

# Variables ----------------------------------------------------------------------------------------- #
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

# Functions ----------------------------------------------------------------------------------------- #

print_section() {
    echo -e "${BLUE}==================================================${NC}"
    echo -e "${GREEN}$1${NC}"
    echo -e "${BLUE}==================================================${NC}"
}

print_command() {
    echo -e "${YELLOW}$ $1${NC}"
}

# Main Code -------------------------------------------------------------------------------------------------- #

clear
print_section "ESSENTIAL DEVOPS COMMANDS DEMO"
echo ""

# 1. pwd
print_section "1. pwd - Print Working Directory"
print_command "pwd"
echo "   Descrição: Mostra o diretório atual"
echo "   Help: pwd --help"
echo "   Exemplo:"
echo "   Diretório atual: $(pwd)"
echo ""

# 2. date
print_section "2. date - Display date and time"
print_command "date"
echo "   Descrição: Exibe ou define data e hora do sistema"
echo "   Help: date --help"
echo "   Exemplo:"
echo "   Data atual: $(date)"
echo "   Data formatada: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# 3. touch
print_section "3. touch - Cria um arquivo vazio"
print_command "touch arquivo_exemplo.txt"
echo "   Descrição: Cria arquivos vazios ou atualiza timestamp"
echo "   Help: touch --help"
touch arquivo_exemplo.txt
echo "   Exemplo: arquivo_exemplo.txt criado"
echo ""

# 4. cat
print_section "4. cat - Concatena e exibe um arquivo"
print_command "cat arquivo_exemplo.txt"
echo "   Descrição: Exibe conteúdo de arquivos"
echo "   Help: cat --help"
echo "Conteúdo de teste" > arquivo_exemplo.txt
echo "   Exemplo:"
cat arquivo_exemplo.txt
echo ""

# 5. grep
print_section "5. grep - Realiza buscas em textos"
print_command "grep 'teste' arquivo_exemplo.txt"
echo "   Descrição: Busca padrões em arquivos"
echo "   Help: grep --help"
echo "linha de teste" >> arquivo_exemplo.txt
echo "outra linha" >> arquivo_exemplo.txt
echo "   Exemplo:"
grep "teste" arquivo_exemplo.txt
echo ""

# 6. curl
print_section "6. curl - Transfere dados"
print_command "curl https://api.github.com"
echo "   Descrição: Faz requisições HTTP"
echo "   Help: curl --help"
echo "   Exemplo:"
curl -s https://api.github.com | head -n 3
echo ""

# 7. gzip
print_section "7. gzip - Compacta arquivos"
print_command "gzip arquivo_exemplo.txt"
echo "   Descrição: Compacta arquivos"
echo "   Help: gzip --help"
cp arquivo_exemplo.txt arquivo_gzip.txt
gzip -k arquivo_gzip.txt
echo "   Exemplo: arquivo_gzip.txt.gz criado"
echo ""

# 8. chmod
print_section "8. chmod - Altera as permissões de um arquivo"
print_command "chmod +x arquivo_exemplo.txt"
echo "   Descrição: Altera permissões de arquivos"
echo "   Help: chmod --help"
chmod +x arquivo_exemplo.txt
echo "   Exemplo: permissão de execução adicionada"
echo ""

# 9. pgrep
print_section "9. pgrep - Encontra o ID do processo"
print_command "pgrep bash"
echo "   Descrição: Busca processos pelo nome"
echo "   Help: pgrep --help"
echo "   Exemplo:"
pgrep bash | head -n 3
echo ""

# 10. ps
print_section "10. ps - Lista os Status do processo"
print_command "ps aux"
echo "   Descrição: Lista processos em execução"
echo "   Help: ps --help"
echo "   Exemplo:"
ps aux | head -n 5
echo ""

# 11. df
print_section "11. df - Mostra o quanto o disco está livre"
print_command "df -h"
echo "   Descrição: Mostra uso de disco"
echo "   Help: df --help"
echo "   Exemplo:"
df -h | head -n 5
echo ""

# 12. du
print_section "12. du - Uso de disco"
print_command "du -sh ."
echo "   Descrição: Mostra uso de espaço por diretório"
echo "   Help: du --help"
echo "   Exemplo:"
du -sh .
echo ""

echo "   Descrição: Remove arquivos temporários criados durante a execução do script"
echo "   Help: rm --help"
echo "   Exemplo:"
rm -f arquivo_exemplo.txt arquivo_gzip.txt arquivo_gzip.txt.gz
echo "   Arquivos temporários removidos"
echo ""

# --------------------------------------------------------------------------------------------------------------------- #
# END #
