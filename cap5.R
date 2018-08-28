# Cap.5 - Modifying Values

# Copiar o deck para outra variável.
deck2 <- deck

head(deck2)
# Adicionando novas variáveis ao dataset
deck2$new <- 1:52
head(deck2)

# Para remover elementos de um data frame:
# Remover uma coluna: atribuir NULL a coluna:
deck2$new <- NULL
head(deck)
deck2

shuffle2 <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}


shuffle2(deck)
# Como seria utilizando a função dentro do index
deck[sample(1:52, size = 52), ]

deck2$new <- 1:52
head(deck2)

deck2$new <- NULL

# Os ases aparecem a cada 13 cartas
deck2[c(13, 26, 39, 52), ]
deck2$value[c(13, 26, 39, 52)]
deck2$value

# Atribuir novos valores a cada um destes especificados 
# para mudar de tipo de jogo de cartas.
deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
deck2$value[c(13, 26, 39, 52)]
head(deck2, 13)

# A mesma técnica funcionará para vetor, matriz, array, lists ou data frame.
# Descreva os valores que você quer modificar com a notação R acima, e então,
# associe-os com o operado R "<-".

## Testes lógicos
'a' %in% c('a', 'b', 'c')
'a' != 'b'
'a' != 'a'

c(1, 2) %in% c(3, 4, 5)
c(1, 2, 3, 4) %in% c(3, 4, 5)

## Exercicio, p.82
# Extrair os valores da coluna face e comparar se os mesmos
# são iguais a 'ace'.
deck$face
deck$face == 'ace'
# Como saber quantos TRUE?
sum(deck2$face == 'ace')

### Veja o passo a passo.
## 1. Logical para encontrar um valor (p.82-83).
deck2$face == 'ace'

## 2. Somar os valores TRUE (indicam cada 'ace').
sum(deck2$face == 'ace')

## 3. Usar o método acima para identificar e alterar os ases nas cartas.
deck3 <- deck
deck3$face == 'ace'
# a. Usar o teste para destacar os ases ('aces') nas cartas
# b. O teste retorna valores lógicos: 1 - TRUE; 0 - FALSE.
# c. Usar o próprio teste como índice.
deck3$value[deck3$face == 'ace' ]

## 14. Atribuir um novo valor aos valores desejados.
# No caso, os ases passam a ter valor 14.
deck3$value[deck3$face == 'ace']
deck3$value[deck3$face == 'ace'] <- 14
head(deck3, 13)

## Concluindo: usar teste lógico para selecionar valores dentro de objetos.

### Novo Jogo: hearts
## Cada carta tem valor zero.
deck4 <- deck
deck4$value <- 0
head(deck4, 13)
deck4$value

sum(deck4$face == 'ace')
deck3$face == 'ace'
sum(deck3$face == 'ace')

## Exercício , p.84
# Atribuir o valor 1 a cada carta de copas.
deck4$suit
deck4$suit == 'hearts'
deck4$value[deck4$suit == 'hearts']

# Achar todos os valores nas variáveis.
# Achar todas as cartas de copas:
deck4[deck4$suit == 'hearts', ]
# Achar todas as cartas de espadas:
deck4[deck4$suit == 'spades', ]
# Achar todas as cartas de paus:
deck4[deck4$suit == 'clubs', ]
# Achar todas as cartas de ouro:
deck4[deck4$suit == 'diamonds', ]

# Achar as cartas de ases:
deck4[deck4$face == 'ace', ]

# Atribuir um novo valor (coluna $value) as cartas de copas (coluna $suit):
deck4$value[deck4$suit == 'hearts'] <- 1
deck4

# Atribuir 13 a carta Rainha de Espadas.
### Boolean operator
# Usar um operdor booleano para encontrar uma Rainha de Espadas.
deck4$face == 'queen' & deck4$suit == 'spades'
# Salvar o resultado do teste em seu próprio objeto.
queenOfspades <- deck4$face == 'queen' & deck4$suit == 'spades'
queenOfspades
deck4[queenOfspades, ]
deck4$value[queenOfspades]
# Agora que temos a Rainha de Espadas, vamos modificar seu valor:
deck4$value[queenOfspades]
deck4$value[queenOfspades] <- 13
deck4$value[queenOfspades]
deck4[deck4$face == 'queen', ]
# Utilizando Logical subsetting e Boolean operators:
deck4[deck4$face == 'queen' & deck4$suit == 'spades', ]


## Exercício, p.87
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- 'February'
z <- c('Monday', 'Tuesday', 'Friday')

# .1 w é positivo?
w > 0

# 2. x é maior que 10 e menor que 20?
x > 10 & x < 20

# 3. O objeto y é a palavra 'February'?
10 < x & x > 20
y == 'February'

# 4. Todo valor de zé um dia da semana?
all(z %in% c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))

### Blackjack
# 1. Cada carta numerada possui valor igual a seu número;
# 2. Cada carta contendo uma face (reis, damas e valetes) vale 10;
# 3. Cada um dos ases vale 11 ou 1, dependendo do resultado final do jogo;
deck5 <- deck
head(deck5, 13)

# Mudar o valor das cartas com faces usando %in%.
deck5$face %in% c('king', 'queen', 'jack')
facecard <- deck5$face %in% c('king', 'queen', 'jack')
deck5[facecard, ]

# Valores 13, 12, 11 de king, queen, jack.
deck5$value[facecard]

# Todas as linhas com facecards. 
deck5[facecard, ]

# Modificando o valor de cartas com faces.
deck5$value[facecard] <- 10
head(deck5, 13)

### Missing Information
# NA -> Not Available.
# NA pode ser usado para substituir informação faltante.

## na.rm -> função para lidar com objetos que contenham valores NA.
## Isso ajudará na hora de calculos e estatísticas, pois, não retirando-se
## os valores NA, o retorno será sempre um NA.

# Checando NA values:
na_val <- c(1, 2, 55, NA)
is.na(na_val)

## Modificando os valores de ases no deck5 para NA:
deck5$face == 'ace'
deck5$value[deck5$face == 'ace']
deck5$value[deck5$face == 'ace'] <- NA
head(deck5, 13)
