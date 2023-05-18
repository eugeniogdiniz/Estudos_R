db_notas <- read.csv("cd-notas.csv", header = TRUE, dec = ",", sep = ";")
db_notas <- data.frame(db_notas$Nota,db_notas$Salário)

#Estatística Descritiva

install.packages("ds")
require(ds)

gds(db_notas$Salário)

dscor(db_notas, method = 1, option = 1)

#Boxplot

boxplot(db_notas$db_notas.Nota, pch = "*", col = "blue", border = "black")

#Simetria
u <- median(db_notas$db_notas.Nota) - db_notas$db_notas.Nota
v <- db_notas$db_notas.Nota - median(db_notas$db_notas.Nota)

nota <- data.frame(u,v)

ggplot(nota, aes(x = sort(u), y = sort(v))) + 
  geom_point()

db_poluicao <- read.csv("cd-poluicao.csv", header = TRUE, sep = ";", dec = ",")
View(db_poluicao)

gds(db_poluicao$temp)

boxplot(db_poluicao$temp, pch = "*", col = "yellow", border = "black")

u <- median(db_poluicao$temp)-db_poluicao$temp
v <- db_poluicao$temp - median(db_poluicao$temp)


temp <- data.frame(u,
                   v)

ggplot(temp, aes( x = sort(u), y = sort(v))) +
  geom_point()

install.packages("MASS")
require(MASS)

sd(db_poluicao$temp)
mad(db_poluicao$temp)
