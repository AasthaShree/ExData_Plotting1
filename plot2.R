#Read the data
powercon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                     stringsAsFactors = FALSE, comment.char = "")
powercon$Date <- as.Date(powercon$Date, format = "%d/%m/%Y")
head(powercon$Date) #Check the new format

#Subset the data
powercon_sub <- subset(powercon, subset = (powercon$Date == "2007-02-01" | powercon$Date == "2007-02-02"))
rm(powercon) #delete the main data

#Convert dates
DateTime <- paste(as.Date(powercon_sub$Date), powercon_sub$Time)
powercon_sub$DateTime <- as.POSIXct(paste(as.Date(powercon_sub$Date), powercon_sub$Time))

#Plot2
plot(powercon_sub$Global_active_power~powercon_sub$DateTime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")

#Save plot to PNG file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
