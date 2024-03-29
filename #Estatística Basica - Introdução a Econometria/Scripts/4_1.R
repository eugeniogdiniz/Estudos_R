setwd("C:/Users/lenin/Google Drive/Linguagem R/#Estat�stica Basica - Introdu��o a Econometria/Bases")

tab2_1 <- read.csv("cd-tabela21.csv", header = TRUE, sep = ";", dec = ",")
View(tab2_1)

tab4_2 <- table(tab2_1$Regi�o.de.Proced�ncia,
                tab2_1$Grau.de.Instru��o)
Total_linha  <- margin.table(tab4_2,2)
Total_coluna <- margin.table(tab4_2,1)

tab4_2_ <- rbind(cbind(tab4_2,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_2_)[[1]][4] <- "Total_linha"
tab4_2_

#dinmnames(nome do db)[[Numero da coluna]][numero da linha]

#Distribui��o Conjunta (propor��o %)


tab4_2 <- table(tab2_1$Regi�o.de.Proced�ncia,
                tab2_1$Grau.de.Instru��o)

tab4_3 <- prop.table(tab4_2)*100

Total_linha  <- margin.table(tab4_3,2)
Total_coluna <- margin.table(tab4_3,1)

tab4_3 <- rbind(cbind(tab4_3,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_3)[[1]][4] <- "Total_linha"
tab4_3

#Distribui��o Conjunta em rela��o ao 
# grau de ensino (propor��o %)

tab4_2 <- table(tab2_1$Regi�o.de.Proced�ncia,
                tab2_1$Grau.de.Instru��o)

tab4_4 <- prop.table(tab4_2, 2)*100 #utiliza-se (db, n),
#sendo n o numero da label que ir� filtrar a propor��o

Total_linha  <- margin.table(tab4_4,2)
Total_coluna <- margin.table(tab4_2,1)/sum(margin.table(tab4_2,1))

tab4_4 <- rbind(cbind(tab4_4,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_4)[[1]][4] <- "Total_linha"
tab4_4

#Distribui��o Conjunta em rela��o a 
# localiza��o (propor��o %)

tab4_2 <- table(tab2_1$Regi�o.de.Proced�ncia,
                tab2_1$Grau.de.Instru��o)

tab4_5 <- prop.table(tab4_2, 1)*100 #utiliza-se (db, n),
#sendo n o numero da label que ir� filtrar a propor��o

Total_linha  <- margin.table(tab4_5,2)
Total_coluna <- margin.table(tab4_2,1)/sum(margin.table(tab4_2,1))

tab4_5 <- rbind(cbind(tab4_5,Total_coluna), 
                c(Total_linha, sum(Total_coluna)))
dimnames(tab4_5)[[1]][4] <- "Total_linha"
tab4_5

#Gr�fico da Distribui��o da regiao por grau de instru��o

install.packages("ggplot")
library(ggplot)
install.packages("gmodels")
library(gmodels)

ggplot(melt(tab4_2_[1:3,],value.name = "contagem",
            varnames = c("reg_procedencia","grau_instrucao")))+ ## `melt` empilha os dados no formato necess�rio para o ggplot
  aes(x=grau_instrucao,y=contagem,fill=reg_procedencia) + ## Vari�veis a serem plotadas. 
  geom_bar(stat="identity", position = "fill") +    ## Define o gr�fico de barras percentual empilhado 
  scale_fill_brewer(name="Regi�o de\n Proced�ncia")+  ## Op��es do preenchimento do gr�fico (label e paleta de cores)
  scale_y_continuous(labels = percent_format()) +   ## Formato do eixo Y em porcentagem
  theme_bw()+   ## Define a cor do fundo do gr�fico: neste caso, branco
  #theme(legend.position="bottom") +  ## Define a posi��o da legenda abaixo do gr�fico
  #ggtitle("Figura 4.1: Distribui��o da regi�o de proced�ncia por grau de instru��o")+
  xlab("Grau de Instru��o") + ylab("")                    ## Define os `labels` dos eixos