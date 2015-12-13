# Call library
library(dplyr)

# Initialize global values
par(mfrow=c(1,1)) # set to 1 row and 1 column

# Extract & Transform file into a data set
house_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', dec='.',
                               colClasses=c(character(), character(), numeric(), numeric(), numeric(), numeric(), numeric(), numeric()),
                               na.strings = "?",row.names = NULL)
house_consumption$Date <- as.Date(house_consumption$Date, "%d/%m/%Y")
house_consumption <- subset(house_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
house_consumption$datetime <- strptime(paste(house_consumption$Date, house_consumption$Time), "%Y-%m-%d %H:%M:%S")


# Build Plot graph
png(filename = "Plot3.png", width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "transparent")
plot(house_consumption$datetime,house_consumption$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(house_consumption$datetime,house_consumption$Sub_metering_1, col = "black")
    lines(house_consumption$datetime,house_consumption$Sub_metering_2, col = "brown")
    lines(house_consumption$datetime,house_consumption$Sub_metering_3, col = "navyblue")
    legend("topright", pch = "-", col = c("black","brown","navyblue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pt.cex = 2, cex = 0.7)
dev.off()