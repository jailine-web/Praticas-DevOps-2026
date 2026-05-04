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

# 3. Métodos perigosos (DELETE e PUT)
grep -E '"(DELETE|PUT)' "$ARQUIVO_LOG" > "$DIR_SAIDA/3_dangerous_methods.txt"

# 4. URLs e contagem
awk -F\" '{print $2}' "$ARQUIVO_LOG" | awk '{print $2}' | sort | uniq -c | sort -nr > "$DIR_SAIDA/4_urls.txt"

# 5. Top 10 IPs
awk '{print $1}' "$ARQUIVO_LOG" | sort | uniq -c | sort -nr | head -10 > "$DIR_SAIDA/5_top_ips.txt"


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

    echo "Requisições perigosas (DELETE/PUT):"
    wc -l < "$DIR_SAIDA/3_dangerous_methods.txt"
    echo ""

    echo "Top 5 URLs acessadas:"
    head -5 "$DIR_SAIDA/4_urls.txt"
    echo ""

    echo "Top 5 IPs:"
    head -5 "$DIR_SAIDA/5_top_ips.txt"

} > "$DIR_SAIDA/report.txt"

echo "Análise concluída! Resultados em: $DIR_SAIDA"