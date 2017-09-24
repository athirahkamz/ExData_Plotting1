setwd('D:/R-Data Science/Exploratoty Data Analysis')

#Download, Extract input data to specifice location.
if(!file.exists('inputData')) dir.create('inputData')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if(!file.exists('./inputData/household_power_consumption.zip')) 
  {
  download.file(fileUrl, destfile = './inputData/household_power_consumption.zip')
  }
if(!file.exists('household_power_consumption.txt'))
  {
  unzip('./inputData/household_power_consumption.zip', exdir = './inputData')
  }

filename<-'inputData/household_power_consumption.txt'
lineDT<-readLines(filename)

iDT<-read.table(text=lineDT[substr(lineDT,1,8) %in% c('1/2/2007','2/2/2007','Date;Tim')],
                header=T,
                sep = ';',
                na.strings = '?',
                stringsAsFactors = F,
                colClasses = 'character')

png('plot1.png', width=480, height=480)
hist(x = as.numeric(iDT$Global_active_power),
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = 'red')

dev.off()
