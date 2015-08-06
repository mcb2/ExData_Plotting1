## Create plot2.png
## This script requires getdata.R

# Change this to an appropriate directory for your environment
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

source("getdata.R")
png(filename = "./figure/plot2.png", width = 480, height = 480)
with(epc, plot(datetime, Global_active_power, type = "l", 
               ylab = "Global Active Power (kilowatts)", 
               xlab = "", main = ""))
dev.off()