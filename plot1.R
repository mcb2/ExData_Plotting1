## Create plot1.png
## This script requires getdata.R

# Change this to an appropriate directory for your environment
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

source("getdata.R")
png(filename = "./figure/plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()
