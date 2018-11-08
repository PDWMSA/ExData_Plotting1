library(lubridate)
library(readr)
library(dplyr)

##Data can be downloaded directly from: "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

##Set WD to appropriate file containing the relevant data 
setwd("t:/pd/eda/")

powerdata <- read_delim("powerdata.txt", delim = ";", col_names = T)

powerdata$Date <- dmy(powerdata$Date)

powerdata1 <- powerdata %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02") 

par(mfrow = c(1,1))

powerdata2 <- unite(powerdata1, Date_Time, Date, Time, sep = "_")    
powerdata2$Date_Time <- ymd_hms(powerdata2$Date_Time)

plot(powerdata2$Date_Time, powerdata2$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab ="")

dev.copy(png, file = "plot2.png") 
dev.off()


