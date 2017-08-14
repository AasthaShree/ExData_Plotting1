#Read the data
powercon <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", 
                     stringsAsFactors = FALSE, comment.char = "")
powercon$Date <- as.Date(powercon$Date, format = "%d/%m/%Y")
head(powercon$Date) #Check the new format

#Subset the data
powercon_sub <- subset(powercon, subset = (powercon$Date == "2007-02-01" | powercon$Date == "2007-02-02"))
rm(powercon) #delete the main data

#Plot1
hist(powercon_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", col = "Red")

#Save plot to PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()