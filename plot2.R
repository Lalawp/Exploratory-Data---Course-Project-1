##Reads the file into R
x <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

##Converts the date from character to date class
x$Date <- as.Date(x$Date, format="%d/%m/%Y")

##subsets the data to only display the two days for the analysis
x <- subset(x, subset=(Date>="2007-02-01" & Date<"2007-02-03"))

##creates a datetime column for later analysis
datetime <- paste(x$Date, x$Time)

##places the datetime column in x
x$datetime <- as.POSIXct(datetime)

##plots the graph
plot(x$Global_active_power~x$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##saves graph and breaks connection
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()