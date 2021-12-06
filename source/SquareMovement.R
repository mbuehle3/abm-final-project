### INPUT:
###
### Number of generations 
### A matrix containing all individuals

# have this function generate two squares that the snake will choose between 

IndMoveSquare = function(inds, gens){

square.1 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
square.2 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

food.1 = square.1[1,1]
food.2 = square.2[1,1]


# cell ,1 is the food contained in the square
# There could be something to a high carrying capacity of the landscape if there are a relatively few number of snakes there. 


###################################
###################################
# Need to add in a way to copy the square properties to the snake matrix
# Should probably add in somesort of identifier for the the squares that are being generated
# 




# use c() to combine the two vectors into a single output that can be tracked

# Here we are dealing with just the food availablity
# This needs to also incorporate something about the popualtion density
# Also record the  movement to some output file, 
# the counter is in square.x [1,4]
# tmp.ind <- as.matrix(inds)
# tmp.ind

# tmp.ind

# length(tmp.ind[,2])
data = matrix(ncol = (ncol(inds)+ncol(square.1)), nrow = (nrow(inds)*gen))
count = 1

# print("Moving %d indiviudals on the landscape for %d generations each", nrow(inds), gens)

for (j in 1:nrow(inds)){
    moves = 0 
    for ( i in 1:(gen)) {
    if (food.1 == 0) {
        move = rbinom(1,1,0.1)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
                moves = moves + 1
                square.1[1,4] = moves
                # print("Snake is sneaky, square 1 is empty sneaky snake moved")
            } else {
                square.1 = square.1
                square.1[1,4] = moves
                # print("Snake Didn't Move, idiot they will starve now")
                    }
    data[count,] <-  c(inds[j,], square.1)
    count = count + 1
    } else if (food.1 - food.2 <= energy.sd) { 
        move = rbinom(1,1,0.5)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density) 
                moves = moves + 1
                square.1[1,4] = moves
                # print("Snake is sneaky")
            } else {
                square.1 = square.1
                square.1[1,4] = moves
                # print("Snake Didn't Move")
    } 
    data[count,] <-  c(inds[j,], square.1)
    count = count + 1
    } else if (food.1 - food.2 > energy.sd) { # remove 1 energy from the square
        move = rbinom(1,1,0.3)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density) 
                moves = moves + 1
                square.1[1,4] = moves
                # print("Snake is dumb, moved to bad tile")
            } else {
                square.1 = square.1
                square.1[1,4] = moves
                # print("Snake is smart didn't move to bad tile")
    }
    data[count,] <-  c(inds[j,], square.1)
    count = count + 1
    } else if (food.1 - food.2 < (-1*energy.sd)) {
        move = rbinom(1,1,0.8)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
                moves = moves + 1
                square.1[1,4] = moves
                # print("Snake is sneaky, moved to a better tile")
            } else {
                square.1 = square.1
                square.1[1,4] = moves
                # print("Snake Didn't Move, dumb snake stayed on bad tile")
                    }
                    # tmp.ind.move[gen.number,] <-  c(inds[j,], square.1)
            data[count,] = c(inds[j,], square.1)
            count = count + 1
    }

    
    }
}
data = data[,c(-3,-5)]
colnames(data) = c("sex", "energy", "ind.num", "ind.energy", "temp", "blank", "movement.num", "blank_2")
return(data)
}