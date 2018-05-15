## Cap.2 - Packages

library("ggplot2")

qplot

# Let's make it for a spin = vamos dar uma volta
# qplot -> quick plots

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x

y <- x^3
y

# qplot
qplot(x, y)

x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)

# Criando a funçao para lançar os dois dados
roll <- function(bones = 1:6){
  dice <- sample(bones, size = 2, replace = T)
  sum(dice)
}

# Replicate prove uma forma de repetir um comando R multiplas vezes
# 1 - Primeiro argumento é o número de vezes que se quer repetir o comando

# Exemplo: repetir três vezes a soma 1 + 1
replicate(3, 1 + 1)

# Repetir o uso de nossa função roll 10x
replicate(10, roll())

# roll 1000x
rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)
help(sample)

# Criar lançamentos enviesados
roll2 <- function(bones = 1:6){
  dados <- sample(bones, size = 2, replace = T, prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dados)
}

# teste
rolls <- replicate(10000, roll2())
qplot(rolls, binwidth = 1)
