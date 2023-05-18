Func = c(seq(from = 1, to = 25))
Seção = c(rep("P",7), rep("T",7), rep("V",11))
Administr = c(rep(8,3),6,rep(8,3),10,8,rep(8,3),6,10,rep(8,3),rep(6,3),8,6,rep(8,3))
Direito = c(rep(9,25))
Redação = c(8.6,7.0,8.0,8.6,8.0,8.5,8.2,7.5,9.4,7.9,8.6,8.3,7.0,8.6,8.6,9.5,6.3,7.6,6.8,7.5,7.7,8.7,7.3,8.5,7.0)
Estatíst = c(rep(9,2),rep(8,2),9,10,rep(8,2),9,8,10,rep(7,2),rep(9,2),7,8,9,4,rep(7,2),8,10,rep(10,2))
Inglês = sample(c("A","B","C","D"), size=25, replace=TRUE)
Metodologia = sample(c("A","B","C","D"), size=25, replace=TRUE)
Politica = c(9,6.5,9,6,6.5,6.5,9,6,10,9,10,6.5,6,10,10,6,6,6,6.5,6,9,6.5,9,9,10)
Economia = sample(c(8.5,9,10,7,7.5), size = 25, replace = TRUE)

teste = data.frame(Func, Seção, Administr,
                   Direito, Redação, Estatíst,
                   Inglês, Metodologia, Politica,
                   Economia)

hist_d = hist(teste$Direito, col = "yellow", xlab = "Nota", ylab = "Frequencia", border = "white")
stem(teste$Direito)

hist_p = hist(teste$Politica, col = "red", xlab = "Nota", ylab = "Frequencia", border = "white")
stem(teste$Politica)

hist_e = hist(teste$Estatíst, col = "blue", xlab = "Nota", ylab = "Frequencia", border = "white")
stem(teste$Estatíst)