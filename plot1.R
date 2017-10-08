#plot1

#Read Data
d = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert Data Types
d$Date = as.Date(d$Date, format = "%d/%m/%Y")
d$Global_active_power = as.numeric(d$Global_active_power)

#Subset Data
d = subset(d, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#grDevice
png("plot1.png", width = 480, height = 480)

#Drwa
hist(d$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#turnoff device
dev.off()
