data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = '?')
data <- data[complete.cases(t),] # rm na's
data$Date <- as.Date(data$Date, '%d/%m/%Y') #cnvrt to date format
data <- subset(data, Date >= as.Date('2007-2-1') & Date <= as.Date('2007-2-2')) # select range we want to analyze
#coerce the data into a tidy form before we begin plotting
date_time <- paste(data$Date, data$Time)
date_time <- setNames(dateTime, 'DateTime')
data <- data[,!(names(data) %in% c('Date','Time'))]
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)


#PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))  # creates the layout for the plots
  with(data, 
  {
    plot(Global_active_power ~ dateTime, type='l', 
         ylab='Global Active Power (kilowatts)', xlab='')  # same as plot 2 from above
    plot(Voltage ~ dateTime, type='l', 
         ylab='Voltage (volt)', xlab='')  # plots voltage v time
    # Same as plot 3 from above
    plot(Sub_metering_1 ~ dateTime, type='l', 
         ylab='Global Active Power (kilowatts)', xlab='')
    lines(Sub_metering_2 ~ dateTime,col='Red')
    lines(Sub_metering_3 ~ dateTime,col='Blue') 
    legend('topright', col=c('black', 'red', 'blue'), lty=1, lwd=2, bty='n',
           legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    plot(Global_reactive_power~dateTime, type='l', 
         ylab='Global Rective Power (kilowatts)',xlab='')  # plots GRP vs time
  }) 
#saves plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
