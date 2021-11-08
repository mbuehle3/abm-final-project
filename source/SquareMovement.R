# have this function generate two squares that the snake will choose between 

square.1 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
square.2 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

square.1
square.2

food.1 = square.1[1,1]
food.2 = square.2[1,1]

food.1
food.2
test.ind
# food.1 = 7
# food.2 = 1

# cell ,1 is the food contained in the square
# There could be something to a high carrying capacity of the landscape if there are a relatively few number of snakes there. 


###################################
###################################
# Need to add in a way to copy the square properties to the snake matrix
# Should probably add in somesort of identifier for the the squares that are being generated
# 

test.ind
new.test.ind <- matrix(nrow = 5, ncol = 10)
new.test.ind[1,] <- cbind(test.ind[1,], square.1[1,])
new.test.ind[2,] <- cbind(test.ind[2,], square.1[1,])

new.test.ind


test.ind.df[3,] = c(3,4,5,6)


test.ind[1,] = cbind()

square.1

test.ind[1,]

# use c() to combine the two vectors into a single output that can be tracked

# Here we are dealing with just the food availablity
# This needs to also incorporate something about the popualtion density
# Also record the  movement to some output file, 
# the counter is in square.x [1,4]
# tmp.ind <- as.matrix(test.ind)
# tmp.ind

# tmp.ind

# length(tmp.ind[,2])

# gens = 10
# gen.number = 0
# tmp.ind.move = matrix(nrow = length(test.ind[,1])*gens+10, ncol = 10)
# length(tmp.ind[,2])

for (gen in 1:gens) {
    gen.number = gen.number + 1
    if (food.1 == 0) {
        move = rbinom(1,1,0.1)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density)
                square.1[1,4] <- square.1[1,4] + 1
                print("Snake is sneaky, square 1 is empty sneaky snake moved")
            } else {
                square.1 = square.1
                print("Snake Didn't Move, idiot they will starve now")
    }
    tmp.ind.move[gen.number,] <-  c(test.ind[i,], square.1)
    } else if (food.1 - food.2 <= energy.sd) { 
        move = rbinom(1,1,0.5)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density) 
                square.1[1,4] <- square.1[1,4] + 1
                print("Snake is sneaky")
            } else {
                square.1 = square.1
                print("Snake Didn't Move")
    } 
    tmp.ind.move[gen.number,] <-  c(test.ind[i,], square.1)
    } else if (food.1 - food.2 > energy.sd) { # remove 1 energy from the square
        move = rbinom(1,1,0.3)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density) 
                square.1[1,4] <- square.1[1,4] + 1
                print("Snake is dumb, moved to bad tile")
            } else {
                square.1 = square.1
                print("Snake is smart didn't move to bad tile")
    }
    tmp.ind.move[gen.number,] <-  c(test.ind[i,], square.1)
    } else if (food.1 - food.2 < (-1*energy.sd)) {
        move = rbinom(1,1,0.8)
            if (move == 1) {
                square.1 = square.2
                square.2 = CreateSquare(food.probability, energy, energy.sd,        temperature, temperature.sd, population.density)
                square.1[1,4] <- square.1[1,4] + 1 
                print("Snake is sneaky, moved to a better tile")
            } else {
                square.1 = square.1
                print("Snake Didn't Move, dumb snake stayed on bad tile")
    }
    # tmp.ind.move[gen.number,] <-  c(test.ind[i,], square.1)
    }

}
}

tmp.ind.move

for (i in 1:length(test.ind[1,])){
    print(test.ind[i,])    
}


test.ind

tmp.ind.move[]
