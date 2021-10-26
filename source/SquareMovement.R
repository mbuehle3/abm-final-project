# have this function generate two squares that the snake will choose between 

square.1 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)
square.2 <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

square.1
square.2

food.1 = square.1[1,1]
food.2 = square.2[1,1]


# cell ,1 is the food contained in the square
# There could be something to a high carrying capacity of the landscape if there are a relatively few number of snakes there. 

if (food.1 > food.2) {
    print("more food in square 1")
} else {
    print("More food in square 2")
}
