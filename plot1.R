# Call library
library(dplyr)

# Initialize global values
par(mfrow=c(1,1)) # set to 1 row and 1 column

# Extract & Transform file into a data set
house_consumption<- read.table("household_power_consumption.txt", header = TRUE, sep = ';', dec='.', colClasses=c(character(), character(), numeric(), numeric(), numeric(), numeric(), numeric(), numeric()), na.strings = "?",row.names = NULL)
house_consumption$Date<-as.Date(house_consumption$Date, "%d/%m/%Y")
house_consumption<-subset(house_consumption, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
house_consumption$datetime<-strptime(paste(house_consumption$Date, house_consumption$Time), "%Y-%m-%d %H:%M:%S")

# Build hist graph
# Generate png file
png(filename = "Plot1.png", width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "transparent")

    hist(house_consumption$Global_active_power, col="green", bg ="transparent", main= "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
