##--------------------------------
# Hands-On Programmin With R
# Garret Grolemund 
# O'Reilly Media Inc.
# Cap.3 - R Objects
##--------------------------------

# Iniciando no Projeto 2: Playing Cards
# A deck of playing cards (as cartas de um baralho)
# Which cards have been dealt
# (Quais as cartas foram distribuídas)
# Cap.3 - Construir um baralho de cartas

# Nosso dado é um vetor simples
die <- c(1, 2, 3, 4, 5, 6)
is.vector(die)

# Um único valor também é um vetor 
five <- 5
is.vector(five)

# Criando um vetor de inteiros
int <- c(1L, 5L)

# Criando um vetor de caracteres
text <- c("espadas", "copas")

print(int)
print(text)

# Descobrir o tipo de um dado
typeof(die)

# Especificando inteiros em um vetor
int2 <- c(-1L, -60L, 88L, 5L, 6L)

print(int2)


# Vamos atribuir a objetos R, nomes
# Esse é o atributo name em R
dados <- c(1, 2, 3, 4, 5, 6)
names(dados) <- c('um', 'dois', 'tres', 'quatro', 'cinco', 'seis')

# Observando os atributos
attributes(dados)
print(dados)

# Somar
dados + 1

# Para encerrar atributos basta atribuir NULL a este objeto R
names(dados) <- NULL
attributes(dados)

# Exemplo
eu <- c('Biologo', '34', 'Bioquímica', 'UFRN')
names(eu) <- c('Profissão', 'Idade', 'Área', 'Instituição')
print(eu)

# Matrices
m <- matrix(die, nrow = 2)
print(m)

# Matrizes em R possuem seus dados organizados em colunas
# É possível designar essa organização por linhas
# Para isso, usa-se a função adequada
m2 <- matrix(die, nrow = 2, byrow = TRUE)
print(m2)

m3 <- matrix(die, nrow = 3, byrow = TRUE); print(m3)

# Arrays
# Arrays são arranjos multidimensionais (n-dimensionais)
# Criando um array
# ar será um array 2 x 2 x 3 (duas linhas, duas colunas, em três slices)
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3)); print(ar)

# Exercício p.47
cartas <- c('ace', 'king', 'queen', 'jack', 'ten', replicate(5, 'spades')); print(cartas)
cartas_matrix <- matrix(cartas, nrow = 5); print(cartas_matrix)


















































