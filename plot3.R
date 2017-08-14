#Read the data
powercon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                     stringsAsFactors = FALSE, comment.char = "")
powercon$Date <- as.Date(powercon$Date, format = "%d/%m/%Y")
head(powercon$Date) #Check the new format

#Subset the data
powercon_sub <- subset(powercon, subset=(powercon$Date == "2007-02-01" | powercon$Date == "2007-02-02"))
rm(powercon) #delete the main data

#Convert dates
DateTime <- paste(as.Date(powercon_sub$Date), powercon_sub$Time)
powercon_sub$DateTime <- as.POSIXct(paste(as.Date(powercon_sub$Date), powercon_sub$Time))

#Plot3
plot(powercon_sub$Sub_metering_1~powercon_sub$DateTime, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(powercon_sub$Sub_metering_2~powercon_sub$DateTime,col = 'Red')
lines(powercon_sub$Sub_metering_3~powercon_sub$DateTime,col = 'Blue')

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save plot to PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
