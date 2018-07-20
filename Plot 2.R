# Download the zipped file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzip the file at desired drive
# Set your working directory to where you have unzipped the file
# Now we will start creating code to prepare graphs

# Plot 2.R

my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", 
quote='\"')

# Filter out data for only 2 days in Feb 2017
filterdata <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

# format Global_active_power as numeric
GlobalActivePower <- as.numeric(filterdata$Global_active_power)

# format Date object
datetime <- strptime(paste(filterdata$Date, filterdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Prepare chart
png("Plot2.png", width=480, height=480)

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

# png file is saved in home drive
