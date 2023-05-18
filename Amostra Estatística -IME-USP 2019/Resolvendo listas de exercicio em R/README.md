# 201909-amostra-listas

Material do workshop sobre listas de exercícios ministrado no IME-USP, dia 18/09/2019.

**O material completo será criado durante a aula e adicionado após a aula**

## Slides

[jtrecenti.github.com/slides/amostra2019](https://jtrecenti.github.com/slides/amostra2019)

-----------------------------

# Agenda

- Setup & Organizar projetos
- Tips & tricks para RMarkdown
- Dicas avançadas
- Trabalhar em grupo usando Git/Github
- Extras

-----------------------------

# Guia

Montei esse guia para delinear o conteúdo da aula

## Setup & Organizar projetos

- `usethis::create_package("nomePacote")`
- `usethis::use_vignette("lista1")`
- `usethis::use_data_raw("dados")`
- `usethis::use_data(dados_arrumados)`

## Tips & tricks para RMarkdown

- [ ] RMarkdown Básico
    - Markdown básico
    - Outputs: Documento HTML, Documento PDF, Documemnto Word
    - `{pagedown}`
    - Atalhos
        - Ctrl+Alt+I
        - Ctrl+Alt+N
        - Ctrl+Shift+K
- [ ] `knitr::opts_chunk$set()`
- [ ] Opções do Viewer
- [ ] Opções do RMarkdown
- [ ] Matemática
- [ ] Pacote `{remedy}`

## Dicas avançadas

- [ ] `bookdown::html_document2` e referências
    - https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html#eq:binom
    - https://bookdown.org/yihui/bookdown/figures.html
- [ ] Template docx
- [ ] Template tex

```yaml
---
output: 
  pdf_document:
    latex_engine: xelatex
    includes:
      in_header: header-latex.tex
documentclass: "article"
geometry: "top=2cm, bottom=4.5cm, left=2.5cm, right=2.5cm"
classoption: "12pt,letterpaper"
mainfont: "DejaVu Sans"
curso: "Meu curso"
---
```

- [ ] Pacote `{pagedown}`
- [ ] Arquivos separados
