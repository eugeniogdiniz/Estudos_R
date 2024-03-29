#R Estat�stica Descritiva
#Vari�veis Quantitativas
install.packages(c("scales","tidyverse"))
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
grafico_hist = ggplot(dados,aes(x=Sepal.Length)) + 
  geom_histogram(color = "black",fill="lightblue",bins =30)+
  ggtitle("Gr�fico histograma do tamanho da S�pala das Plantas")+
  xlab("Tamanho das S�palas") +
  ylab("Frequ�ncia simples") +
  theme()

grafico_hist
ggplotly(grafico_hist)

#Gr�fico Box-Plot
dados=iris
grafico_boxplot = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,fill=Species)) + 
  geom_boxplot()+
  ggtitle("Gr�fico de Box-plot do tamanho da S�pala vs o tamanho das P�talas das Plantas")+
  xlab("Tamanho das S�palas") +
  ylab("Tamanho das P�talas")
grafico_boxplot

#Gr�fico de Dispers�o - cor esp�cies

dados=iris
grafico_dispersao_cor = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) + 
                       geom_point(size=4)+
                       ggtitle("Gr�fico de Dispers�o do tamanho da S�pala vs o tamanho das P�talas das Plantas")+
                       xlab("Tamanho das S�palas") +
                       ylab("Tamanho das P�talas")
grafico_dispersao_cor
ggplotly(grafico_dispersao_cor)

#Gr�fico de Dispers�o - cor sp�cies e tamanho esp�cies

dados=iris
grafico_dispersao_tamanho = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) + 
  geom_point(aes(size=Species))+
  ggtitle("Gr�fico de Dispers�o do tamanho da S�pala vs o tamanho das P�talas das Plantas")+
  xlab("Tamanho das S�palas") +
  ylab("Tamanho das P�talas")

grafico_dispersao_tamanho
ggplotly(grafico_dispersao_tamanho)

#Gr�fico de Dispers�o por Sp�cie
dados=iris
grafico_dispersao_especie = ggplot(dados, aes(x=Sepal.Length, y=Petal.Length,col=Species)) + 
                       geom_point(size=4)+
                       ggtitle("Gr�fico de Dispers�o do tamanho da S�pala vs o tamanho das P�talas das Plantas")+
                       xlab("Tamanho das S�palas") +
                       ylab("Tamanho das P�talas") +
                       facet_wrap(~Species)
grafico_dispersao_especie


#Gr�fico de linhas do desemprego nos Estados Unidos de 1967 a 2015 - Economics

dados2=economics
grafico_linhas=ggplot(economics, aes(x=date, y=unemploy)) + 
                      geom_line(col="red") + 
                      xlab("Ano") + 
                      ylab("Desemprego (em milhares)") + 
                      ggtitle("Desemprego nos Estados Unidos de 1967 a 2015 - Economics")
grafico_linhas               
ggplotly(grafico_linhas)

#Agrupando os gr�ficos na mesma janela com ggplot2
grid.arrange(
             grafico_hist,
             grafico_boxplot,
             grafico_dispersao_cor,
             grafico_dispersao_tamanho,
             grafico_dispersao_especie,
             grafico_linhas,
             nrow=3,ncol=2)

