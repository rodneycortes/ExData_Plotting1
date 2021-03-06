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

##Ploting plot2.png
png(filename = "plot2.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
plot(neededData$DateTime,neededData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",)
dev.off()