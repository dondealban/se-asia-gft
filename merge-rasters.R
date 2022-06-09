library(raster) 
library(rgdal)

DirMAIN  <- "/Users/dondealban/Downloads/gft-ornl50/test/"
setwd(DirMAIN)

# make a list of file names, perhaps like this:  
f <-list.files(pattern = ".tif")  

# turn these into a list of RasterLayer objects  
r <- lapply(f, raster) 

# as you have the arguments as a list call 'merge' with 'do.call'  
x <- do.call("merge", r) 

# write merged raster  
writeRaster(x, "test-merge.tif")  