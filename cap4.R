# Cap.4 - R notation

# Relembrar como criar um data frame
df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"), 
                 value = c(1, 2, 3))
df

# Data frame 
wash <- data.frame(formação = c('Biologia', 'Farmácia', 'Bioquímica'),
                   instituição = c('UFPB', 'UFRN', 'UFRN'),
                   ano = c(2006, 2019, 2019))

wash

# Data frame
musica <- data.frame(disco = c('Neruda', 'The Wall', 'Vision'), 
                     banda = c('Red Rider', 'Pink Floyd', 'Truckfighters'),
                     ano = c(1980, 1978, 2017))

musica

# Data Frame
alport <- data.frame(Genes = c('COL4A3', 'COL4A4'), 
                     Variante = c('Stop Codon', 'Heterosigosidade'),
                     Família = c('Fam1/Fam2', 'Fam1/Fam2'))

alport

# Baixar o arquivo deck_CSV do livro:
# http://bit.ly/deck_CSV
# 1. Clicar em 'Import Dataset'
# 2. Escolher a opção 'From text file'
# 3. Retirar a marcação do box 'String as Factors'
# Se deixar marcado o box 'String as Factors, ao importar
# os dados, R os converterá em Factors.
# Desmarcando, o R manterá como strings.

head(deck)

# Salvando uma cópia de deck como um arquivo .csv
write.csv(deck, file = "cards.csv", row.names = FALSE)
# row.names = F, previnirá R de colocar uma coluna adicional.
# contendo números, no início do data frame.

### R Notation
head(deck)
deck[1,]   # Primeira linha, valores de todas as colunas
deck[,1]   # Todas as linhas da primeira coluna

vec <- c(6,1,3,6,10,5)
vec[5]
vec[1:3]
# Lembrar que é diferente em Python.


# Selecionar duas ou mais coluna, retorna um data frame.
deck[1:2, 1:2]

# Selecionar uma única coluna retorna um vetor.
deck[1:2, 1]

# Para retornar um data frame, mesmo selecionando uma única coluna
# use o argumento (drop = FALSE)
deck[1:2, 1, drop = FALSE]

## Usar inteiros negativos para indexar exclui os valores selecionados
# Ao usar um negative integer R retornará os elementos, exceto aqueles 
# especificados como negative integers.

# Por exemplo, para visualizar a primeira linha faríamos:
deck[1, ]

# Com negative integers:
deck[-(2:52), ]   # Excluirá da visualização as linhas 2 a 52

# Fornecer T e F para selecionar o que se quer ver:
# vec <- c(6, 1, 3, 6, 10, 5)
vec[c(F, T, F, T, F, T)]  # F = não ver, T = ver

## Por nome
deck[1, c('face', 'suit', 'value')]

## Deal a card
deal <- function(cards){
  cards[1, ]
}

# Usando a função deal
# O objeto será passado como argumento para o parâmetro interno 'card'
deal(deck)

# Extrair cada linha do deck de cartas:
deck2 <- deck[1:52, ]
head(deck2)

# aleatorizando o processo de retirar cartas do deck:
# 1. Passa o valor aleatorizado de cartas para variável random.
random <- sample(1:52, size = 52)

# Cada linha da primeira até a 52 (representado as cartas do deck)
# terá o valor aleatorizado passado para variável random, 
# a qual será usada para obter cartas de deck:
# 2. Cartas em deck:
deck4 <- deck[random, ]    # Os valores aleatorizados de linhas, todas as colunas
deck4

# função
shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}

shuffle(deck)


# Refazendo
embaralhar <- function(cartas){
  aleatorio <- sample(1:52, size = 52)
  cartas[aleatorio, ]
}

# ver cartas
embaralhar(deck)

## Extrair valores de Data Frames e Lists com $
deck$face
deck$suit
deck$value

# Veja como facilita. Encontrar as médias de valores:
mean(deck$value)

# Exemplo:
notas_semestre <- data.frame(Bromatologia = c(8.0, 6.0, 5.5),
                             Avaliação = c(1, 2, 3))
notas_semestre
mean(notas_semestre$Bromatologia)

# Com listas
lst <- list(numbers = c(1, 2),
            logical = TRUE, 
            strings = c('a', 'b', 'c'))
lst

# Retorna listas:
lst[1]
lst[2]
lst[3]

# Retorna valores:
lst$numbers
lst$logical
lst$strings

# O mesmo que a notação $ é usar colchetes duplos
lst[[1]]
lst[[2]]
lst[[3]]

sum(lst$numbers)
sum(lst[[1]])
