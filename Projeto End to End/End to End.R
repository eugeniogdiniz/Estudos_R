install.packages("ggplot2")
library(ggplot2)

# Você pode declarar variáveis utilizando "=" ou "<-"
x = "Hello Qoda!"
y <- "Hello Qoda!"
z =readline(prompt = "Qual é o seu nome?")
print(z)

#Tipos de Dados(básicos)
#Character(“Texto”) Neste tipo inserimos caracteres, podendo ser números, textos, símbolos…;
#Integer (1L) Integer se refere a números inteiros e utilizamos o “L” para determina-lo, diferente do Numeric, onde os números são decimais: 1.0 e não 1;
#Numeric (7.25) Números decimais, mesmo que declarando-os como 12, o sistema retornará 12.0, por exemplo.
#Logical (T/F ou TRUE/FALSE) Tipo de dado com retorno TRUE ou FALSE, assim como T ou F. TRUE quando atendidas as condições e FALSE quando não atendidas. Nos aprofundaremos logo logo neste tipo de dado: tenha paciência.

caract = "Texto caractere"
class(caract) 
#retorna 'character'

inteiro = 15L
class(inteiro) 
#retorna 'integer'

num = 15
class(num)
#retorna 'numeric'

#Estruturas de Dados

# VETOR 

vec = 3
is.vector(vec) #Retorna TRUE

# Para adicionar diversos elementos em 1 vetor, use c()
vec = c(1,2,3,"texto")
class(vec) #retorna character pois todos elementos serão do mesmo tipo

#LISTA
x = c("texto1","texto2")
y =  c(1,2,3)
z = c(T,F,T)
lista = c(x,y,z) 
class(lista)
#retorna: 'texto1' 'texto2' '1' '2' '3' 'TRUE' 'FALSE' 'TRUE'

#MATRIZ

mat = matrix(c(1,2), nrow = 1, ncol = 2, byrow = TRUE)
mat
#nrow se refere ao número de colunas e ncol se refere ao número de linhas
#byrow insere os elementos dentro de linhas quando TRUE ou em colunas, quando FALSE
#retorna: 1 2
mat

#DATAFRAME (estrutura para armazenar em forma de tabela)

x = data.frame(nome = c("Ana", "Weber", "Aquilies"),
               idade = c(24L, 27L, 2L),
               salario = c(12000,0,0))
#nrow(x) #retorna número de linhas do dataframe
#ncol(x) #retorna número de colunas do dataframe
dim(x) #retorna número de linhas e colunas

#CONDICIONAIS

if (3 > 0) {
 
    print("3 é maior que 0")
 
}

if (3 == 0) {
 
  print("3 = 0")
 
} else {
 
    print("3 não é igual a 0")
 
}

a = 1
b = 2
ifelse(a>0,"A maior que 0","A menor que 0")
#retorna A maior que 0

# FUNÇÕES R BASE
x = c(1,2,3,4,5,6,7,8,9,10)
sd(x) #desvio padrão
mean(x) #média
head(iris) #primeiras linhas dataframe
tail(iris) #ultimas linhas dataframe
file.choose() #abre pasta para caminho de arquivos

raizquadrada = function(x) {
  return(x*x)
}
raizquadrada(5)

#PACOTES

#Instala pacote
install.packages("ggplot2", dependencies=TRUE)

# Carrega pacote para ser utilizado no código
library(ggplot2)


###END TO END

## 1 ENTENDENDO O PROBLEMA
### Classificaçãode imagens 
#### Neste guia, treinaremos um modelo de rede neural para classificar imagens de roupas, como tênis e camisas. Tudo bem se você não entender todos os detalhes, esta é uma visão geral rápida de um programa Keras completo, com os detalhes explicados à medida que avançamos.

---

#![alt text](https://miro.medium.com/max/377/1*_fR-2Yg-xaWXssnj08Zqeg.jpeg)

# PACOTES
  
install.packages("devtools")  
install.packages("keras")
devtools::install_github("rstudio/keras")
devtools::install_github("rstudio/tensorflow")

library(tensorflow)

install_tensorflow ()

olá  <-  tf$constant("olá")
print(olá)

#CARREGAR

library(keras)
library(magrittr)

## 2 COLETA DE DADOS MNIST

---
#https://www.kaggle.com/zalando-research/fashionmnist<br>
#Este guia usa o conjunto de dados Fashion MNIST com 70.000 imagens em escala de cinza em 10 categorias. As imagens mostram artigos de vestuário individuais em baixa resolução (28 por 28 pixels), como pode ser visto aqui:<BR><BR>

#![alt text](https://github.com/zalandoresearch/fashion-mnist/raw/master/doc/img/embedding.gif)<br>
#O Fashion MNIST pretende substituir o conjunto de dados clássico do MNIST - frequentemente usado como o "Olá, Mundo" dos programas de aprendizado de máquina para visão computacional. O conjunto de dados MNIST contém imagens de dígitos manuscritos (0, 1, 2 etc.) em um formato idêntico aos artigos de vestuário que usaremos aqui. Este guia usa o Fashion MNIST para variedade e porque é um problema um pouco mais desafiador do que o MNIST comum. Ambos os conjuntos de dados são relativamente pequenos e são usados para verificar se um algoritmo funciona conforme o esperado. Eles são bons pontos de partida para testar e depurar código. Usaremos 60.000 imagens para treinar a rede e 10.000 imagens para avaliar com que precisão a rede aprendeu a classificar imagens. Você pode acessar o Fashion MNIST diretamente do Keras.

fashion_mnist <- dataset_fashion_mnist()
  
fashion_mnist <- dataset_fashion_mnist()
c(train_images, train_labels) %<-% fashion_mnist$train
c(test_images, test_labels) %<-% fashion_mnist$test

# Temos quatro matrizes: as matrizes "train_images" e "train_labels" são o conjunto de treinamento - os dados que o modelo usa para aprender. O modelo é testado em relação ao conjunto de testes: as matrizes "test_images" e "test_labels". As imagens são matrizes 28x28, com valores de pixel que variam entre 0 e 255. Os rótulos são matrizes de números inteiros, variando de 0 a 9. Eles correspondem à classe de roupa que a imagem representa.

## 3 TRAIN/TEST

#![alt text](data:image/png;base64,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)

#4 EXPLORAÇÃO DOS DADOS

#Cada imagem é mapeada para um único rótulo. Como os nomes das classes não estão incluídos no conjunto de dados, os armazenaremos em um vetor para uso posterior na plotagem das imagens

class_names = c('Camiseta',
                'Calça',
                'Suéter',
                'Vestido',
                'Casaco', 
                'Sandália',
                'Camisa',
                'Tênis',
                'Mochila',
                'Ankle boot')
dim(train_images) #mostra a dimensão das imagens de treinamento
dim(train_labels)
train_labels
dim(test_images)
dim(test_labels)


### 5 PRE-PROCESSAMENTO DOS DADOS

#Os dados devem ser pré-processados antes de treinar a rede. Se você inspecionar a primeira imagem no conjunto de treinamento, verá que os valores de pixel caem no intervalo de 0 a 255.

#Essa etapa do projeto você tem que avaliar se os dados estão em intervalos relevantes

install.packages("tidyr")
library(tidyr)
install.packages("colorspace")
library(colorspace)
install.packages("ggplot2")
library(ggplot2)

image_1 <- as.data.frame(train_images[5, , ]) #adiciona ao objeto "image_1" o banco de dados "train_images" onde [numero, , ] diz respeito a qual imagem você irá trabalhar no banco de dados
colnames(image_1) <- seq_len(ncol(image_1)) #altera o nome das colunas para uma sequencia de numeros inteiros maiores que zero
image_1$y <- seq_len(nrow(image_1)) #adiciona um nome para cada linha, sendo esse nome uma sequencia de numeros inteiros maiores que zero.
image_1 <- gather(image_1, "x", "value", -y) #Une os valores de x(linha) e y(coluna) em um novo banco de dados (lebra bastante pontos cardeais)
image_1$x <- as.integer(image_1$x)

ggplot(image_1, aes(x = x, y = y, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "black", na.value = NA) +
  scale_y_reverse() +
  theme_minimal() +
  theme(panel.grid = element_blank())   +
  theme(aspect.ratio = 1) +
  xlab("") +
  ylab("")

# Nós escalamos esses valores para um intervalo de 0 a 1 antes de alimentar o modelo de rede neural. Para isso, simplesmente dividimos por 255. É importante que o conjunto de treinamento e o conjunto de testes sejam pré-processados da mesma maneira:
# Divide-se por 255 pois esse é o maior numero de pixels

train_images <- train_images / 255
test_images <- test_images / 255

par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:15) { 
  img <- train_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste(class_names[train_labels[i] + 1]))
}

## 6 FEATURE ENGINEERING, OUTLIERS... ?!

#![alt text](https://blog.exxactcorp.com/wp-content/uploads/2019/10/pasted-image-0.png)

# A principal diferença de Deep Learning para Machine Learning é que o Deep Learning não necessita de um tratamento de dados tão grande

## 8 MODELO PREDITIVO
#A construção da rede neural requer a configuração das camadas do modelo e sua compilação. O elemento básico de uma rede neural é a camada. As camadas extraem representações dos dados alimentados a elas. E, esperançosamente, essas representações são mais significativas para o problema em questão. A maior parte do aprendizado profundo, ou deep learning, consiste em encadear camadas simples. A maioria das camadas, como "layer_dense", possui parâmetros que são aprendidos durante o treinamento.

model <- keras_model_sequential()
model %>%
  layer_flatten(input_shape = c(28, 28)) %>% # A primeira camada nesta rede, "layer_flatten", transforma o formato das imagens de um array 2D (de 28 por 28 pixels) para um array 2D de 28*28 = 784 pixels. Pense nessa camada como uma desempilhadora de linhas de pixels na imagem e a seguir realinhando-as. Esta camada não tem parâmetros para aprender; apenas reformata os dados. Depois que os pixels são achatados, a rede consiste em uma sequência de duas camadas densas. São camadas neurais densamente conectadas ou totalmente conectadas.
  layer_dense(units = 128, activation = 'relu') %>% #A primeira camada densa possui 128 nós (ou neurônios).
  layer_dense(units = 10, activation = 'softmax') #A segunda (e última) camada é uma camada de softmax de 10 nós - retorna uma matriz de 10 pontuações de probabilidade que somam 1. Cada nó contém uma pontuação que indica a probabilidade de a imagem atual pertencer a uma das classes de 10 dígitos.0

## 9 COMPILANDO O MODELO

#Antes do modelo estar pronto para o treinamento, ele precisa de mais algumas configurações. Eles são adicionados durante a etapa de compilação do modelo: 
 

model %>% compile(
  optimizer = 'adam', #* Otimizador - é assim que o modelo é atualizado com base nos dados que ele vê e em sua função de perda. 
  loss = 'sparse_categorical_crossentropy', #* Loss Function - mede a precisão do modelo durante o treinamento. Queremos minimizar essa função para "orientar" o modelo na direção certa. 
  metrics = c('accuracy') #* Métricas - usadas para monitorar as etapas de treinamento e teste. O exemplo a seguir usa Acurácia: fração das imagens que são classificadas corretamente.

)

# Error in py_call_impl(callable, dots$args, dots$keywords): RuntimeError: Evaluation error: invalid argument type.
# https://github.com/keras-team/keras/issues/13827

model %>% fit(train_images, train_labels, epochs = 5, verbose = 2)

##  11 AVALIAR ACURÁCIA
# Nouvelle section
  
#Acontece que a precisão no conjunto de dados de teste é um pouco menor que a precisão no conjunto de dados de treinamento. Essa lacuna entre a precisão do treinamento e a precisão do teste é um exemplo de OVER-FITTING, quando um modelo apresenta desempenho muito baixo em novos dados do que em seus dados de treinamento.

score <- model %>% evaluate(test_images, test_labels, verbose = 0)

cat('Test loss:', score$loss, "\n")
cat('Test accuracy:', score$acc, "\n")

## 12 OVERFITTING
#![alt text](https://3gp10c1vpy442j63me73gy3s-wpengine.netdna-ssl.com/wp-content/uploads/2018/03/Screen-Shot-2018-03-22-at-11.22.15-AM-e1526498075543.png)

## 13 REALIZANDO PREDIÇÕES

#Uma previsão é uma matriz de 10 números. Eles descrevem a “confiança” do modelo de que a imagem corresponde a cada um dos 10 diferentes itens de vestuário. Podemos ver qual rótulo tem o maior valor de confiança:
predictions <- model %>% predict(test_images) 

#Como alternativa, também podemos obter diretamente a previsão de classe:
which.max(predictions[1, ]) 

class_pred <- model %>% predict_classes(test_images)
class_pred[1:20]

par(mfcol=c(5,5))
par(mar=c(0, 0, 1.5, 0), xaxs='i', yaxs='i')
for (i in 1:25) { 
  img <- test_images[i, , ]
  img <- t(apply(img, 2, rev)) 
  # subtract 1 as labels go from 0 to 9
  predicted_label <- which.max(predictions[i, ]) - 1
  true_label <- test_labels[i]
  if (predicted_label == true_label) {
    color <- '#008800' 
  } else {
    color <- '#bb0000'
  }
  image(1:28, 1:28, img, col = gray((0:255)/255), xaxt = 'n', yaxt = 'n',
        main = paste0(class_names[predicted_label + 1], " (",
                      class_names[true_label + 1], ")"),
        col.main = color)
}

# Grab an image from the test dataset
# take care to keep the batch dimension, as this is expected by the model
img <- test_images[25, , , drop = FALSE]
dim(img)

predictions <- model %>% predict(img)
predictions

# subtract 1 as labels are 0-based
prediction <- predictions[1, ] - 1
which.max(prediction)

class_pred <- model %>% predict_classes(img)
class_pred
