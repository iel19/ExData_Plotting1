data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
partial <- subset(data, Date %in% c( "1/2/2007", "2/2/2007"))

#
# For graph 2 - we need a datetime, and then we use plot (type = "l" ensures line)
#  and export to PNG
#
partial $ datetime <- as.POSIXct(paste(partial $ Date, partial $ Time),
                                 format = "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png")
plot(x = partial $ datetime, y = partial $ Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()