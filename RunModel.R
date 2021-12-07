# This is where you change variables to manipulate the model
setwd("abm-final-project")
dir <- getwd()
source("source/FunctionSourcer.R")

#############################################
# landscape is only needed for the spatially explicit model that is still being worked on 
# landscape = 10

# Variables used in the CreateSquare Function
# these variables are called internally in the Square Movement function
food.probability = c(0.1,0.25,0.5,0.75)
energy = c(5,10,20,50)
energy.sd = 2
temperature = 85 
temperature.sd  = 10

# Should add in a beta binomial distribution that incorporates both the pop density and the energy availablity to calculate the probabilities of movement

population.density = c(0,.5,1,5,10)

#############################################
#############################################
# Variables for creating individuals
sex.ratio = 0.5
start.energy  = 10
start.energy.sd = 2
start.fitness = 1.0
pop.size = 100

# Something wonky here that causes negative values
# had the energy and energy.sd backwards
# test.landscape <- CreateLandscape(landscape, food.probability, energy, energy.sd)
# test.landscape

parameters = expand.grid(food.probability, energy, energy.sd, temperature, temperature.sd, population.density,pop.size,sex.ratio)
parameters
colnames(parameters) = c("food.probability", "energy", "energy.sd", "temperature", "temperature.sd", "population.density","pop.size","sex.ratio")
# test.square <- CreateSquare(food.probability, energy, energy.sd, temperature, temperature.sd, population.density)

# test.square
# test.square[1,4] <- test.square[1,4] + 1

population = matrix(nrow = pop.size, ncol = 5)
colnames(population) = c("sex", "energy", "fitness", "ind.num", "holder")
ind.num = 1
for (snake in 1:pop.size){
    population[snake,] = CreateInd(sex.ratio,start.energy,start.energy.sd)
    # ind.num = 
    # new.snake <- CreateInd(sex.ratio,start.energy,start.energy.sd)
    # append(test.ind, new.snake)
}

# ind.num = 1


for (x in 1:nrow(population)){
    population[x,4] = ind.num
    ind.num = ind.num + 1
}

population
# head(population)


# gen = 10
# movement.data <- IndMoveSqure(population, gen)

# Three nested loops to run the model 
# first one will control the parameters
# some object will hold the pairwise comparison values 
# second controls the replicates
# probably going to replicate 100 times
# third controls the steps
# figure out how long to run


replicates = 2
gen = 100



for (p in 1:nrow(parameters)){
    # head(parameters)
    parameters[p,]
    # print(parameters[p,])
    food.probability = parameters$food.probability[p]
    energy = parameters$energy[p]
    energy.sd = parameters$energy.sd[p]
    temperature = parameters$temperature[p]
    temperature.sd = parameters$temperature.sd[p]
    population.density = parameters$population.density[p]
    for (r in 1:replicates){
            x <- IndMoveSquare(population,gen)
            print(paste("parameter-", p,"-replicate-",r,sep = ""))
            write.csv(x,paste("output/parameter-",p,"-replicate-",r,".csv",sep = ""))
        }
}


# plot the results 
setwd("output/")
output.dir <- getwd()
results = list.files(path = output.dir , pattern = paste(c("*.csv")))
results
setwd("..")


# Plot the data for quick visualization
# plots are in the plot directory
for (i in results){
    PlotResults(i)
}



medians = matrix(ncol = ncol(parameters) + 2, nrow = length(results))
# medians
med.counter = 1
for (m in results) {
    x <- read.csv(paste("output/",m,sep = ""), header = TRUE)
    # move.list <- as.list(x[,7])
    m.naked <- tools::file_path_sans_ext(m)
    m.naked
    split <- strsplit(m.naked, '-')[[1]]
    medians[med.counter,] <- paste(c(parameters[split[2],], split[4], median(as.numeric(x$movement.num))))
    med.counter = med.counter +1
}

colnames(medians) = c("food.probability", "energy", "energy.sd", "temperature", "temperature.sd", "population.density","pop.size","sex.ratio", "replicate_num", "median_moves")
# medians
# getwd()
write.csv(medians, "parameter-median.csv")
