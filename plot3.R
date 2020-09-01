# JHU Exploratory Data Analysis
# Week 1: Course Project 1

# Set working directory
setwd("C:/Users/Laura/OneDrive/Coursera JHU/4_EXDATA")

# Open library
library(data.table)

# Import data 
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset data for plot 1
df3 <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

# Format data/time
df3$Date <- as.Date(df3$Date, format="%d/%m/%Y")
df3$Time <- strptime(df3$Time, format="%H:%M:%S")
df3[1:1440,"Time"] <- format(df3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df3[1441:2880,"Time"] <- format(df3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Save png
png("plot3.png", width=480, height=480)

# Create plot
plot(df3$Time,df3$Sub_metering_1,type="n",main="Energy sub-metering", xlab="",ylab="Energy sub metering")
with(df3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(df3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(df3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
