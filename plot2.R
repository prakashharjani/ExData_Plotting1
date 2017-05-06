header<-read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
subsetdata<-read.table("household_power_consumption.txt", skip= 66637, nrows = 2881, header = FALSE, sep = ';', na.strings = '?')
colnames(subsetdata ) <- unlist(header)
rm(header)

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower<- as.numeric(subsetdata$Global_active_power)
plot(datetime, globalActivePower, type = "l", ylab = "Global Active Power (kilowatts)" , xlab="")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()



