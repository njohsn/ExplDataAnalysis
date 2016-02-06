## Read data into R. This assumes the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## has already been downloaded into the working directory. 

data<-read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE)

library(tidyr)
library(lubridate)

##subset for the days we need

days<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

days$DateTime <- strptime(paste(days$Date, days$Time), format="%d/%m/%Y %H:%M:%S") 

#wday(days$DateTime, label=TRUE) 

##order by Date, then Time
days<-days[with(days, order(Date, Time)),]

##create plot
with(days, plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
lines(days$DateTime, days$Sub_metering_2, col="red")
lines(days$DateTime, days$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

## copy to png

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
