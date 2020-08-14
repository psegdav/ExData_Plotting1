data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?" )
head(data)

days <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

finaldays <- cbind(time, days)

png(file="plot4.png")

par(mfcol=c(2,2))
#plot1
plot(finaldays$time, finaldays$Global_active_power, type="l", xlab="", ylab= "Global Active Power")
#plot2
colors <- c("black", "red", "blue")
label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finaldays$time, finaldays$Sub_metering_1, type="l", col = colors[1], xlab="", ylab="Energy Sub Metering")
lines(finaldays$time, finaldays$Sub_metering_2, type="l", col = colors[2])
lines(finaldays$time, finaldays$Sub_metering_3, type="l", col = colors[3])
legend("topright", legend = label, col=colors, lty="solid")
#plot3
plot(finaldays$time, finaldays$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot4
plot(finaldays$time, finaldays$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
