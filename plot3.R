data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
partial <- subset(data, Date %in% c( "1/2/2007", "2/2/2007"))

#
# For graph 3 - we need a datetime, and then we use plot (type = "l" ensures line),
#  and lines to add the other two graphs.
#  Finally legend adds legend (lty = c(1,1) again gives line) and export to PNG
#
partial $ datetime <- as.POSIXct(paste(partial $ Date, partial $ Time),
                                 format = "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png")
plot(partial $ datetime, partial $ Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(partial $ datetime, partial $ Sub_metering_2, col = "red")
lines(partial $ datetime, partial $ Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), col = c("black", "blue", "red"))
dev.off()