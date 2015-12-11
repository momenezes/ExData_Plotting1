
hhpc <- read.csv("../data_project1/household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings='?')

hhpc$DT <- as.POSIXct(strptime(paste(hhpc$Date, hhpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),tz="GMT")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.

doisdias <- hhpc[hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007",]

png("plot1.png",width=480,height=480)

hist(doisdias$Global_active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
