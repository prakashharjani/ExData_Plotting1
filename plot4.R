header<-read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
subsetdata<-read.table("household_power_consumption.txt", skip= 66637, nrows = 2881, header = FALSE, sep = ';', na.strings = '?')
colnames(subsetdata ) <- unlist(header)

rm(header)

globalActivePower<- as.numeric(subsetdata$Global_active_power)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
par(mfrow = c(2, 2), mar= c(2,4,4,2))
plot(datetime, globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)" , xlab="")

plot(datetime, subsetdata$Voltage, type = "l", ylab = "Voltage", xlab="")

plot(datetime, subsetdata$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering", xlab = "", lty = 1, lwd = 1)
lines(datetime, subsetdata$Sub_metering_2, col= "red")
lines(datetime, subsetdata$Sub_metering_3, col= "blue")
legend("topright",  lwd = c(1,1,1), col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty= "n", cex= 0.7)

plot(datetime, subsetdata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

