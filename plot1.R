header<-read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
subsetdata<-read.table("household_power_consumption.txt", skip= 66637, nrows = 2881, header = FALSE, sep = ';', na.strings = '?')
colnames(subsetdata ) <- unlist(header)
rm(header)

globalActivePower<- as.numeric(subsetdata$Global_active_power)
hist(globalActivePower, col="red", main = "Global Active Power", 
                  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()


