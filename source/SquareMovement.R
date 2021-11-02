# have this function generate two squares that the snake will choose between 

square.1 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
square.2 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

square.1
square.2

food.1 = square.1[1,1]
food.2 = square.2[1,1]

food.1
food.2

# food.1 = 7
# food.2 = 1

# cell ,1 is the food contained in the square
# There could be something to a high carrying capacity of the landscape if there are a relatively few number of snakes there. 


###################################
###################################
# Need to add in a way to copy the square properties to the snake matrix
# Should probably add in somesort of identifier for the the squares that are being generated
# 

square.1

test.ind[1,]

# use c() to combine the two vectors into a single output that can be tracked
test.bind = c(test.ind[1,], square.1)
test.bind


# Here we are dealing with just the food availablity
# This needs to also incorporate something about the popualtion density
# Also record the  movement to some output file, 
# the counter is in square.x [1,4]
tmp.ind <- test.ind
tmp.ind

length(test.ind[,1])

gens = 10


for (i in 1:length(test.ind[,1])) { 
for (gen in 1:gens) {

if (food.1 == 0) {
    move = rbinom(1,1,0.1)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
            square.1[1,4] <- square.1[1,4] + 1
            print("Snake is sneaky, square 1 is empty sneaky snake moved")
        } else {
            square.1 = square.1
            print("Snake Didn't Move, idiot they will starve now")
}
} else if (food.1 - food.2 <= energy.sd) { 
    move = rbinom(1,1,0.5)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            square.1[1,4] <- square.1[1,4] + 1
            print("Snake is sneaky")
        } else {
            square.1 = square.1
            print("Snake Didn't Move")
} 
} else if (food.1 - food.2 > energy.sd) { # remove 1 energy from the square
    move = rbinom(1,1,0.3)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            square.1[1,4] <- square.1[1,4] + 1
            print("Snake is dumb, moved to bad tile")
        } else {
            square.1 = square.1
            print("Snake is smart didn't move to bad tile")
}
} else if (food.1 - food.2 < (-1*energy.sd)) {
    move = rbinom(1,1,0.8)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
            square.1[1,4] <- square.1[1,4] + 1 
            print("Snake is sneaky, moved to a better tile")
        } else {
            square.1 = square.1
            print("Snake Didn't Move, dumb snake stayed on bad tile")
}
}
square.1[1,4] <- square.1[1,4] + 1
tmp.ind.move <- rbind(tmp.ind.move, c(test.ind[i,], square.1))
}
}
tmp.ind.move




for ( i in test.ind) {
    test.ind[i,]
}

test.ind[1,]
