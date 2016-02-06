## Read data into R. This assumes the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
## has already been downloaded into the working directory. 

data<-read.csv2("household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE)


##subset for the days we need

days<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")


## coerce Global_active_power to numeric class

days$Global_active_power <- as.numeric(days$Global_active_power)


##create histogram

with(days, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))


## copy to png

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()





