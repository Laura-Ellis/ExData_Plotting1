# JHU Exploratory Data Analysis
# Week 1: Course Project 1

# Set working directory
setwd("C:/Users/Laura/OneDrive/Coursera JHU/4_EXDATA")

# Open library
library(data.table)

# Import data 
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset data for plot 1
df2 <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

# Format date/time
df2$Date <- as.Date(df2$Date, format="%d/%m/%Y")
df2$Time <- strptime(df2$Time, format="%H:%M:%S")
df2[1:1440,"Time"] <- format(df2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df2[1441:2880,"Time"] <- format(df2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Save png
png("plot2.png", width=480, height=480)

# Create histogram
plot(df2$Time,as.numeric(as.character(df2$Global_active_power)),type="l", main="Global Active Power Vs Time", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
