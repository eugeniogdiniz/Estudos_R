install.packages("tidyverse")

require(ggplot2)
require(dplyr)
require(scales)
require(plotly)
require(gridExtra)
require(tidyverse)

#ggplot geral
#Elementos de um gráfico ggplot

#1. Base de dados que será utilizada
#2. Aesthetic mapping (A parte estética do gráfico, eixos, cores,tamanhos,textos)- Depende da geometria(tipo de gráfico) Escolhido
#3. Geometria que será utilizada (Tipo de gráfico)
#4. Escala (formato, unidade de medida)
#5. Rótulos, títulos legendas, etc..

#Gráfico Histograma
View(iris)
dados=iris

grafico_hist = ggplot(dados,aes(x=Sepal.Length)) + #Nesse ggplot utiliza-se o "x=" pois não estamos trabalhando com um vetor, mas sim uma coluna
  geom_histogram(color = "black", fill = "lightblue", bins = 30) + #color = black vai preencher as linhas do histograma, enquanto que o fill = ligthblue vai preencher por dentro, bins é o numero de intervalos de classes do histograma
  ggtitle("Grafico histograma do tamanho da Sepala das plantas") + 
  xlab("Tamanho da Sepala") + 
  ylab("FrequÃªncia Simples") + 
  theme() #o comando "theme" é responsavel por mudar o fundo/tema do histograma
grafico_hist

ggplotly(grafico_hist)  

#Gráfico Box-Plot

grafico_boxplot = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,fill=Species)) +  #X=Tamanho da Sepala, y=Tamanho da Petala,Cor por Especie
  geom_boxplot() +
  ggtitle("Grafico de Box-Plot do tamanho da Sepala") + 
  xlab("Tamanho da Sepala") + 
  ylab("Tamanho da Petala")
grafico_boxplot

ggplotly(grafico_boxplot)

#Grafico de dispersão

grafico_dispersao_cor = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(size=4) + #Apresenta o tamanho padrão de todas as bolinhas
  ggtitle("Grafico de dipsersão do tamano da Sepala vs o tamanho das Petalas") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala")

ggplotly(grafico_dispersao_cor)

#Grafico de dispersão - cor spécies e tamanho especie

grafico_dispersao_tamanho = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(aes(size=Species)) + #O tamanho está atrelado ao tamanho da Sepala
  ggtitle("Grafico de dipsersão do tamano da Sepala vs o tamanho das Petalas") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala")

ggplotly(grafico_dispersao_tamanho)

#Grafico de dispersão por Espécie

grafico_dispersao_especie = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(size = 2) +
  ggtitle("Grafico de dipsersão do tamano da Sepala vs o tamanho das Petalas das especies") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala") +
  facet_wrap(~Species) #pode utilizar o comando "facet_grit" também

ggplotly(grafico_dispersao_especie)

dados2=economics
View(dados2)

#Grafico de linha do desemprego nos Estados Unidos de 1967 a 2015 - Economics

grafico_linha = ggplot(dados2, aes(x=date, y=unemploy)) +
  geom_line(col="blue") + #comando "geom_line" para grafico de linhas
  xlab("Ano") +
  ylab("Desemprego (em milhares)") +
  ggtitle("Desemprego dos EUA de 1967 a 2015 - Economics")

ggplotly(grafico_linha)

#Dashboard

grid.arrange(grafico_hist,
             grafico_dispersao_tamanho,
             grafico_boxplot,
             grafico_dispersao_cor,
             grafico_dispersao_especie,
             grafico_linha, nrow = 3, ncol = 2)

install.packages("esquisse")

require(esquisse)
 
esquisser(viewer = "browser")
#o comando esquisser abre uma pagina de web onde é possivel selecionar o data.frame que vamos utilizar
#data.frame é o banco de dados que utilizamos para carregar as infomações
#para cada gráfico criado existe um "Plot option" pra poder trocar a cor
#em data eu posso criar filtros dentro dos gráficos

grafico_hist_2 = ggplot(dados) +
  aes(x = Sepal.Length) +
  geom_histogram(bins = 30L, fill = "#75b8d1") +
  labs(x = "Tamanho das Sépalas", y = "Frequência Simples", title = "Histograma do tamanho das Sépalas das plantas") +
  theme_minimal()

grafico_hist_especie = ggplot(dados) +
  aes(x = Sepal.Length, fill = Species) +
  geom_histogram(bins = 30L) +
  scale_fill_hue() +
  labs(x = "Tamanho das Sépalas", y = "Frequência Simples", title = "Histograma do tamanho das Sépalas das plantas por espécie") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_dispersao_tamanho2 = ggplot(dados) +
 aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
 geom_point(size = 3L) +
 scale_color_hue() +
 labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
 theme_minimal()

grafico_dispersao_especie2 = ggplot(dados) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point(size = 3L) +
  scale_color_hue() +
  labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_boxplot2 = ggplot(dados) +
  aes(x = "", y = Sepal.Length, fill = Species) +
  geom_boxplot() +
  scale_fill_hue() +
  labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_linha2 = ggplot(dados2) +
  aes(x = date, y = unemploy) +
  geom_line(size = 1.3, colour = "#e41a1c") +
  labs(x = "Ano", y = "Numero de Desempregados", title = "Desemprego dos EUA ao longo dos anos") +
  theme_minimal()

grid.arrange(grafico_boxplot2,
             grafico_dispersao_especie2,
             grafico_dispersao_tamanho2,
             grafico_hist_2,
             grafico_hist_especie,
             grafico_linha2, nrow = 3, ncol = 2)