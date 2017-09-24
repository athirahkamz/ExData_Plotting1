setwd('D:/R-Data Science/Exploratoty Data Analysis')

filename<-'inputData/household_power_consumption.txt'
lineDT<-readLines(filename)

iDT<-read.table(text=lineDT[substr(lineDT,1,8) %in% c('1/2/2007','2/2/2007','Date;Tim')],
                header=T,
                sep = ';',
                na.strings = '?',
                stringsAsFactors = F,
                colClasses = 'character')
iDT$Datetime<-as.POSIXct(paste(iDT$Date,iDT$Time),format = '%d/%m/%Y %H:%M:%OS')
png('plot3.png', width=480, height=480)
plot(x = iDT$Datetime,
     y = iDT$Sub_metering_1,
     xlab = '', 
     col='black',
     ylab = 'Energy sub metering', 
     type = 'l')
lines(iDT$Datetime, iDT$Sub_metering_2, col = 'red')
lines(iDT$Datetime, iDT$Sub_metering_3, col = 'blue')
legend('topright',
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col = c('black','red','blue'),
       lwd = 1)

dev.off()
