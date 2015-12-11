hhpc <- read.csv("../data_project1/household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings='?')

hhpc$DT <- as.POSIXct(strptime(paste(hhpc$Date, hhpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),tz="GMT")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.

doisdias <- hhpc[hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007",]

png("plot2.png",width=480,height=480)

plot(doisdias$Global_active_power,type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(doisdias$Global_active_power)
axis(1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"),tick=TRUE)

dev.off()
