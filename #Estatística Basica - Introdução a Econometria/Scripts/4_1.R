setwd("C:/Users/lenin/Google Drive/Linguagem R/#Estatística Basica - Introdução a Econometria/Bases")

tab2_1 <- read.csv("cd-tabela21.csv", header = TRUE, sep = ";", dec = ",")
View(tab2_1)

tab4_2 <- table(tab2_1$Região.de.Procedência,
                tab2_1$Grau.de.Instrução)
Total_linha  <- margin.table(tab4_2,2)
Total_coluna <- margin.table(tab4_2,1)

tab4_2_ <- rbind(cbind(tab4_2,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_2_)[[1]][4] <- "Total_linha"
tab4_2_

#dinmnames(nome do db)[[Numero da coluna]][numero da linha]

#Distribuição Conjunta (proporção %)


tab4_2 <- table(tab2_1$Região.de.Procedência,
                tab2_1$Grau.de.Instrução)

tab4_3 <- prop.table(tab4_2)*100

Total_linha  <- margin.table(tab4_3,2)
Total_coluna <- margin.table(tab4_3,1)

tab4_3 <- rbind(cbind(tab4_3,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_3)[[1]][4] <- "Total_linha"
tab4_3

#Distribuição Conjunta em relação ao 
# grau de ensino (proporção %)

tab4_2 <- table(tab2_1$Região.de.Procedência,
                tab2_1$Grau.de.Instrução)

tab4_4 <- prop.table(tab4_2, 2)*100 #utiliza-se (db, n),
#sendo n o numero da label que irá filtrar a proporção

Total_linha  <- margin.table(tab4_4,2)
Total_coluna <- margin.table(tab4_2,1)/sum(margin.table(tab4_2,1))

tab4_4 <- rbind(cbind(tab4_4,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_4)[[1]][4] <- "Total_linha"
tab4_4

#Distribuição Conjunta em relação a 
# localização (proporção %)

tab4_2 <- table(tab2_1$Região.de.Procedência,
                tab2_1$Grau.de.Instrução)

tab4_5 <- prop.table(tab4_2, 1)*100 #utiliza-se (db, n),
#sendo n o numero da label que irá filtrar a proporção

Total_linha  <- margin.table(tab4_5,2)
Total_coluna <- margin.table(tab4_2,1)/sum(margin.table(tab4_2,1))

tab4_5 <- rbind(cbind(tab4_5,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_5)[[1]][4] <- "Total_linha"
tab4_5

#Gráfico da Distribuição da regiao por grau de instrução

install.packages("ggplot")
library(ggplot)
install.packages("gmodels")
library(gmodels)

ggplot(melt(tab4_2_[1:3,],value.name = "contagem",
            varnames = c("reg_procedencia","grau_instrucao")))+ ## `melt` empilha os dados no formato necessário para o ggplot
  aes(x=grau_instrucao,y=contagem,fill=reg_procedencia) + ## Variáveis a serem plotadas. 
  geom_bar(stat="identity", position = "fill") +    ## Define o gráfico de barras percentual empilhado 
  scale_fill_brewer(name="Região de\n Procedência")+  ## Opções do preenchimento do gráfico (label e paleta de cores)
  scale_y_continuous(labels = percent_format()) +   ## Formato do eixo Y em porcentagem
  theme_bw()+   ## Define a cor do fundo do gráfico: neste caso, branco
  #theme(legend.position="bottom") +  ## Define a posição da legenda abaixo do gráfico
  #ggtitle("Figura 4.1: Distribuição da região de procedência por grau de instrução")+
  xlab("Grau de Instrução") + ylab("")                    ## Define os `labels` dos eixos