# Download the zipped file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzip the file at desired drive
# Set your working directory to where you have unzipped the file
# Now we will start creating code to prepare graphs

# Plot 4.R

my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", 
quote='\"')

# Filter out data for only 2 days in Feb 2017
filterdata <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

# format Date object
datetime <- strptime(paste(filterdata$Date, filterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# format Global_active_power as numeric
GlobalActivePower <- as.numeric(filterdata$Global_active_power)

# format Global_Reactive_power as numeric
GlobalReactivePower <- as.numeric(filterdata$Global_reactive_power)

# format sub_metering data as Numeric
submeter1 <- as.numeric(filterdata$Sub_metering_1)
submeter2 <- as.numeric(filterdata$Sub_metering_2)
submeter3 <- as.numeric(filterdata$Sub_metering_3)

# format Voltage
Volt <- as.numeric(filterdata$Voltage)

# Prepare chart
png("Plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(datetime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)

plot(datetime, Volt, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"), bty = "o")

plot(datetime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

# png file is saved in home drive


