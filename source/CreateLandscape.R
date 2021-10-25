# Set the dimensions for the landscape, flexible enough to allow rectangle landscapes
CreateLandscape = function(elevation){
    # landscape = 100
    land = matrix(ncol = landscape, nrow = landscape) # initialize the matrix landscape
# land


# Randomly determine where the peak is going by subsampling the range of landscape.x/y values
    peak.x = sample(1:landscape, 1)
    peak.y = sample(1:landscape, 1)

  # peak.x
  # peak.y

# Create the elevation values for assignment

# Assign the peak elevation value to the appropriate matrix cell  

    land[peak.y,peak.x] = elevation[2]
# land

# In row peak.y,  from column peak.x = 1 to peak.x, fill in some values
    land[peak.y,1:(peak.x-1)] = round(seq(elevation[1], elevation[2], (elevation[2]-elevation[1])/(peak.x-2)) + rnorm((peak.x-1),0,1), 0)
# land

# land[peak.y,(peak.x+1):landscape]

# in row peak.y, from peak.x + 1 to the last column, fill in some values in reverse at some increment

    land[peak.y,(peak.x+1):landscape] = round(rev(seq(from = elevation[1], to =  elevation[2],by=(elevation[2]-elevation[1])/(landscape-peak.x-1)) + rnorm((landscape-peak.x),5,2)), 0)
  # land
# Fill in all other values in the landscape with incremental values 
  for(r in (peak.y-1):1){
    land[r,] = land[(r+1),] - round(rnorm(landscape, 5, 1), 0)
  }
  for(r in (peak.y+1):landscape){
    land[r,] = land[(r-1),] - round(rnorm(landscape, 5, 1), 0)
  }
return(land)

}