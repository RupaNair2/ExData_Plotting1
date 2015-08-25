#read file
file <- "household_power_consumption.txt" 
#read data
data_1 <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
# subset data
datasubset <- data_1[data_1$Date %in% c("1/2/2007","2/2/2007") ,] 
# strp data and time
date_time <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSetData$Global_active_power) 
#plot 
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off() 
