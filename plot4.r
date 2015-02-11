src <- "./Data/household_power_consumption.txt"
data <- read.table(src, header=T, sep=";", na.strings = "?", stringsAsFactors=T, dec=".")

# cast date as date Obj
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# subset the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time)) 

## Saving to file
png("plot4.png", height=480, width=480)

## Plot
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data,{
  
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="")
    
  plot(Sub_metering_1~DateTime, type="l", ylab="Energy Sub Metering" , xlab="")
  lines(Sub_metering_2~DateTime, type="l", col="Red")
  lines(Sub_metering_3~DateTime, type="l", col="Blue")
  legend("topright", lty=1, lwd=2, col = c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power",xlab="")
})


dev.off()
