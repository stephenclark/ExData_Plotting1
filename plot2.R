##########
# Plot 2 Line Graph
# Stephen Kennedy-Clark
# 21 May 2016
##########

library(data.table)  # much faster to use data.table
dataFile = "household_power_consumption.txt"
plotData <- fread(dataFile, sep=";", header=TRUE, na.strings=c("?","NA") )
# filter data to exclude what we dont want first
plotData <- plotData[plotData$Date %in% c('1/2/2007', '2/2/2007')]
# Need a continuious date - time column to graph results over two days
plotData$date_time <- as.POSIXct(strptime(paste(plotData$Date,plotData$Time, sep=" "), format='%d/%m/%Y %H:%M:%S'))

# change G.A.P. column to numeric format?tr
plotData$Global_active_power <-as.numeric(plotData$Global_active_power)

# plot line graph

plot(plotData$date_time, plotData$Global_active_power, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")
#copy device output to file and close the output 

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

