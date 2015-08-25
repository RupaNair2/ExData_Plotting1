# reading file
file <- "household_power_consumption.txt" 
#reading table
data_1 <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
#subsetting data based on date required
datasubset <- data_1[data_1$Date %in% c("1/2/2007","2/2/2007") ,] 
#extracting data
globalActivePower <- as.numeric(datasubset$Global_active_power) 
#plotting 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
