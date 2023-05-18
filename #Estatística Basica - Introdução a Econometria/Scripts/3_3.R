#QUANTIS EMPÍRICOS
#1
teste = c(15,5,3,8,10,2,7,11,12)
summary(teste)
#2
teste1 = c(15,5,3,8,10,2,7,11,12,67)
summary(teste1)

quantile(teste1, probs = 0.9) #Utilizar função 'quantile' para encontrar o valor dos quantils
cd_empresa = read.csv("cd-empresa.csv", header = TRUE, sep = ";", dec = ",", stringsAsFactors = FALSE)
View(cd_empresa)
summary(cd_empresa)

install.packages("dplyr")
library(dplyr)
cd_populacao = read.csv("cd-populacao.csv", header = TRUE, sep = ";", dec = ",", stringsAsFactors = FALSE)
View(cd_populacao)
summary(cd_populacao)
