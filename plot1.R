library(utils)
library(data.table)
library(dplyr)

setwd("C:/Users/savik_000/Desktop/Data_Science_Specialization/Scripts/Exploratory_Data_Analysis")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="t.zip")
unzip("t.zip",overwrite=TRUE)

hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
hpc <- as.data.table(hpc)

hpc <- hpc %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) 
hpc_ss <- hpc %>% filter(Date %in% as.Date(c("2007-02-01","2007-02-02")))

png("plot1.png")
with(hpc_ss, hist(Global_active_power, 
                  col="red", 
                  main ="Global Active Power", 
                  xlab="Global Active Power (kilowatts)"
                  )
     )
dev.off()
