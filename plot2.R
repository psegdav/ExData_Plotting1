data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?" )
head(data)

days <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

finaldays <- cbind(time, days)

png(file= "plot2.png")

#days are in spanish, but they are right!
plot(finaldays$time, finaldays$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)")
dev.off()
