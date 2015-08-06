## Create plot3.png
## This script requires getdata.R

# Change this to an appropriate directory for your environment
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

source("getdata.R")
png(filename = "plot3.png", width = 480, height = 480)
with(epc, {plot(datetime, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", 
                xlab = "", main = "")
           lines(datetime, Sub_metering_2, col = "red")
           lines(datetime, Sub_metering_3, col = "blue")
           legend("topright", lty = 1, col = c("black", "red", "blue"), 
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})
dev.off()