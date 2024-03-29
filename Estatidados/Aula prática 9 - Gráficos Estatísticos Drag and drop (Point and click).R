install.packages("tidyverse")

require(ggplot2)
require(dplyr)
require(scales)
require(plotly)
require(gridExtra)
require(tidyverse)

#ggplot geral
#Elementos de um gr�fico ggplot

#1. Base de dados que ser� utilizada
#2. Aesthetic mapping (A parte est�tica do gr�fico, eixos, cores,tamanhos,textos)- Depende da geometria(tipo de gr�fico) Escolhido
#3. Geometria que ser� utilizada (Tipo de gr�fico)
#4. Escala (formato, unidade de medida)
#5. R�tulos, t�tulos legendas, etc..

#Gr�fico Histograma
View(iris)
dados=iris

grafico_hist = ggplot(dados,aes(x=Sepal.Length)) + #Nesse ggplot utiliza-se o "x=" pois n�o estamos trabalhando com um vetor, mas sim uma coluna
  geom_histogram(color = "black", fill = "lightblue", bins = 30) + #color = black vai preencher as linhas do histograma, enquanto que o fill = ligthblue vai preencher por dentro, bins � o numero de intervalos de classes do histograma
  ggtitle("Grafico histograma do tamanho da Sepala das plantas") + 
  xlab("Tamanho da Sepala") + 
  ylab("Frequência Simples") + 
  theme() #o comando "theme" � responsavel por mudar o fundo/tema do histograma
grafico_hist

ggplotly(grafico_hist)  

#Gr�fico Box-Plot

grafico_boxplot = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,fill=Species)) +  #X=Tamanho da Sepala, y=Tamanho da Petala,Cor por Especie
  geom_boxplot() +
  ggtitle("Grafico de Box-Plot do tamanho da Sepala") + 
  xlab("Tamanho da Sepala") + 
  ylab("Tamanho da Petala")
grafico_boxplot

ggplotly(grafico_boxplot)

#Grafico de dispers�o

grafico_dispersao_cor = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(size=4) + #Apresenta o tamanho padr�o de todas as bolinhas
  ggtitle("Grafico de dipsers�o do tamano da Sepala vs o tamanho das Petalas") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala")

ggplotly(grafico_dispersao_cor)

#Grafico de dispers�o - cor sp�cies e tamanho especie

grafico_dispersao_tamanho = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(aes(size=Species)) + #O tamanho est� atrelado ao tamanho da Sepala
  ggtitle("Grafico de dipsers�o do tamano da Sepala vs o tamanho das Petalas") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala")

ggplotly(grafico_dispersao_tamanho)

#Grafico de dispers�o por Esp�cie

grafico_dispersao_especie = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) +
  geom_point(size = 2) +
  ggtitle("Grafico de dipsers�o do tamano da Sepala vs o tamanho das Petalas das especies") +
  xlab("Tamanho da Sepala") +
  ylab("Tamanho da Petala") +
  facet_wrap(~Species) #pode utilizar o comando "facet_grit" tamb�m

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
#o comando esquisser abre uma pagina de web onde � possivel selecionar o data.frame que vamos utilizar
#data.frame � o banco de dados que utilizamos para carregar as infoma��es
#para cada gr�fico criado existe um "Plot option" pra poder trocar a cor
#em data eu posso criar filtros dentro dos gr�ficos

grafico_hist_2 = ggplot(dados) +
  aes(x = Sepal.Length) +
  geom_histogram(bins = 30L, fill = "#75b8d1") +
  labs(x = "Tamanho das S�palas", y = "Frequ�ncia Simples", title = "Histograma do tamanho das S�palas das plantas") +
  theme_minimal()

grafico_hist_especie = ggplot(dados) +
  aes(x = Sepal.Length, fill = Species) +
  geom_histogram(bins = 30L) +
  scale_fill_hue() +
  labs(x = "Tamanho das S�palas", y = "Frequ�ncia Simples", title = "Histograma do tamanho das S�palas das plantas por esp�cie") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_dispersao_tamanho2 = ggplot(dados) +
 aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
 geom_point(size = 3L) +
 scale_color_hue() +
 labs(x = "Tamanho das S�palas", y = "Tamanho das P�talas", title = "Gr�fico de dispers�o do tamanho das S�palas vs o tamanho das P�talas") +
 theme_minimal()

grafico_dispersao_especie2 = ggplot(dados) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point(size = 3L) +
  scale_color_hue() +
  labs(x = "Tamanho das S�palas", y = "Tamanho das P�talas", title = "Gr�fico de dispers�o do tamanho das S�palas vs o tamanho das P�talas") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_boxplot2 = ggplot(dados) +
  aes(x = "", y = Sepal.Length, fill = Species) +
  geom_boxplot() +
  scale_fill_hue() +
  labs(x = "Tamanho das S�palas", y = "Tamanho das P�talas", title = "Gr�fico de dispers�o do tamanho das S�palas vs o tamanho das P�talas") +
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