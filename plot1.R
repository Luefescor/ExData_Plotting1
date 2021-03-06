
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

# Creating plot1
png("plot1.png", width=480, height=480)

hist(data$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red",
     main = "Global Active Power")

dev.off()
