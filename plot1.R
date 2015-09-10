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
png(file = "plot1.png") 
hist(select(subdata,Global_active_power)[[1]],
     col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off() 