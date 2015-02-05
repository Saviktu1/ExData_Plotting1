library(utils)
library(data.table)
library(dplyr)
library(lubridate)

setwd("C:/Users/savik_000/Desktop/Data_Science_Specialization/Scripts/Exploratory_Data_Analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="t.zip")
unzip("t.zip",overwrite=TRUE)

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
hpc <- as.data.table(hpc)

hpc <- hpc %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) 
hpc_ss <- hpc %>% filter(Date %in% as.Date(c("2007-02-01","2007-02-02")))

png("plot3.png")
with(hpc_ss, plot(Sub_metering_1, 
                  type="l",
                  ylab="Energy sub metering",
                  xlab="",
                  axes=FALSE
                  )
     )
with(hpc_ss, lines(Sub_metering_2, col="red"))
with(hpc_ss, lines(Sub_metering_3, col="blue"))
axis(1, at=c(0, nrow(hpc_ss)/2, nrow(hpc_ss)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright",names(hpc_ss)[7:9], lty=1, col=c("black","red","blue"))
dev.off()
