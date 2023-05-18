#Transformação de Dados

install.packages("gridExtra")
require(gridExtra)

db_munic <- read.csv("cd-municipios.csv", header = TRUE, sep = ";", dec = ",")

db_log <- log(db_munic$População) #Transformação em log
db_1_4 <- (db_munic$População)^(1/4) #Transformação em p= 1/4
db_1_2 <- (db_munic$População)^(1/2) #Transformação em p= 1/2
db_1_3 <- (db_munic$População)^(1/3) #Transformação em p= 1/3


par(mfrow = c(2,2))
hist_log <- hist(db_log, main = "log", xlab = "", ylab = "",
                 col = "darkblue", border = "black")
hist_1_2 <- hist(db_1_2, main = "p = 1/2", xlab = "", ylab = "",
                 col = "darkblue", border = "black")
hist_1_4 <- hist(db_1_4, main = "p = 1/4", xlab = "", ylab = "",
                 col = "darkblue", border = "black")
hist_1_3 <- hist

#Modelo do livro com lista vazia

xp <- list() # declarando xp como uma lista vazia
xp[[1]] <- log(db_munic$População)    # Transformação log
xp[[2]] <- (db_munic$População)^(1/4) # Transformação p=1/4
xp[[3]] <- (db_munic$População)^(1/2) # Transformação p=1/2
xp[[4]] <- (db_munic$População)^(1/3) # Transformação p=1/3

par(mfrow=c(2,2))
hist(xp[[1]], main="log", ylab="", xlab="", col="darkgrey", border="white",cex.axis=0.8,cex.main=0.8)
hist(xp[[2]], main="p=1/4", ylab="", xlab="", col="darkgrey", border="white",cex.axis=0.8,cex.main=0.8)
hist(xp[[3]], main="p=1/2", ylab="", xlab="", col="darkgrey", border="white",cex.axis=0.8,cex.main=0.8)
hist(xp[[4]], main="p=1/3", ylab="", xlab="", col="darkgrey", border="white",cex.axis=0.8,cex.main=0.8)

#boxplot

boxplot(xp, pch = "", col = "lightblue", border = "black",
        boxwex = 0.3, names = c("p=0","p=1/4","p=1/2","p=1/3"))
