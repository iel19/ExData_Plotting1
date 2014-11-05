data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
partial <- subset(data, Date %in% c( "1/2/2007", "2/2/2007"))

#
# For graph 1 - use hist function
#  and export to PNG
#
png(file = "plot1.png")
hist(partial $ Global_active_power, main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()