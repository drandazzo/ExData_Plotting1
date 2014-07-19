##Exploratory Data Anaysis - Project 1
##Graph 4

##Set path to file
setwd("D:\\Courses\\Exploratory_Data_Analysis\\Project_1")

##Read in file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",
                    colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Take subset for days we want to look at
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

##prepare png image device
png("plot4.png",width=480, height=480, units="px", pointsize=12, bg="white", res=NA,restoreConsole=TRUE)

##prepare graphing for 4 separate graphs in window
par(mfrow=c(2,2))

##print graph 1 in upper left of png file
power2<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Global_active_power=as.numeric(power.sub$Global_active_power), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")))
plot(x = power2$Date, y=power2$Global_active_power, type="l", ylab="Global Active Power", xlab="")

##print graph 2 in upper right of png file
power3<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Voltage=as.numeric(power.sub$Voltage), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")))
plot(x = power3$Date, y=power3$Voltage, type="l", ylab="Voltage", xlab="datetime")

##print graph 3 in bottom left of png file
power4<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), 
                   Global_active_power=as.numeric(power.sub$Global_active_power), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")),
                   Sub_metering_1=as.numeric(power.sub$Sub_metering_1),
                   Sub_metering_2=as.numeric(power.sub$Sub_metering_2), 
                   Sub_metering_3=as.numeric(power.sub$Sub_metering_3))
meters<-range(c(power4$Sub_metering_1,power4$Sub_metering_2,power4$Sub_metering_3))
plot(x=power4$Date, y=power4$Sub_metering_1, type="l", ylim=meters, xlab="", ylab="Energy sub metering")
lines(x=power4$Date, y=power4$Sub_metering_2, col="red")
lines(x=power4$Date, y=power4$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), bty="n")

##print graph 4 in bottom right of png file
power5<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Global_reactive_power=as.numeric(power.sub$Global_reactive_power), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")))
plot(x = power5$Date, y=power5$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

##close image device
dev.off()