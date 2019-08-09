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

# PLOT 1
hist(data$Global_active_power, main='Global Active Power', xlab = 'Global Active Power (kilowatts)', col='red')  # Makes histogram
#saves plot
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()