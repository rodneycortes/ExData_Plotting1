## Loading dataset
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE,sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
## Data for two days are needed (Feb 1 and 2, 2007).
subsetdata <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
neededData <- data[subsetdata, ]

x <- paste(neededData$Date, neededData$Time)
neededData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(neededData) <- 1:nrow(neededData)

##Ploting plot4.png
png(filename = "plot4.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
par(mfrow = c(2, 2))
##topleft
plot(neededData$DateTime, neededData$Global_active_power,
     type="l",
     col="black",
     xlab="",
     ylab="Global Active Power")
##topright
plot(neededData$DateTime, neededData$Voltage,
     type="l",
     col="black",
     xlab="",
     ylab="Voltage")
##bottomleft
plot(neededData$DateTime, neededData$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",)
lines(neededData$DateTime, neededData$Sub_metering_2,col="red")
lines(neededData$DateTime, neededData$Sub_metering_3,col="blue")
legend("topright",bty="n",col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
##bottom right
plot(neededData$DateTime, neededData$Global_reactive_power,
     type="l",
     col="black",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()