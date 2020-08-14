data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?" )
head(data)

days <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
time <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

finaldays <- cbind(time, days)

png(file="plot1.png", width = 480, height = 480, units = "px")
hist(finaldays$Global_active_power, main="Global Active Power", xlab ="Global Active Power(kilowatts)", col = "red")
dev.off()
