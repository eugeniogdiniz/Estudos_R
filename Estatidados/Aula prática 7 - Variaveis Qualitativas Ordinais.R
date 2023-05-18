classe_social=c("A","B","C","D","E")
grau_instrucao=c("Ensino fundamental","Ensino médio", "Ensino superior")
estagio_doenca=c("Estagio inicial","Estagio intermediario","Estagio terminal")
meses=c("Janeiro","Fevereiro","Março")
ranking=c("Primeiro","Segundo","Terceiro")

a_classe_social=sample(classe_social, size = 100, replace = TRUE)
a_grau_instrucao=sample(grau_instrucao, size = 100, replace = TRUE)
a_estagio_doenca=sample(estagio_doenca, size = 100, replace = TRUE)
a_meses=sample(meses, size = 100, replace = TRUE)
a_ranking=sample(ranking, size = 100, replace = TRUE)

variavel_categorica_ordinal=data.frame(a_classe_social,
                                       a_grau_instrucao,
                                       a_estagio_doenca,
                                       a_meses,
                                       a_ranking)

View(variavel_categorica_ordinal)

#Pizza frequencia simples

df_pizza_tab=table(variavel_categorica_ordinal$a_classe_social) #utilizado para criar em linhas a variavel a ser analisada e sua frequencia (coluna e quantidade de repetições)
df_pizza=as.data.frame(df_pizza_tab) #cria uma tabela de frequencia simples
df_pizza
#para adicionar mais variaveis basta acrescentar uma "," em table()

pie(df_pizza$Freq,
    labels=paste(df_pizza$Var1,df_pizza$Freq), #o comando "paste" concatena os valores de duas variaveis
    main="Grafico de pizza do número de pessoas por classe social") #o comando "main" é o título do gráfico

#Pizza frequencia relativa

df_pizza_porcent=prop.table(df_pizza_tab) #o comando "prop.table" trás a proporção dos valores em seu todo
df_pizza_porcent=data.frame(df_pizza_porcent)
df_pizza_porcent

pie(df_pizza_porcent$Freq,
    labels=paste(df_pizza_porcent$Var1,df_pizza_porcent$Freq*100,"%"), #A "," define os valores que serão concatenados
    main = "Grafico de pizza = Frequência relativa classe social (%)")

grafico_pizza_interativo = plot_ly(df_pizza, #aqui irá o data.frame que será utilizado
             labels = ~Var1, #utilizo o "~" para indicar qual coluna será utilizada 
             values = ~Freq,
             type = "pie") %>%
             layout(title = "Frequência relativa da classe social (%)")

grafico_pizza_interativo

#Gráfico de colunas ou barras verticais

grafico_coluna = ggplot(variavel_categorica_ordinal,aes(a_classe_social)) +
  geom_bar(position = "dodge") + 
  ggtitle("Numero de pessoas por classe social") + 
  xlab("Classe social") +
  ylab("Numero de pessoas (frequencia simples)")

ggplotly(grafico_coluna)

#Gráfico de colunas ou barras verticais com frequencia relativa

grafico_coluna_porcent = ggplot(variavel_categorica_ordinal,aes(a_classe_social)) +
  geom_bar(position = "dodge",aes(y=(..count..)/sum(..count..))) + 
  ggtitle("Numero de pessoas por classe social") +
  scale_y_continuous(labels = percent) +
  xlab("Classe social") +
  ylab("Numero de pessoas (frequencia simples) %")

ggplotly(grafico_coluna_porcent)

#Gráfico de colunas ou barras verticais empilhadas com frequencia relativa e grau de instrução

grafico_coluna_empilhada = ggplot(variavel_categorica_ordinal,aes(a_classe_social,fill = a_grau_instrucao)) +
  geom_bar(position = "fill") + 
  ggtitle("Numero de pessoas por classe social") +
  scale_y_continuous(labels = percent) + #Esse comnando informa que o tipo de valor que será apresentado
  xlab("Classe social") +
  ylab("Numero de pessoas (frequencia simples) %")

ggplotly(grafico_coluna_empilhada)

#Gráfico de colunas ou barras verticais empilhadas com 
#frequencia relativa e grau de instrução separados

grafico_coluna_empilhada_por_grau_instrucao = grafico_coluna_porcent + facet_grid(~a_grau_instrucao)

ggplotly(grafico_coluna_empilhada_por_grau_instrucao)

grid.arrange(grafico_coluna,
             grafico_coluna_empilhada,
             grafico_coluna_empilhada_por_grau_instrucao,
             grafico_coluna_porcent, nrow = 2, ncol = 2)