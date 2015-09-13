# Get, read and subset the data set to the needed time period.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
dataFile <- "./household_power_consumption.txt"
allData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
requiredData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(requiredData$Date, requiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(requiredData$Global_active_power)
globalReactivePower <- as.numeric(requiredData$Global_reactive_power)
voltage <- as.numeric(requiredData$Voltage)
subMetering1 <- as.numeric(requiredData$Sub_metering_1)
subMetering2 <- as.numeric(requiredData$Sub_metering_2)
subMetering3 <- as.numeric(requiredData$Sub_metering_3)

# Plot the graph,copy it and save it as plot2.png
#-------------------------------------------------------------------------------------------
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
