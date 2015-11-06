## A script to turn the Electric Power Consumption data into
## exploratory plot2
##
## Author: Joelle Jansen
##
## This script depends on the dplyr package
## File must be present in working directory

library(dplyr)

## Import full file and convert the dates to date format
file <- tbl_df(read.table("household_power_consumption.txt", sep = ";", header = TRUE))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")

## Select only the observations of 2007-02-01 and 2007-02-02
elect_data <- subset(file, Date == "2007-02-01" | Date == "2007-02-02")

## Convert the columns to the right format
elect_data$Time <- strptime(paste(elect_data$Date, as.character(elect_data$Time)), format = "%Y-%m-%d %H:%M:%S")
elect_data$Global_active_power <- as.numeric(as.character(elect_data$Global_active_power))
elect_data$Global_reactive_power <- as.numeric(as.character(elect_data$Global_reactive_power))
elect_data$Global_intensity <- as.numeric(as.character(elect_data$Global_intensity))
elect_data$Voltage <- as.numeric(as.character(elect_data$Voltage))
elect_data$Sub_metering_1 <- as.numeric(as.character(elect_data$Sub_metering_1))
elect_data$Sub_metering_2 <- as.numeric(as.character(elect_data$Sub_metering_2))

## Make plot2 and save to plot2.png
png("plot2.png", height = 480, width = 480)
plot(elect_data$Time, elect_data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()