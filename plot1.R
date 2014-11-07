library(dplyr)

##Sets Working Directory
setwd("C:/Users/Jim/Documents/Data Science/Exploratory Data Analysis/householdpower")

##Reads file into R
x <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##creates a new DatTime Column
x$DateTime <- paste(x$Date, x$Time)

##Converts DateTime to date class
x$DateTime <- as.Date(x$DateTime, format="%d/%m/%Y %H:%M:%S")

##Filters out all dates except for days considered
x <- filter(x, DateTime >= as.Date("2007-02-01"), DateTime < as.Date("2007-02-03"))


hist(x$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()