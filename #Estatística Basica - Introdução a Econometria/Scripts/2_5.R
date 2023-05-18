setwd("C:/Users/lenin/Google Drive/Linguagem R/Estatística Basica - Introdução a Econometria")

cd_notas = read.table("cd-notas.csv", header = T, skip = 3, sep = ";", dec = ",")
View(cd_notas)

# Unificando colunas em uma unica e alterando o nome
# A função "data.frame( nome da coluna = c(" permite que eu crie e manipule
# o nome da coluna.

cd_notas = data.frame(nota = c(cd_notas$X, 
                               cd_notas$X.1, 
                               cd_notas$X.2, 
                               cd_notas$X.3, 
                               cd_notas$X.4, 
                               cd_notas$X.5, 
                               cd_notas$X.6, 
                               cd_notas$X.7, 
                               cd_notas$X.8, 
                               cd_notas$X.9))

hist(cd_notas$nota, col = "darkred", xlab = "Notas", 
     ylab = "Frequencia", border = "white")

# Gráfico de dispersão unidimensional
# offset vai indicar a frequencia que será analisada
# at vai posicionar a frequencia no "gráfico"
# pch é o numero inteiro que especifica o simbolo da plotagem

stripchart(cd_notas$nota, method = "stack", offset = 2, at = 0,
           pch = 19, col = "darkblue", ylab = NA, xlab = "Notas", cex = 0.2)

# Grafico de Ramo-e-folhas 

stem(cd_notas$nota)

#Poluicao

cd_poluicao = read.csv("cd-poluicao.csv", header = TRUE, skip = 8, sep = ";", dec = ",")
View(cd_poluicao)
summary(cd_poluicao)


#Grafico de linha mostrando a dispersão dos graus ao longo dos dias analisados
plot.ts(cd_poluicao$temp, xlab = "Dia", ylab = "Grau", col = "darkblue")


hist(cd_poluicao$temp, xlab = "Temperatura", ylab = "" , border = "black", col = "yellow")

stripchart(cd_poluicao$temp, method = "stack", offset = 2, at = 0,
          pch = 20, col = "blue", xlab = "Temperatura", ylab = "", cex = 0.5)

stem(cd_poluicao$temp)


 