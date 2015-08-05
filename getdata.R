## Script to obtain data file and load it into a data frame

## Change this to an appropriate directory for your environment
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

## Download data
if (!file.exists("data")) {
     dir.create("data")
}
if (!file.exists("./data/household_power_consumption.zip")) {
     fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     download.file(fileUrl, destfile = "./data/household_power_consumption.zip", mode = "wb")
}

## Unzip data
if (!file.exists("./data/household_power_consumption.txt")) unzip("./data/household_power_consumption.zip", exdir = "./data")

# Load, format, and subset data
if (!file.exists("./data/epc.txt")) {
     epc <- read.csv2("./data/household_power_consumption.txt", 
                      na.strings = "?", 
                      stringsAsFactors = FALSE, 
                      dec = ".")
     epc$datetime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")
     epc <- epc[epc$datetime >= "2007-02-01" & epc$datetime < "2007-02-03", ]
     write.table(epc, file = "./data/epc.txt", row.name = FALSE, sep = ",")
} else {
     epc <- read.csv("./data/epc.txt", 
                     na.strings = "NA", 
                     stringsAsFactors = FALSE, 
                     dec = ".")
     epc$datetime <- strptime(epc$datetime, "%Y-%m-%d %H:%M:%S", tz = "GMT")
}