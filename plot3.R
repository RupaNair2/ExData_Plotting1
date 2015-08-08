datafile <- "household_power_consumption.txt" 
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 


datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
 
submetering1 <- as.numeric(subSetData$Sub_metering_1) 
submetering2 <- as.numeric(subSetData$Sub_metering_2) 
submetering3 <- as.numeric(subSetData$Sub_metering_3) 

plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, submetering2, type="l", col="red") 
lines(datetime, submetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

