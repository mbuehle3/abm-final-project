# This is where you change variables to manipulate the model
setwd("./")
source("source/FunctionSourcer.R")

#############################################
# Variables used in the CreateSquare Function
food.probability = 0.5

energy = 10
energy.sd = 2

temperature = 85 
temperature.sd  = 10

# this is done in snakes per cell on average
popualation.density = 3

#############################################
#############################################
# Variables for creating individuals
sex.ratio = 0.5
start.energy  = 10
start.fitness = 1.0


test <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd)
test
