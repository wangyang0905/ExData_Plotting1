## load data
tab5rows <- read.table("household_power_consumption.txt",
                       header=T, sep=";", nrows=5)
classes <- sapply(tab5rows, class)
dat <- read.table("household_power_consumption.txt",
                  header=T, sep=";", colClasses=classes, na.strings="?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$Time <- strptime(dat$Time, "%H:%M:%S")
dat <- subset(dat, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

## plot
png("plot1.png")
hist(dat$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()