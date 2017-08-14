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


#Plot4
par(mfrow = c(2,2))
plot(powercon_sub$Global_active_power~powercon_sub$DateTime, type = "l", 
     ylab = "Global Active Power", xlab = "")
plot(powercon_sub$Voltage~powercon_sub$DateTime, type = "l", 
     ylab = "Voltage", xlab = "datetime")
plot(powercon_sub$Sub_metering_1~powercon_sub$DateTime, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(powercon_sub$Sub_metering_2~powercon_sub$DateTime,col = 'Red')
lines(powercon_sub$Sub_metering_3~powercon_sub$DateTime,col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), bty = "n", cex = 0.4,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(powercon_sub$Global_reactive_power~powercon_sub$DateTime, type = "l", 
     ylab = "Global_reactive_power",xlab = "datetime")

#Save plot to PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
