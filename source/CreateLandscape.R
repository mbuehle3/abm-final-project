# Set the dimensions for the landscape, flexible enough to allow rectangle landscapes
CreateLandscape = function(landscape, food.probability, energy, energy.sd){
    # landscape = 10
    land = matrix(ncol = landscape, nrow = landscape, 0 ) # initialize the matrix landscape
# land
    # food.probability = 0.1
    total.cells = landscape * landscape
    total.cells
    food.cell = food.probability * total.cells
    food.cell

food.cell.matrix = matrix(ncol = 3, nrow = food.cell)
for (i in 1:food.cell) {
  food.cell.matrix[i,1] = sample(1:landscape, 1)
  food.cell.matrix[i,2] = sample(1:landscape, 1)
  food.cell.matrix[i,3] = rnorm(1,energy, energy.sd)
}

food.cell.matrix
# plot(food.cell.matrix)

for (r in 1:nrow(food.cell.matrix)) {
  land.x = food.cell.matrix[r,1]
  land.y = food.cell.matrix[r,2]
  land[land.x, land.y] = food.cell.matrix[r,3]

}
land

return(land)

}