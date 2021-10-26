# This is where you change variables to manipulate the model
setwd("./")
source("source/FunctionSourcer.R")

#############################################
landscape = 10

# Variables used in the CreateSquare Function
food.probability = 0.5

energy = 10
energy.sd = 2

temperature = 85 
temperature.sd  = 10

# Need to work this out still, what does population.denity equate too?
population.density = 3

#############################################
#############################################
# Variables for creating individuals
sex.ratio = 0.5
start.energy  = 10
start.energy.sd = 2
start.fitness = 1.0


test.landscape <- CreateLandscape(landscape, food.probability, energy.sd, energy)
test

test.square <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

test.ind = matrix(nrow = pop.size, ncol = 5)
for (snake in 1:pop.size){
    test.ind[snake,] = CreateInd(sex.ratio,start.energy,start.energy.sd)
    # new.snake <- CreateInd(sex.ratio,start.energy,start.energy.sd)
    # append(test.ind, new.snake)
}
test.ind
