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

png("plot4.png")
par(mfrow=c(2,2))
with(hpc_ss, plot(Global_active_power, 
                  type="l",
                  ylab="Global Active Power",
                  xlab="",
                  cex.lab=0.9,
                  axes=FALSE
    )
)
axis(1, at=c(0, nrow(hpc_ss)/2, nrow(hpc_ss)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
with(hpc_ss, plot(Voltage, 
                  type="l",
                  ylab="Voltage",
                  xlab="datetime",
                  cex.lab=0.9,
                  axes=FALSE
    )
)
axis(1, at=c(0, nrow(hpc_ss)/2, nrow(hpc_ss)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
with(hpc_ss, plot(Sub_metering_1, 
                  type="l",
                  ylab="Energy sub metering",
                  xlab="",
                  cex.lab=0.9,
                  axes=FALSE
                  )
     )
with(hpc_ss, lines(Sub_metering_2, col="red"))
with(hpc_ss, lines(Sub_metering_3, col="blue"))
axis(1, at=c(0, nrow(hpc_ss)/2, nrow(hpc_ss)), lab=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright",names(hpc_ss)[7:9], lty=1, bty="n",col=c("black","red","blue"), cex=0.9)
with(hpc_ss, plot(Global_reactive_power, 
                  type="l",
                  ylab="Global_reactive_power",
                  xlab="datetime",
                  cex.lab = 0.9,
                  axes=FALSE
)
)
axis(1, at=c(0, nrow(hpc_ss)/2, nrow(hpc_ss)), lab=c("Thu","Fri","Sat"))
axis(2, at=seq(0,0.5,0.1),labels=c("0.0","0.1","0.2","0.3","0.4","0.5"), cex.axis=0.9)
box()
dev.off()
