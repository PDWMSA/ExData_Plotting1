library(lubridate)
library(readr)
library(dplyr)

##Data can be downloaded directly from: "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

##Set WD to appropriate file containing the relevant data 
setwd("t:/pd/eda/") 

powerdata <- read_delim("powerdata.txt", delim = ";", col_names = T)

powerdata$Date <- dmy(powerdata$Date)
par(mfrow = c(1,1))

powerdata1 <- powerdata %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02") 

hist(powerdata1$Global_active_power, col = "orangered", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()