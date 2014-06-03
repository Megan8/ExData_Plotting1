#creating plot2.png

#reading in data
hpc <- read.table('household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character', 'numeric',
                                                                                       'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

#convert dates
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

#subsetting for desired dates
febfirstsecond<-subset(hpc, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime)<=as.Date("2007-02-02"))

#creating png of plot
png("plot2.png",height=480,width=480)
plot(febfirstsecond$Global_active_power,type="l",xlab="",xaxt="n",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()