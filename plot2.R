##Exploratory Data Anaysis - Project 1
##Graph 2

##Set path to file
setwd("D:\\Courses\\Exploratory_Data_Analysis\\Project_1")

##Read in file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",
                    colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Take subset for days we want to look at
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

##prepare png image device
png("plot2.png",width=480, height=480, units="px", pointsize=12, bg="white", res=NA,restoreConsole=TRUE)

##Create new data frame to format data properly for graphing
power2<-data.frame(Date=strptime(paste(power.sub$Date, power.sub$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Global_active_power=as.numeric(power.sub$Global_active_power), Day=weekdays(as.Date(power.sub$Date, format = "%d/%m/%Y")))

##print graph in png file
plot(x = power2$Date, y=power2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##close image device
dev.off()