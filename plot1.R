
data_dir <- "/Users/omizrach/Documents/RCode/temp"
date1 <- as.Date("02/01/2007",format= "%m/%d/%Y")
date2 <- as.Date("02/02/2007",format= "%m/%d/%Y")
setwd(data_dir)

library(ggplot2)

date1 <- as.Date("02/01/2007",format= "%m/%d/%Y")
date2 <- as.Date("02/02/2007",format= "%m/%d/%Y")

data <- read.table(unz("tmp.zip","household_power_consumption.txt"),sep=";", header = TRUE, na.strings = "?")

data_subset <- subset(data, (as.Date(data[,"Date"],format = "%d/%m/%Y")== date1 |
                            as.Date(data[,"Date"],format = "%d/%m/%Y")==date2) & data$Time != "?")

data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time),format = "%d/%m/%Y %H:%M:%S", tz = "GMT")
png("plot1.png", width=480, height=480)
#bins <- cut_interval(data_subset$Global_active_power,length=0.5 )
#barplot(table(bins),main = "Global Active Power",col=c("red"), space=0,
#        xlab = "Global Active Power (kilowatts)", ylab= "Frequency")

# plot data
hist(data_subset$Global_active_power,main='Global Active Power',
     xlab='Global Active Power (kilowatts)',col='red')

#axis(1, labels = c(0,2,4,6))
dev.off()







