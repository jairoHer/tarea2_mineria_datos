library(arules)
library(dplyr)

setwd("C:/Users/jairo/Documents/Maestria/Cuarto Trimestre/Introduccion a la mineria de datos/Ejercicio Apriori/db_csv_/db_csv_")
dir()

data <- read.csv('PERSONA_BDP.csv',sep = ",")

names(data)

#Dio problemas las columna PEA, asi que la borramos
data <- data %>% select(-PEA)

names(data)

#Tambien dio problemas las columna POCUPA, asi que la borramos
data <- data %>% select(-POCUPA)

names(data)

#Tambien dio problemas las columna PEI, asi que la borramos
data <- data %>% select(-PEI)

names(data)

#Me dio problemas por el tamaño de la data, y la cantidad de memoria RAM que consume :c
#Asi que lo delimitare solo por el departamento de El Progreso
data <- subset(data, DEPARTAMENTO == 2)

#borramos columna departamento
data <- data %>% select(-DEPARTAMENTO)

names(data)

#Creamos las reglas de apriori
reglas <- apriori(data, parameter = list(support=0.2, confidence=0.5))

inspect(reglas[0:100]) #Aca se encontro la primer regla de asociacion, en la posicion 91
inspect(reglas[800:900]) #Aca se encontro la segunda regla de asociacion, en la posicion 51
inspect(reglas[1300:1400]) #Aca se encontro la tercera regla de asociacion, en la posicion 8

