#creating plot1.png, a histogram of Global Active Power for Feb 1, 2007-Feb 2, 2007

#reading in data
hpc <- read.table('household_power_consumption.txt', sep=';', header=T, colClasses = c('character', 'character', 'numeric',
                  'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

#convert dates
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

#subsetting for desired dates
febfirstsecond<-subset(hpc, as.Date(DateTime)>=as.Date("2007-02-01") & as.Date(DateTime)<=as.Date("2007-02-02"))

#creating png of plot
png("plot1.png",height=480,width=480)
hist(febfirstsecond$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()