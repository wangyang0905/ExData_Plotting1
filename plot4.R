## load data
tab5rows <- read.table("household_power_consumption.txt",
                       header=T, sep=";", nrows=5)
classes <- sapply(tab5rows, class)
dat <- read.table("household_power_consumption.txt",
                  header=T, sep=";", colClasses=classes, na.strings="?")
dat$Date <- as.character(dat$Date)
dat$Time <- as.character(dat$Time)
dat2d <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
dat2d$datetime <- strptime(paste(dat2d$Date, dat2d$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")


## plot
png("plot4.png")
par(mfcol=c(2,2))
# plot(1,1)
with(dat2d, plot(datetime, Global_active_power, type="l",
                 xlab="", ylab="Global Active Power"))
# plot(2,1)
with(dat2d, plot(datetime, Sub_metering_1, xlab="", ylab="", type="n"))
with(dat2d, lines(datetime, Sub_metering_1, col="black"))
with(dat2d, lines(datetime, Sub_metering_2, col="red"))
with(dat2d, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1), bty="n")
title(ylab="Energy sub metering")
# plot(1,2)
with(dat2d, plot(datetime, Voltage, type="l"))
# plot(2,2)
with(dat2d, plot(datetime, Global_reactive_power, type="l"))
dev.off()
