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


##Ploting plot1.png
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
hist(neededData$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()