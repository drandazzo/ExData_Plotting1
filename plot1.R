##Exploratory Data Anaysis - Project 1
##Graph 1

##Set path to file
setwd("D:\\Courses\\Exploratory_Data_Analysis\\Project_1")

##Read in file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",
                    colClasses= c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Take subset for days we want to look at
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")

##prepare png image device
png("plot1.png",width=480, height=480, units="px", pointsize=12, bg="white", res=NA,restoreConsole=TRUE)

##print graph in png file
hist(power.sub$Global_active_power, col ="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close image device
dev.off()