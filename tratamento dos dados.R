#===============================================================================
#=====================Script da atividade 1 consultoria ========================
#===============================================================================


# vamos chamar os dados para isso  vamos usar o pacote'readods'

#devtools::install_github("chainsawriot/readODS")

library(readODS)

dados<-read_ods("banco de dados.ods",col_names = TRUE)


dados<-dados[1:15]
library(readxl)
library(dplyr)

#dados<-read_excel("banco de dados.xlsx")


#vamos limpar os dados
glimpse(dados)
#Dar nomes corretos as colunas
colnames(dados) <-c("GRUPO","IDADE","PESO","ALTURA","IMC","Espessura direita Pré","Espessura direita pós",
                    "Espessura esquerda Pre","Espessura esquerda Pós","Elasticidade direita pré",
                    "Elasticidade direita pós","Elasticidade esquerda pré",
                    "Elasticidade esquerda pós","Eletromiografia, Mastigação livre direita pré",
                    "Eletromiografia, Mastigação livre direita pós")
                   # "Eletromiografia, Mastigação livre esquerda pré",
                   # "Eletromiografia, Mastigação livre esquerda pós",
                    #"Eletromiografia, Mastigacao a Direita, Direita pré","Eletromiografia, Mastigacao a Direita, Direita pós",
                    ##"Eletromiografia, Mastigacao a Direita, Esquerda pré","Eletromiografia, Mastigacao a Direita, Esquerda pós",
                    #"Eletromiografia, Mastigacao a Esquerda, Esquerda pré","Eletromiografia, Mastigacao a Esquerda, Esquerda pos",
      # "Eletromiografia, Mastigacao a Esquerda, Direita pré","Eletromiografia, Mastigacao a Esquerda, Direita pós")
head(dados)

dados<-dados[-1,]



# covertendo as variaveis 

dados$GRUPO<-factor(dados$GRUPO, levels = c("1", "2","3","4"))

is.factor(dados$GRUPO)


# covertendo as varriaveis numericas 

dados[2:15]<-sapply(dados[2:15],as.numeric)


#table(dados$GRUPO,dados$IDADE)

summary(dados)


cor(dados[2:15])

library(xlsx)
write.csv(dados,"dados.csv")

