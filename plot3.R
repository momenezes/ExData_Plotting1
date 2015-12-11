hhpc <- read.csv("../data_project1/household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings='?')

hhpc$DT <- as.POSIXct(strptime(paste(hhpc$Date, hhpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),tz="GMT")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.

doisdias <- hhpc[hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007",]

png("plot3.png",width=480,height=480)

plot(doisdias$Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering")
lines(doisdias$Sub_metering_1,col="black")
lines(doisdias$Sub_metering_2,col="red")
lines(doisdias$Sub_metering_3,col="blue")
axis(1,at=c(0,1440,2881),labels=c("Thu","Fri","Sat"),tick=TRUE)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
