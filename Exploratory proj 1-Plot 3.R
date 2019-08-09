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


# PLOT 3
with(data, 
	{ 
	plot(Sub_metering_1 ~ dateTime, xlab='', ylab='Global Active Power (kilowatts)', type='l')  # Makes first line plot and axis labels
    lines(Sub_metering_2 ~ dateTime,col='Red')  # Overplots metering 2 
    lines(Sub_metering_3 ~ dateTime,col='Blue')  # Overplots metering 3
    })
  legend('topright', col=c('black', 'red', 'blue'), lwd=c(1,1,1), 
         c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))  # Legend
#saves plot
dev.copy(png, file='plot3.png', height=480, width=480)
dev.off()
