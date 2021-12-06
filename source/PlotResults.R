PlotResults = function(results){


getwd()
setwd("output/")
dir <- getwd()


file = results
title = tools::file_path_sans_ext(file)
x <- read.csv(file, header = TRUE)

# title

# x
# files <- list.files()
jpeg(paste("../plots/", title,".jpg", sep = ""))
hist(x$movement.num, 
     main = title,
     cex.main = 2,
     xlab = "Number of Movements",
    #  xaxt = "n",
     ylab = "Movement Frequency",
     cex.lab = 1.25,
     cex.axis = 1.25
)
# axis(1, by = 1)
abline(v = median(x$movement.num), lwd = 3, col = "red")
# text(max(y)-0.5, 300, paste("Median =\n", med), cex = 0.75)

dev.off()

parameters[1,]

for (j in 1:length(parameters)) {
    numeric.results <- c(parameters[j,], median(x$movement.num))
}

# numeric.results <- c(parameters

setwd("..")
getwd()
return(numeric.results)
}