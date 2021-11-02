# This script will be used to generate the values found in a square that the agent may move onto.
# Values for the distributions will be designated in the RunScript file in the base directory


CreateSquare = function(food.probability, energy, energy.sd, temperature, temperature.sd, population.density,counter.init=0){

cell = matrix(ncol =  5, nrow = 1)

# cell

# ?matrix
food.probability = .5


energy = 10
energy.sd = 2


has.food = rbinom(1,1,food.probability)
if (has.food == 1){
    cell[1,1] = round(rnorm(n = 1, mean = energy, sd =  energy.sd))
} else if (has.food == 0) {
    cell[1,1] = 0
}
cell

# temp = 85
# temp.sd = 10
cell[1,2] = rnorm(1, mean = temperature, sd = temperature.sd)


# cell[,1] = energy
# cell[,2] = temperature
population.size = 150
cell

density = ((population.density) + ((cell[1,1])))/100
density 

occupants = rbinom(1,1,density)
occupants

cell[1,4] = counter.init



return(cell)
}