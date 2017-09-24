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
png('plot2.png', width=480, height=480)
plot(x = iDT$Datetime,
     y = iDT$Global_active_power,
     xlab = '', 
     ylab = 'Global Active Power (kilowatt)', 
     type = 'l')
dev.off()
