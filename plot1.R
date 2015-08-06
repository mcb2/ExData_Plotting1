source("getdata.R")
png(filename = "plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()
