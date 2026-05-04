#!/usr/bin/env bash

ARQUIVO_LOG="apache.log"

# cria diretório com timestamp
DIR_SAIDA="log_analysis_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$DIR_SAIDA"

echo "Analisando logs..."

# 1. IPs únicos
awk '{print $1}' "$ARQUIVO_LOG" | sort | uniq > "$DIR_SAIDA/1_unique_ips.txt"

# 2. Métodos HTTP e contagem
awk -F\" '{print $2}' "$ARQUIVO_LOG" | awk '{print $1}' | sort | uniq -c | sort -nr > "$DIR_SAIDA/2_http_methods.txt"


# 6. Relatório consolidado
{
    echo "===== RELATÓRIO DE ANÁLISE DE LOG ====="
    echo "Data: $(date)"
    echo ""

    echo "Total de IPs únicos:"
    wc -l < "$DIR_SAIDA/1_unique_ips.txt"
    echo ""

    echo "Métodos HTTP mais usados:"
    head -5 "$DIR_SAIDA/2_http_methods.txt"
    echo ""


} > "$DIR_SAIDA/report.txt"

echo "Análise concluída! Resultados em: $DIR_SAIDA"