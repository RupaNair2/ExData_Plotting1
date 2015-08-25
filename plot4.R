# read file
file <- "household_power_consumption.txt" 
#read data
data_1 <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# data subsetting
datasubset <- data_1[data_1$Date %in% c("1/2/2007","2/2/2007") ,] 
#strp date and time
date_time <- strptime(paste(datasubset, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalactivepower <- as.numeric(datasubset$Global_active_power) 
globalreactivepower <- as.numeric(datasubset$Global_reactive_power) 
voltage <- as.numeric(datasubset$Voltage) 
Sub_metering_1 <- as.numeric(datasubset$Sub_metering_1) 
Sub_metering_2 <- as.numeric(datasubset$Sub_metering_2) 
Sub_metering_3 <- as.numeric(datasubset$Sub_metering_3) 
#plotting with required margins title axis etc
par(mfrow = c(2, 2),  mar=c(4,4,2,1))  
plot(date_time, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(date_time, Sub_metering_2, type="l", col="red") 
lines(date_time, Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
plot(date_time, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 
