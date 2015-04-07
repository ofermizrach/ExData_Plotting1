library(ggplot2)
data_dir <- "/Users/omizrach/Documents/RCode/temp"
date1 <- as.Date("02/01/2007",format= "%m/%d/%Y")
date2 <- as.Date("02/02/2007",format= "%m/%d/%Y")
setwd(data_dir)
data <- read.table(file ="household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

data_subset <- subset(data, (as.Date(data[,"Date"],format = "%d/%m/%Y")== date1 |
                               as.Date(data[,"Date"],format = "%d/%m/%Y")==date2) & data$Time != "?")

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time),format = "%d/%m/%Y %H:%M:%S", tz = "GMT")

png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(data_subset$datetime,data_subset$Global_active_power,
     ylab = "Global Active Power (kilowatts)",xlab = "", type = "l")
plot(data_subset$datetime,data_subset$Voltage,
     ylab = "Voltage",xlab = "datetime", type = "l", col=c("black"))

plot(data_subset$datetime,data_subset$Sub_metering_1,
     ylab = "Energy sub metering",xlab = "", type = "l", col=c("black"))
lines(data_subset$datetime,data_subset$Sub_metering_2,col=c("red"))
lines(data_subset$datetime,data_subset$Sub_metering_3,col=c("blue"))

plot(data_subset$datetime,data_subset$Global_reactive_power,
     ylab = "Global_reactive_power",xlab = "datetime", type = "l", col=c("black"))
dev.off()
