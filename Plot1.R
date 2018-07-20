# Download the zipped file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzip the file at desired drive
# Set your working directory to where you have unzipped the file
# Now we will start creating code to prepare graphs

# Plot 1.R

my_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
stringsAsFactors=F, comment.char="", quote='\"')

# Filter out data for only 2 days in Feb 2017
filterdata <- subset(my_data, Date %in% c("1/2/2007","2/2/2007"))

#Prepare chart
png("Plot1.png", width=480, height=480)
hist(filterdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", 
col="Red")
dev.off()
# png file is saved in home drive
