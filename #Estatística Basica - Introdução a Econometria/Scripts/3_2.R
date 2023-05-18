erros = c(0,1,2,3,4)
freq = c(25,20,3,1,1)
erro_freq = c(erros*freq)
problema1 = data.frame(erros,freq,erro_freq)
problema1
media = (sum(erro_freq)/ sum(freq))
dm = sum(c(erros-media))/sum(freq)
var = sum(c(erros-media)^2)/sum(freq)
dp = sqrt(var)
media
dm
var
dp
install.packages("ggplot2")
library(ggplot2)
plot(problema1$freq, xlab = "erros", ylab = "freq")