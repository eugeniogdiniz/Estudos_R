require(ggplot2)
require(dplyr)
require(scales)
require(plotly)
require(gridExtra)
require(tidyverse)
require(esquisse)

dados=iris
dados2=economics

grafico_hist_2 = ggplot(dados) +
  aes(x = Sepal.Length) +
  geom_histogram(bins = 30L, fill = "#75b8d1") +
  labs(x = "Tamanho das Sépalas", y = "Frequência Simples", title = "Histograma do tamanho das Sépalas das plantas") +
  theme_minimal()

grafico_hist_especie = ggplot(dados) +
  aes(x = Sepal.Length, fill = Species) +
  geom_histogram(bins = 30L) +
  scale_fill_hue() +
  labs(x = "Tamanho das Sépalas", y = "Frequência Simples", title = "Histograma do tamanho das Sépalas das plantas por espécie") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_dispersao_tamanho2 = ggplot(dados) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point(size = 3L) +
  scale_color_hue() +
  labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
  theme_minimal()

grafico_dispersao_especie2 = ggplot(dados) +
  aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
  geom_point(size = 3L) +
  scale_color_hue() +
  labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_boxplot2 = ggplot(dados) +
  aes(x = "", y = Sepal.Length, fill = Species) +
  geom_boxplot() +
  scale_fill_hue() +
  labs(x = "Tamanho das Sépalas", y = "Tamanho das Pétalas", title = "Gráfico de dispersão do tamanho das Sépalas vs o tamanho das Pétalas") +
  theme_minimal() +
  facet_wrap(vars(Species))

grafico_linha2 = ggplot(dados2) +
  aes(x = date, y = unemploy) +
  geom_line(size = 1.3, colour = "#e41a1c") +
  labs(x = "Ano", y = "Numero de Desempregados", title = "Desemprego dos EUA ao longo dos anos") +
  theme_minimal()

grid.arrange(grafico_boxplot2,
             grafico_dispersao_especie2,
             grafico_dispersao_tamanho2,
             grafico_hist_2,
             grafico_hist_especie,
             grafico_linha2, nrow = 3, ncol = 2)