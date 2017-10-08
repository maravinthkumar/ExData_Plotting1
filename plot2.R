#plot2

#Read Data
d = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert Data Types
d$Date = as.Date(d$Date, format = "%d/%m/%Y")
d$DateTime = strptime(paste(d$Date, d$Time), "%Y-%m-%d %H:%M:%S")
d$Global_active_power = as.numeric(d$Global_active_power)


#Subset Data
d = subset(d, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#grDevice
png("plot2.png", width = 480, height = 480)

#Drwa
plot(d$DateTime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#turnoff device
dev.off()
