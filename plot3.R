header<-read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
subsetdata<-read.table("household_power_consumption.txt", skip= 66637, nrows = 2881, header = FALSE, sep = ';', na.strings = '?')
colnames(subsetdata ) <- unlist(header)
rm(header)

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime, subsetdata$Sub_metering_1, type="l", col = "black", ylab = "Energy sub metering", xlab = "", lty = 1, lwd = 1)
lines(datetime, subsetdata$Sub_metering_2, col= "red")
lines(datetime, subsetdata$Sub_metering_3, col= "blue")
legend("topright", lty =c(1,1,1), lwd = c(1,1,1), col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()