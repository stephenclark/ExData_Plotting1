##########
# Histogram - Plot 1
# Stephen Kennedy-Clark
# 21 May 2016
##########

library(data.table)  # much faster to use data.table
dataFile = "household_power_consumption.txt"
plotData <- fread(dataFile, sep=";", header=TRUE, na.strings=c("?","NA") )
plotData <- plotData[ ,Date:=as.Date(Date,format="%d/%m/%Y")] # change Date column to date format
# Filter dates
plotData <- plotData[Date %between% c("2007-02-01", "2007-02-01")]
# change G.A.P. column to numeric format
plotData <- plotData[ ,Global_active_power:=as.numeric(Global_active_power)] 
# Get rid of NA's in G.A.P.
global_active_power <- na.omit(plotData$Global_active_power)
# plot the histogram 
hist(global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  col = "red",
  xlim =c(0,6),
  freq = TRUE)
#copy device output to file and close the output 
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

