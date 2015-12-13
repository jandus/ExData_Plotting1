# Call library
library(dplyr)

# Initialize global values
par(mfrow=c(2,2)) # set to show different graphs in same image


# Extract & Transform file into a data set
house_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', dec='.', 
                               colClasses=c(character(), character(), numeric(), numeric(), numeric(), numeric(), numeric(), numeric()),
                               na.strings = "?",row.names = NULL)
house_consumption$Date <- as.Date(house_consumption$Date, "%d/%m/%Y")
house_consumption <- subset(house_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
house_consumption$datetime <- strptime(paste(house_consumption$Date, house_consumption$Time), "%Y-%m-%d %H:%M:%S")


# Build Plot graph
png(filename = "Plot4.png", width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "transparent")
par(mfrow=c(2,2))
#graph 1
plot(house_consumption$datetime,house_consumption$Global_active_power, type = "l", col = "red", bg = "transparent",
     xlab = "", ylab = "Global Active Power")
#graph 2
plot(house_consumption$datetime,house_consumption$Voltage, type = "l", col = "black", bg = "transparent",
     xlab = "datetime", ylab = "Voltage")
#grap 3
plot(house_consumption$datetime,house_consumption$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(house_consumption$datetime,house_consumption$Sub_metering_1, col = "black")
lines(house_consumption$datetime,house_consumption$Sub_metering_2, col = "brown")
lines(house_consumption$datetime,house_consumption$Sub_metering_3, col = "navyblue")
legend("topright", pch = "-", col = c("black","brown","navyblue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), box.lt = 0, pt.cex = 1.4, cex = 1)
#grap 4 - using name of field as x label
with(house_consumption, plot(datetime,Global_reactive_power, type = "l", col = "black", bg = "transparent"))
dev.off()

