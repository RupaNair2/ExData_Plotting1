

#read file
file <- "household_power_consumption.txt" 
#read data
data_1<- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# subset data
datasubset <- data_1[data_1$Date %in% c("1/2/2007","2/2/2007") ,] 

#strp based date-time
date_time <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
 
Sub_metering_1 <- as.numeric(datasubset$Sub_metering_1) 
Sub_metering_2 <- as.numeric(datasubset$Sub_metering_2) 
Sub_metering_3 <- as.numeric(datasubset$Sub_metering_3) 
#Plot
plot(date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(date_time, Sub_metering_2, type="l", col="red") 
lines(date_time, Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

