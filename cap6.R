# Cap.6 - Envinronments
library(pryr)

# Pode-se ver o ambiente de R utilizando a função parenvs no pacote pryr.
# parenvs(ALL = TRUE) retornará a lista de ambientes que a sessão R está usando.
parenvs(all = TRUE)

# Retornar uma lista de ambientes que a sessão R está usando.
parenvs(all = TRUE)

as.environment('package:pryr')
as.environment('package:stats')

globalenv()
baseenv()
emptyenv()

parent.env(globalenv())
ls(emptyenv())
ls(globalenv())
ls(baseenv())

# É possível salvar um objeto ou criar um objeto e atribui-lo a um ambiente.
assign('new', 'Hello Global', envir = globalenv())
globalenv()$new
assign('wash', 'Washington Candeia de Araujo', envir = globalenv())
globalenv()$wash

# Função antiga
roll <- function(){
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

roll()
replicate(10, roll())

# Função para explorar os ambientes R runtime environment (ambiente de tempo de execução).
# runtime environment - ambiente de tempo de execução.
show_env <- function(){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

environment(show_env)

# Objetos no corpo da função show_env
show_env <- function(){
  a <- 1
  b <- 2
  c <- 3
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

foo <- 'Take me to your runtime'

show_env <- function(x = foo){
  list(ran.in = environment(),
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()

# Continuar, p.104
deal <- function() {
  deck[1, ]
  
}



environment(deal)

deal()

# DECK
DECK <- deck
deck <- deck[-1, ]
head(deck, 3)

deal <- function(){
  card <- deck[1, ]
  deck <- deck[-1, ]
  card
}

deal()

deal <- function(){
  card <- deck[1, ]
  assign('deck', deck[-1, ], envir = globalenv())
  card
}

deal()

shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}

head(deck, 3)


shuffle(deck)

shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign('deck', DECK[random, ], envir = globalenv())
}

shuffle()
deal()


## Closures

setup <- function(deck){
  DECK <- deck
  
  DEAL <- function(){
    card <- deck[1, ]
    assign('deck', deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign('deck', DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

shuffle

deal

shuffle()
deal()