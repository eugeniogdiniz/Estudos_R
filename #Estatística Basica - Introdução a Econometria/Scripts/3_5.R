##Gráficos de Simetria

#Crie o Conjunto
conj = c(0.5,2.3,4,6.4,8,15.3,13.5,12,9.8)
conj
summary(conj)

median(conj)

#Organizar as observações de modo a entender se há simetria ou não
#Calculando os ui's e vi's

u = sort((median(conj)-conj)[(median(conj)-conj)>0], decreasing = TRUE)
v = sort((conj-median(conj))[conj-(median(conj))>0], decreasing = TRUE)
u
v

install.packages("ggplot2")
require(ggplot2)
library(ggplot2)

#Livro

db_munic <- read.csv("cd-municipios.csv",header = TRUE, sep = ";", dec = ",")
summary(db_munic$População)

u <- median(db_munic$População)-db_munic$População
v <- db_munic$População-median(db_munic$População)

dc_munic_pop = plot(sort(u), sort(v), pch = 19, xlab = "ui", ylab = "vi",
                    col = "darkblue", xlim = c(0,max(u)), ylim = c(0,max(v)))
abline(0,1)
title("Gráfico de simetria para População Municipal")

#Teste Estatidados

u <- median(db_munic$População)-db_munic$População
v <- db_munic$População-median(db_munic$População)

pop <- data.frame(u,
                v)

ggplot(pop, aes(x = sort(u), y = sort(v))) + 
  geom_point() +
  xlab("ui") +
  ylab("vi") +
  ggtitle("Gráfico de Simetria da População por municipio")