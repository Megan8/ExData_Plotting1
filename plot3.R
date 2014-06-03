#creating plot3.png

#reading in data
hpc <- read.table('household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character', 'numeric',
                                                                                       'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

#convert dates
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

#subsetting for desired dates
febfirstsecond<-subset(hpc, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime)<=as.Date("2007-02-02"))

#creating png of plot
png("plot3.png",height=480,width=480)
plot(febfirstsecond$Sub_metering_1,type="l",xlab="",xaxt="n",ylab="Energy sub metering")
lines(febfirstsecond$Sub_metering_2,col="red")
lines(febfirstsecond$Sub_metering_3,col="blue")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()