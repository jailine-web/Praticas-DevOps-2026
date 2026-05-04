## Práticas-DevOps-2026 🖥️📝

#### Repositório desenvolvido para as atividades práticas da disciplina de DevOps. O objetivo é simular
#### atividades comuns no dia a dia de quem trabalha com DevOps, como análise de logs, automação de tarefas
#### e configuração de servidores.

## Ferramentas utilizadas ⚒️

    * Git
    * GitHub
    * Linux

## Comandos relevantes 📚

```bash
    // Cria a branch backup
    git checkout -b feature/backup-script 
```

```bash
    // Cria arquivo dentro da pasta
    touch backup/backup_sistema.sh 
```
```bash
    // Empurra as alterações para o github
    git push origin feature/backup-script 
```
```bash
    // Comando para instalar o imageMagick
    winget install ImageMagick.ImageMagick
```

## Sobre o desenvolvimento

| Comandos   | Função       |
|------------|--------------|
|  sort      | Organiza os itens em ordem alfabética |
|    >       | Responsável por salvar o resultado em um arquivo |
|  -F\"      | Define o separador de campo como " |
|  | uniq -c | Conta quantas vezes cada método apareceu |
|  wc -l <   | Retorna a quantidade de linhas existentes em um arquivo, apenas os números das linhas. |
|  head -5   | Mostra as primeiras 5 linhas de um arquivo |
|  grep -E   | Apermite buscar padrões mais complexos usando regex avançada (-E) |

#### Awk: Ferramenta de linha de comando que lê, divide e processa texto em colunas, cada coluna é representada
#### por $ e o índice dela. Ex: $1 corresponde a 1° coluna, $2 é a segunda coluna e assim sucessivamente, sendo
#### bom para arquivos estruturados dividindo as linhas por espaços.

#### Uniq: Remove valores repetidos consecutivos (esses valores devem está próximos/seguidos
#### para que a remoção em cadeia ocorra de forma correta )

#### | : Este comando pega o resultado/saída de um comando e utiliza com entrada no próximo
#### comando, transformando os dados em cada etapa

#### | sort -nr: Organiza do maior para o menor | -n --> numérico , -r --> reverso



### Autores:
    * Jailine Almeida 👩🏻‍💻
    * Rondinele Silva 👨🏻‍💻