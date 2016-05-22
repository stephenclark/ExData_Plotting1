##########
# Plot 3 Line Graph - Energy Sub Metering
# Stephen Kennedy-Clark
# 22 May 2016
##########

library(data.table)  # much faster to use data.table
dataFile = "household_power_consumption.txt"
plotData <- fread(dataFile, sep=";", header=TRUE, na.strings=c("?","NA") )
# filter data to exclude what we dont want first
plotData <- plotData[plotData$Date %in% c('1/2/2007', '2/2/2007')]
# Need a continuious date - time column to graph results over two days
plotData$date_time <- as.POSIXct(strptime(paste(plotData$Date,plotData$Time, sep=" "), format='%d/%m/%Y %H:%M:%S'))

#The legend does not seem to fit - it works when you print directly to the PNG file, but not when you copy and export

png("plot3.png", width=480, height=480, type="quartz") # comment out this line to plot to the screen 
plot(plotData$date_time, plotData$Sub_metering_1, col="grey", ylab="Energy Sub Metering", xlab="", type="l")
lines(plotData$date_time, plotData$Sub_metering_2, type = "l", col = "red")
lines(plotData$date_time, plotData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("grey", "red", "blue"), cex=1, pt.cex = 1)

#dev.copy(png, file="plot3.png", width=480, height=480) # un-comment out this line to plot to the screen 
dev.off() 
