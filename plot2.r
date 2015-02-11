src <- "./Data/household_power_consumption.txt"
data <- read.table(src, header=T, sep=";", na.strings = "?", stringsAsFactors=T, dec=".")

# cast date as date Obj
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) 

## Saving to file
png("plot2.png", height=480, width=480)

## Plot 
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)" , xlab="")

dev.off()
