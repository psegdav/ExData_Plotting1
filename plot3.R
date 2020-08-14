data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?" )
head(data)

days <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

finaldays <- cbind(time, days)
names(finaldays)

png(file="plot3.png", width = 480, height = 480, units = "px")

colors <- c("black", "red", "blue")
label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finaldays$time, finaldays$Sub_metering_1, type="l", col = colors[1], xlab="", ylab="Energy Sub Metering")
lines(finaldays$time, finaldays$Sub_metering_2, type="l", col = colors[2])
lines(finaldays$time, finaldays$Sub_metering_3, type="l", col = colors[3])
legend("topright", legend = label, col=colors, lty="solid")

dev.off()
