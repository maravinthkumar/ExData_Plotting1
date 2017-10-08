#plot2

#Read Data
d = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert Data Types
d$Date = as.Date(d$Date, format = "%d/%m/%Y")
d$DateTime = strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S")
d$Global_active_power = as.numeric(d$Global_active_power)
d$Sub_metering_1 = as.numeric(d$Sub_metering_1)
d$Sub_metering_2 = as.numeric(d$Sub_metering_2)
d$Sub_metering_3 = as.numeric(d$Sub_metering_3)

#Subset Data
d = subset(d, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#grDevice
png("plot3.png", width = 480, height = 480)

#Drwa
plot(d$DateTime, d$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 'l')
lines(d$DateTime, d$Sub_metering_2, col = "red", type = "l")
lines(d$DateTime, d$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#turnoff device
dev.off()
