munic <- read.csv("cd-municipios.csv", header = TRUE, dec = ",", sep = ";")
View(munic)

#Ordenar Municipios por tamanho da população

munic <- munic[order(munic$População, decreasing = TRUE),]

#Amostra dos 15 maiores municípios

munic <- munic[1:15,]

summary(munic)

#Gráfico Box-Plot

boxplot(munic$População,
        phc = "*", #tipo de marcador dos outliers
        col = "blue", #cor de preenchimento do gráfico
        border = "black", #cor da borda
        boxwex = 0.3, #tamanho da caixa
        )

#Para revomer os outlier's do gráfico 
#será utilizada a função "outline = FALSE" no scrip
#do boxplot()

boxplot(munic$População,
        phc = "*", #tipo de marcador dos outliers
        col = "blue", #cor de preenchimento do gráfico
        border = "black", #cor da borda
        boxwex = 0.3, #tamanho da caixa
        outline = FALSE
        )

#Para adicionar um titulo ao gráfico (qualquer gráfico)
#Deve-se utilizar a função "title()

title("Box plot para os quinze maiores  \n municípios do Brasil,
      desconsiderando outliers")