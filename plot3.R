library(lubridate)
library(readr)


##Data can be downloaded directly from: "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

##Set WD to appropriate file containing the relevant data 
setwd("t:/pd/eda/")

powerdata <- read_delim("powerdata.txt", delim = ";", col_names = T)

powerdata$Date <- dmy(powerdata$Date)

powerdata1 <- powerdata %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02") 

powerdata2 <- unite(powerdata1, Date_Time, Date, Time, sep = "_")    
powerdata2$Date_Time <- ymd_hms(powerdata2$Date_Time)


plot(powerdata2$Date_Time, powerdata2$Sub_metering_1, type = "l", col ="black", ylab="Energy sub metering", xlab="")
lines(powerdata2$Date_Time, powerdata2$Sub_metering_2, type = "l", col ="red")
lines(powerdata2$Date_Time, powerdata2$Sub_metering_3, type = "l", col ="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1 , col = c("black", "red", "blue"))

dev.copy(png, file = "plot3.png") 
dev.off()
