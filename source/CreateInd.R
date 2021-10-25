CreateInd = function(sex.ratio,start.energy,start.fitness) {
# each individual is going to be a matrix composed of five colums that have different attributes defined below
ind = matrix(ncol = 5, nrow = 1)

# determine the sex of the individual. 
sex = rbinom(1,1,sex.ratio)
if (sex == 1){
    ind[1,1] = "m"
} else if (sex == 0){
    ind[1,1] = "f"
}

# This is how much energy each individual is starting with 
ind[1,2] = start.energy
# this is the fitess of each individual 
ind[1,3] = start.fitness

return(ind)
}