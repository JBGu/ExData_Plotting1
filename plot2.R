data<- read.table('household_power_consumption.txt', sep=';', header = TRUE, colClasses = c('character', 'character', 'numeric', 'numeric',
                                                                                            'numeric', 'numeric','numeric', 'numeric', 'numeric'),na.strings = '?')


        data$Date_Time<- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

        data <- subset(data,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))


png("plot2.png", height=480, width=480)
        
        plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()