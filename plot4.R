data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
partial <- subset(data, Date %in% c( "1/2/2007", "2/2/2007"))
partial $ datetime <- as.POSIXct(paste(partial $ Date, partial $ Time),
                                 format = "%d/%m/%Y %H:%M:%S")
#
# We combine all previous graphs, using par function, and export
#
png(file = "plot4.png")
par(mfrow = c(2,2))

#upper left is plot2.png, with modified axes
plot(x = partial $ datetime, y = partial $ Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")

#upper right is a graph of datetime versus voltage
plot(x = partial $ datetime, y = partial $ Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")

#bottom left is plot3.png
plot(partial $ datetime, partial $ Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(partial $ datetime, partial $ Sub_metering_2, col = "red")
lines(partial $ datetime, partial $ Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), col = c("black", "blue", "red"))

#bottom right is a graph of datetime versus Global_reactive_power
plot(x = partial $ datetime, y = partial $ Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()