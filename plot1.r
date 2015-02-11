src <- "./Data/household_power_consumption.txt"
data <- read.table(src, header=T, sep=";", na.strings = "?", stringsAsFactors=T, dec=".")

# cast date as date Obj
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Saving to file
png("plot1.png", height=480, width=480)

## Plot histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()