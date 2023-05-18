cd_municipios = read.csv("cd-municipios.csv", header = TRUE, sep = ";", dec = ",", stringsAsFactors = FALSE)
View(cd_municipios)
summary (cd_municipios)
pop = boxplot(cd_municipios$População)
install.packages("plotly")
library(plotly)

pop = ggplot(cd_municipios, aes(y = População)) +
  geom_boxplot() + 
  ggtitle("Figura 3.7 Box Plot com R") +
  ylab("População")

ggplotly(pop)

#Problemas

cd_empresa = read.csv("cd-empresa.csv", header = TRUE, sep = ";", dec = ",", stringsAsFactors = FALSE)
View(cd_empresa)
summary(cd_empresa)

sal = ggplot(cd_empresa, aes(y = Salario..x.Sal.Min.)) +
  geom_boxplot() + 
  ggtitle("Box Plot Salário") + 
  ylab("Salário")

ggplotly(sal)
