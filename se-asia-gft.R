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

# Land area of undeveloped forests within concessions
pAREA <- ggplot() + geom_line(data=dfAREA, aes(x=TreeCoverPct, y=LandAreaSqKm, colour=ConcessionType))
pAREA <- pAREA + facet_wrap(~ Country, scales="free")
pAREA <- pAREA + labs(title="Undeveloped Forests within Concessions", x="Tree Cover (%)", y="Land Area (km2)")

# Total carbon stored by undeveloped forests within concessions
pCARB <- ggplot() + geom_line(data=dfCARB, aes(x=TreeCoverPct, y=TotalCarbon_TgC, colour=CarbonMapSource))
pCARB <- pCARB + facet_grid(Country ~ ConcessionType, scales="free_y")
pCARB <- pCARB + labs(title="Total Carbon Stored by Undeveloped Forests within Concessions", 
                      x="Tree Cover (%)", y="Total Carbon (Tg or MMT)")

# Avoided total emissions by undeveloped forests within concessions
pAVEM <- ggplot() + geom_line(data=dfCARB, aes(x=TreeCoverPct, y=AvoidedTotalEmissions_MMtCO2e, colour=CarbonMapSource))
pAVEM <- pAVEM + facet_grid(Country ~ ConcessionType, scales="free_y")
pAVEM <- pAVEM + labs(title="Avoided Total Emissions from Undeveloped Forests within Concessions", 
                      x="Tree Cover (%)", y="Avoided Emissions (MMt CO2e)")

# Save Output Plots ----------------------
ggsave(pAREA, file="SEAsia-GFT-Area.pdf", width=20, height=15, units="cm", dpi=300)
ggsave(pCARB, file="SEAsia-GFT-TotalCarbon.pdf", width=20, height=15, units="cm", dpi=300)
ggsave(pAVEM, file="SEAsia-GFT-AvoidedEmissions1.pdf", width=20, height=15, units="cm", dpi=300)
