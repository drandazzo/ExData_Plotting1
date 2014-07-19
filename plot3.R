##Exploratory Data Anaysis - Project 1
##Graph 3

##Set path to file
setwd("D:\\Courses\\Exploratory_Data_Analysis\\Project_1")

##Read in file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",
                    colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Take subset for days we want to look at
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

##prepare png image device
png("plot3.png",width=480, height=480, units="px", pointsize=12, bg="white", res=NA,restoreConsole=TRUE)

##Create new data frame to format data properly for graphing
power2<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), 
                   Global_active_power=as.numeric(power.sub$Global_active_power), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")),
                   Sub_metering_1=as.numeric(power.sub$Sub_metering_1),
                   Sub_metering_2=as.numeric(power.sub$Sub_metering_2), 
                   Sub_metering_3=as.numeric(power.sub$Sub_metering_3))

##Set variable to correctly split data
meters<-range(c(power2$Sub_metering_1,power2$Sub_metering_2,power2$Sub_metering_3))

##print graph in png file
plot(x=power2$Date, y=power2$Sub_metering_1, type="l", ylim=meters, xlab="", ylab="Energy sub metering")
lines(x=power2$Date, y=power2$Sub_metering_2, col="red")
lines(x=power2$Date, y=power2$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

##close image device
dev.off()