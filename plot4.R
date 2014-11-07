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

##allows for four graphs
par(mfrow=c(2, 2))

##plot the first - global active power on y, datetime on x
plot(x$Global_active_power~x$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##plot the 2nd - voltage on y, datetime on x
plot(x$Voltage~x$datetime, type="l", ylab="Voltage")

##plot the 3rd - submetering, 3 lines
plot(x$Sub_metering_1~x$datetime, type="l", ylab="Energy Sub Metering")
lines(x$Sub_metering_2~x$datetime, col="orange")
lines(x$Sub_metering_3~x$datetime, col="blue")
legend("topright", col=c("black", "orange", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)

##plot the fourth - datetime on x, globalreactivepower on y
plot(x$Global_reactive_power~x$datetime, type="l")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()