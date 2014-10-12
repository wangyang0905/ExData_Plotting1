## load data
tab5rows <- read.table("household_power_consumption.txt",
                       header=T, sep=";", nrows=5)
classes <- sapply(tab5rows, class)
dat <- read.table("household_power_consumption.txt",
                  header=T, sep=";", colClasses=classes, na.strings="?")
dat$Date <- as.character(dat$Date)
dat$Time <- as.character(dat$Time)
dat2d <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

## plot
png("plot2.png")
dat2d$datetime <- strptime(paste(dat2d$Date, dat2d$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
with(dat2d, plot(datetime, Global_active_power, type="l",
                 xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
