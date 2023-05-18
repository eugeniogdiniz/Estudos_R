require(ggplot2)
require(dplyr)
require(scales)
require(plotly)
require(gridExtra)

sexo=c("M","F")
cor=c("Verde","Preto","Azul","Castanho")
fumante=c("Fumante","NÃ£o Fumante")
estado_civil=c("Solteiro(a)","Casado(a)")

a_sexo=sample(sexo,size=100, replace=TRUE)
a_cor_olhos=sample(cor,size=100, replace=TRUE)
a_fumante=sample(fumante,size=100, replace=TRUE)
a_estado_civil=sample(estado_civil,size=100, replace=TRUE)
a_dummy_estado_civil=ifelse(a_estado_civil=="Solteiro(a)","1","0")

variaveis_categoricas_nominais=data.frame(a_sexo,
                                          a_cor,
                                          a_fumante,
                                          a_estado_civil,
                                          a_dummy_estado_civil)

View(variaveis_categoricas_nominais)

#Grafico de colunas verticais

grafico_coluna_geral=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos)) + 
  geom_bar(position = "dodge",fill="red") + 
  ggtitle("Numero de alunos por cor dos olhos") + 
  xlab("Cor dos Olhos") +
  ylab("FrequÃªncia simples (Quantidade de alunos)")

ggplotly(grafico_coluna_geral)

#Grafico de colunas verticais ou barras verticais

grafico_coluna=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos, fill = a_sexo)) + 
  geom_bar(position = "dodge") + 
  ggtitle("Numero de alunos por cor dos olhos e sexo") +
  labs(fill="Sexo") +
  xlab("Cor dos Olhos") +
  ylab("FrequÃªncia simples (Quantidade de alunos)")

ggplotly(grafico_coluna)

#Grafico de colunas verticais ou barras verticais (%)

grafico_coluna_percent=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos, fill = a_sexo)) + 
  geom_bar(position = "dodge",aes(y = (..count..)/sum(..count..))) + 
  ggtitle("Numero de alunos por cor dos olhos e sexo (%)") +
  scale_y_continuous(labels = percent) +
  labs(fill="Sexo") +
  xlab("Cor dos Olhos") +
  ylab("FrequÃªncia simples (Quantidade de alunos)")

ggplotly(grafico_coluna_percent)

#Grafico de colunas ou barras verticais empilhadas (%)

grafico_coluna_empilhadas=ggplot(variaveis_categoricas_nominais,aes(a_cor_olhos, fill = a_sexo)) + 
  geom_bar(position = "fill") + 
  ggtitle("Numero de alunos por cor dos olhos e sexo (%)") +
  scale_y_continuous(labels = percent) +
  labs(fill="Sexo") +
  xlab("Cor dos Olhos") +
  ylab("FrequÃªncia simples (Quantidade de alunos)")

ggplotly(grafico_coluna_empilhadas)

#Grafico barras horizontais

grafico_barras_horizontais=grafico_coluna + coord_flip()

ggplotly(grafico_barras_horizontais)

#Grafico barras horizontais por sexo

grafico_barras_horizontais_por_sexo=grafico_coluna + coord_flip() + facet_grid(~a_sexo)

ggplotly(grafico_barras_horizontais_por_sexo)

#Dashboard

grid.arrange(grafico_coluna_geral,
             grafico_coluna, 
             grafico_coluna_empilhadas,
             grafico_coluna_percent,
             grafico_barras_horizontais,
             grafico_barras_horizontais_por_sexo, nrow=3, ncol = 2)