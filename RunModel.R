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

# Something wonky here that causes negative values
# had the energy and energy.sd backwards
test.landscape <- CreateLandscape(landscape, food.probability, energy, energy.sd)
test.landscape


test.square <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
test.square
test.square[1,4] <- test.square[1,4] + 1

pop.size = 10
test.ind = matrix(nrow = pop.size, ncol = 5)
for (snake in 1:pop.size){
    test.ind[snake,] = CreateInd(sex.ratio,start.energy,start.energy.sd)
    # new.snake <- CreateInd(sex.ratio,start.energy,start.energy.sd)
    # append(test.ind, new.snake)
}
test.ind

# Three nested loops to run the model 
# first one will control the parameters
# some object will hold the pairwise comparison values 
# second controls the replicates
# probably going to replicate 100 times
# third controls the steps
# figure out how long to run

# for (p in 1:nrow(parameters)){
        # Track the parameters here
#     for (r in 1:replicates){
#         for (y in 1:years){
#             Slick code doing slick things
#         }
#     }
# }


# Add in a density probability to determine how many snakes are on the landscape pop size / cell count

# Have density impact food count in some way 
# Track cells and movements for each individual
# 
# 

