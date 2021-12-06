CreateInd = function(sex.ratio,start.energy,start.energy.sd) {
# each individual is going to be a matrix composed of five colums that have different attributes defined below
# ind.num = 1
ind = matrix(ncol = 5, nrow = 1)
ind
# determine the sex of the individual. 
sex = rbinom(1,1,sex.ratio)
if (sex == 1){
    ind[1,1] = "m"
} else if (sex == 0){
    ind[1,1] = "f"
}
# This is how much energy each individual is starting with 
ind[1,2] = rnorm(1,start.energy,start.energy.sd)
# this is the fitess of each individual 
ind[1,3] = start.fitness

# for (x in 1:pop.size){
#     ind[1,4] = ind.num
#     ind.num = ind.num + 1
# }
ind
return(ind)

}