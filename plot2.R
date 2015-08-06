source("getdata.R")
png(filename = "plot2.png", width = 480, height = 480)
with(epc, plot(datetime, Global_active_power, type = "l", 
               ylab = "Global Active Power (kilowatts)", 
               xlab = "", main = ""))
dev.off()