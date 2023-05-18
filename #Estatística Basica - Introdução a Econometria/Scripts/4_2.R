agente <- c("A","B","C","D","E","F","G")
anos_servicos <- c(1,2,3,4,5,6,7)
n_clientes <- c(48,50,56,52,43,60,62)

table_2 <- data.frame(agente,
                      anos_servicos,
                      n_clientes)
plot(n_clientes, pch = 20, col = "darkred",
     xlab = "Anos de Serviço", ylab = "Numero de Clientes", cex = 2)


#Tabela 4.15

agente <- c("A","B","C","D","E","F","G","H","I","J")
anos_servicos <- c(2,3,4,5,4,6,7,8,8,10)
n_clientes <- c(48,50,56,52,43,60,62,58,64,72)
x_meanx <- c(anos_servicos-mean(anos_servicos)) 
y_meany <- c(n_clientes-mean(n_clientes))
x_meanx_dp <- c(x_meanx/sqrt(var(anos_servicos)))
y_meanx_dp <- c(y_meany/sqrt(var(n_clientes)))
z_z <- c(x_meanx_dp * y_meanx_dp)
 
table_3 <- data.frame(agente,
                      anos_servicos,
                      n_clientes,
                      x_meanx,
                      y_meany,
                      x_meanx_dp,
                      y_meanx_dp,
                      z_z)
table_3

graf_1 <- plot(x_meanx,y_meany, pch = 20, col = "green",
     xlab = expression(x - bar(x)), ylab = expression(y-bar(y)))

graf_2 <- plot(x_meanx_dp,y_meanx_dp, pch = 20, col = "green",
               xlab = expression(z[x]), ylab = expression(z[y]))

cd_temperatura <- read.csv("cd-temperaturas.csv", h= T, sep = ";", dec = ",")
View(cd_temperatura)

q_cananeia <- quantile(cd_temperatura$Cananeia, probs = seq(0,1,1/120))
#função probs traz o valor relativo percentual de todos os valores da coluna
#de forma crescente (do menor para o maior)
q_ubatuba <- quantile(cd_temperatura$Ubatuba, probs = seq(0,1,1/120))
graf_q_q <- plot(q_cananeia,q_ubatuba,
                 xlab = "Quantis Cananeia", ylab = "Quantis Ubatuba", pch = 20,
                 col = "blue")
abline(a  = 0, b = 1)

bd_pib <- read.csv("pib.csv", h = T, sep = ";", dec = ",")
View(bd_pib)

#Teste economico
#ICBR e IPCA

q_icbr <- quantile(bd_pib$PIB.real..2000., probs = seq(0,1,1/96))
q_ipca <- quantile(bd_pib$IPCA, probs = seq(0,1,1/96))
graf_q_q <- plot(q_ipca,q_icbr,
                 xlab = "Quantis IPCA (%)", ylab = "Quantis IC-BR", pch = 20,
                 col = "blue", 
                 title("Análise Q x Q do IC-Br em comparação ao 
IPCA - 2010 - 2017"))

setwd("C:/Users/lenin/Google Drive/Linguagem R/#Estatística Basica - Introdução a Econometria/Bases")

cd_mercado <- read.csv("cd-mercado.csv", h = T, sep = ";", dec = ",")
View(cd_mercado)
q_tele <- quantile(cd_mercado$TelebrÃ.s, probs = seq(0,1,1/118))
q_bove <- quantile(cd_mercado$Indice, probs = seq(0,1,1/118))

plot(q_tele,q_bove, xlab = "Telebras", ylab = "Ibovespa",
     pch = 20, col = "darkgreen")

plot(cd_mercado$TelebrÃ.s[1:39],cd_mercado$Indice[1:39], xlab = "Telebras", ylab = "Ibovespa",
     pch = 20, col = "darkgreen")

