# This script generates plots of the results of Southeast Asia's Great Forest
# Transition study, which estimates the area, total carbon, avoided emissions
# of undeveloped or unconverted forests within concessions (logging/timber, oil
# palm, pulp & paper, rubber, mixed) in Southeast Asian countries.
# 
# 
# Script by:      Jose Don T. De Alban
# Date created:   26 May 2022
# Date modified:     


# Load Libraries -------------------------
library(tidyverse)

# Set Working Directories ----------------
DirMAIN  <- "/Users/dondealban/Dropbox/Research/se-asia-gft/"

# Read Data Files ------------------------
setwd(DirMAIN)
csvAREA <- read.csv(file="SEAsia GFT_Results_Area.csv", header=TRUE, sep=",")
csvCARB <- read.csv(file="SEAsia GFT_Results_Total Carbon.csv", header=TRUE, sep=",")

dfAREA <- csvAREA
dfCARB <- csvCARB

# Generate Plots -------------------------

# Land area of ndeveloped forests within concessions
pAREA <- ggplot() + geom_line(data=dfAREA, aes(x=TreeCoverPct, y=LandAreaSqKm, colour=ConcessionType))
pAREA <- pAREA + facet_wrap(~ Country, scales="free")
pAREA <- pAREA + labs(title="Undeveloped Forest within Concessions", x="Tree Cover (≥ %)", y="Land Area (km2)")
