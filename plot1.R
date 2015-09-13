# Get, read and subset the data set to the needed time period.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

##setwd("C:/Users/01420965/Documents/Coursera/ExploratoryDataAnalysis/WK1")

dataFile <- "./household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
requiredData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(requiredData$Global_active_power)

# Plot histogram, copy and save it as plot.png
#-----------------------------------------------------------------------------------------------------
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global ActivePower (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
