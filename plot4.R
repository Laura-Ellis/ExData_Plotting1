# JHU Exploratory Data Analysis
# Week 1: Course Project 1

# Set working directory
setwd("C:/Users/Laura/OneDrive/Coursera JHU/4_EXDATA")

# Open library
library(data.table)

# Import data 
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset data for plot 1
df4 <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

# Format date/time
df4$Date <- as.Date(df4$Date, format="%d/%m/%Y")
df4$Time <- strptime(df4$Time, format="%H:%M:%S")
df4[1:1440,"Time"] <- format(df4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df4[1441:2880,"Time"] <- format(df4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Save png
png("plot4.png", width=480, height=480)

# Set multiple plots area
par(mfrow=c(2,2))

# Create plot
with(df4,{
  plot(df4$Time,as.numeric(as.character(df4$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(df4$Time,as.numeric(as.character(df4$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(df4$Time,df4$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(df4,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(df4,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(df4,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(df4$Time,as.numeric(as.character(df4$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
