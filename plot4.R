##Plot nr 4
## Requirements
require("dplyr")
require("lubridate")
## Import data (modify the path according to the actual path)
path<-"~/Desktop/coursera/datascience/04_exploratory/ass_1/"
file<-"household_power_consumption.txt"
data<-read.csv2(paste(path,file,sep=""),quote="", dec=".",na.strings="?", stringsAsFactors=0)
## subset data
subdata<-filter(data,Date=="1/2/2007" | Date=="2/2/2007")
## add column with day month year hour minute seconds
subdata<-mutate(subdata,dmyhms=parse_date_time(paste(subdata[,1],subdata[,2]),"dmyhms"))
## Make the plot
png(file = "plot4.png") 
par(mfrow=c(2,2))
plot(select(subdata,dmyhms)[[1]],select(subdata,Global_active_power)[[1]],
     type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(select(subdata,dmyhms)[[1]],select(subdata,Voltage)[[1]],
     type="l",xlab="datetime",ylab="Voltage")

plot(select(subdata,dmyhms)[[1]],select(subdata,Sub_metering_1)[[1]],
     type="l",col="black",xlab="",ylab="Energy sub metering")
lines(select(subdata,dmyhms)[[1]],select(subdata,Sub_metering_2)[[1]],col="red")
lines(select(subdata,dmyhms)[[1]],select(subdata,Sub_metering_3)[[1]],col="blue")
legend("topright", lty=1, col=c("black","red","blue"),bty="n",
       legend = c("Sub metering 1", "Sub metering 2","Sub metering 3"))

plot(select(subdata,dmyhms)[[1]],select(subdata,Global_reactive_power)[[1]],
     type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off() 
