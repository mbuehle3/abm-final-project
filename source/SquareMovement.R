# have this function generate two squares that the snake will choose between 

square.1 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
square.2 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

square.1
square.2

food.1 = square.1[1,1]
food.2 = square.2[1,1]


food.1 = 0
food.2 = 4

# cell ,1 is the food contained in the square
# There could be something to a high carrying capacity of the landscape if there are a relatively few number of snakes there. 
test.ind[1,]

if (food.1 == 0) {q() # remove 1 energy from the square
    move = rbinom(1,1,0.95)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            print("Snake is sneaky, square 1 is empty sneaky snake moved")
        } else {
            square.1 = square.1
            print("Snake Didn't Move, idiot they will starve now")
        }
else if (food.1 - food.2 =< energy.sd) { # remove 1 energy from the square
    move = rbinom(1,1,0.5)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            print("Snake is sneaky")
        } else {
            square.1 = square.1
            print("Snake Didn't Move")
        }
else if (food.1 - food.2 > energy.sd) { # remove 1 energy from the square
    move = rbinom(1,1,0.3)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            print("Snake is dumb, moved to bad tile")
        } else {
            square.1 = square.1
            print("Snake is smart didn't move to bad tile")
        }
else if (food.1 - food.2 < (-1*energy.sd)) { # remove 1 energy from the square
    move = rbinom(1,1,0.8)
        if (move == 1) {
            square.1 = square.2
            square.2 = CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density) 
            print("Snake is sneaky, moved to a better tile")
        } else {
            square.1 = square.1
            print("Snake Didn't Move, dumb snake stayed on bad tile")
}
} 

