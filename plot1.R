# plot1 Histogram Global_active_power


data<- read.table('household_power_consumption.txt', sep=';', header = TRUE, colClasses = c('character', 'character', 'numeric', 'numeric',
'numeric', 'numeric','numeric', 'numeric', 'numeric'),na.strings = '?')

        # Read data, convert dates and subset on two days
        data$Date_Time<- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

        data <- subset(data,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))

# open plot1.png
png("plot1.png", height=480, width=480)

        hist(data$Global_active_power,breaks=12, col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#close plot1.png
dev.off()