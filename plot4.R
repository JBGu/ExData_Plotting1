#plot4 Four gaphics Global active power, voltage, Energy sub metering, Global reactive power

data<- read.table('household_power_consumption.txt', sep=';', header = TRUE, colClasses = c('character', 'character', 'numeric', 'numeric',
                                                                                            'numeric', 'numeric','numeric', 'numeric', 'numeric'),na.strings = '?')

        # Read data, convert dates and subset on two days
        data$Date_Time<- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

        data <- subset(data,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))


#open plot4.png
png("plot4.png", height=480, width=480)
        par(mfrow=c(2,2))
                plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
                
                plot(data$Date_Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
                
                plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
                        lines(data$Date_Time,data$Sub_metering_2,col="red")
                        lines(data$Date_Time,data$Sub_metering_3,col="blue")

                        variables <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                        legend("topright", lty=1, col=c("black", "red", "blue"), legend=variables)

                plot(data$Date_Time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


#close plot4.png
dev.off()