# Get, read and subset the data set to the needed time period.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dataFile <- "./household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
requiredData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(requiredData$Global_active_power)

# Plot the graph,copy it and save it as plot2.png
#-------------------------------------------------------------------------------------------
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
