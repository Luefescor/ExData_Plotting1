
# Loading the dataset 
fileData <- "household_power_consumption.txt"
data <- read.table(fileData,
                   header=TRUE,
                   sep=";",
                   colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
# Converting date and time variables to Date/Time class
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Indicating only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

# Creating plot4 formed by 4 elements
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2)) 
# 1
plot(data$Time, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
# 2
plot(data$Time, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
# 3
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("SubM_1", "SubM_2", "SubM_3"),
       lty=1,
       box.lwd=0)
# 4
plot(data$Time, data$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

dev.off()
