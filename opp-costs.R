# This script processes raster files to calculate opportunity cost layers, 
# particularly agricultural rent and logging timber rent rasters.

# Load Libraries -------------------------
library(raster)

# Set Working Directories ----------------
dirAGRI <- "/Users/dondealban/Public/VirtualBox/SE Asia GFT/opportunity costs/agricultural rent/"
dirTIMB <- "/Users/dondealban/Public/VirtualBox/SE Asia GFT/opportunity costs/timber rent/"

# Read Data Files ------------------------

# Agricultural rent layers
setwd(dirAGRI)

idnLOGagri <- raster(paste0(dirAGRI, "idn-gfw-logging-agri-rent.tif"))
idnOPMagri <- raster(paste0(dirAGRI, "idn-gfw-oil-palm-agri-rent.tif"))
idnWFBagri <- raster(paste0(dirAGRI, "idn-gfw-wood-fiber-agri-rent.tif"))

khmELCagri <- raster(paste0(dirAGRI, "khm-licadho-elc-agri-rent.tif"))
mmrOPMagri <- raster(paste0(dirAGRI, "mmr-tni-omm-oil-palm-agri-rent.tif"))

mysLOGagri <- raster(paste0(dirAGRI, "mys-swk-gfw-logging-agri-rent.tif"))
mysOPMagri <- raster(paste0(dirAGRI, "mys-swk-gfw-oil-palm-agri-rent.tif"))
mysWFBagri <- raster(paste0(dirAGRI, "mys-swk-gfw-wood-fiber-agri-rent.tif"))

# Timber rent layers
test <- raster(paste0(dirMAIN, "test-idn-gfw-logging-timber-rent.tif"))



# Read Raster Attributes -----------------
idnLOGagri

# Plot Rasters ---------------------------
plot(idnLOGagri, main="IDN Logging Agricultural Rent")
plot(idnOPMagri, main="IDN Oil Palm Agricultural Rent")
plot(idnWFBagri, main="IDN Wood Fiber Agricultural Rent")

plot(khmELCagri, main="KHM ELC Agricultural Rent")
plot(mmrOPMagri, main="MMR TNI Oil Palm Agricultural Rent")

plot(mysLOGagri, main="MYS SWK Logging Agricultural Rent")
plot(mysOPMagri, main="MYS SWK Oil Palm Agricultural Rent")
plot(mysWFBagri, main="MYS SWK Wood Fiber Agricultural Rent")

# Raster Math ----------------------------
blank <- test/test

writeRaster(blank, "test.tif")  
