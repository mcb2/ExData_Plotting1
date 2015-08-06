## Create plot4.png
## This script requires getdata.R

# Change this to an appropriate directory for your environment
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

source("getdata.R")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(epc, {plot(datetime, Global_active_power, type = "l", 
                ylab = "Global Active Power", 
                xlab = "", main = "")
           plot(datetime, Voltage, type = "l", main = "")
           plot(datetime, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", 
                xlab = "", main = "")
           lines(datetime, Sub_metering_2, col = "red")
           lines(datetime, Sub_metering_3, col = "blue")
           legend("topright", lty = 1, col = c("black", "red", "blue"), 
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                  bty = "n", y.intersp = 1)
           plot(datetime, Global_reactive_power, type = "l", main = "")})
dev.off()