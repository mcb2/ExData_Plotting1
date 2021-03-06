## Script to obtain and extract data file, subset it, and load it into a data frame
## Steps that have been completed previously will not be repeated each time the script is run.
##
## This script requires the sqldf library which should be installed prior to launching it.
## The working directory specified below should be modified to reflect you local environment.
## This script is called by other scripts and should not be called on its own

library(sqldf)

# Change this to an appropriate directory for your environment
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

## Load, format, and subset data
if (!file.exists("./data/epc.txt")) {
     f <- file("./data/household_power_consumption.txt")
     q <- "select * from f where Date = '1/2/2007' or Date = '2/2/2007'"
     epc <- sqldf(q, dbname = tempfile(), file.format = list(header = T, row.names = F, sep = ";"))
     close(f)
     # add additional datetime variable calculated from existing Date and Time variables
     epc$datetime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")
     write.table(epc, file = "./data/epc.txt", row.name = FALSE, sep = ",")
} else {
     epc <- read.csv("./data/epc.txt", 
                     na.strings = "NA", 
                     stringsAsFactors = FALSE, 
                     dec = ".")
     epc$datetime <- strptime(epc$datetime, "%Y-%m-%d %H:%M:%S", tz = "GMT")
}
