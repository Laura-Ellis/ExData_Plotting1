# JHU Exploratory Data Analysis
# Week 1: Course Project 1

# Set working directory
setwd("C:/Users/Laura/OneDrive/Coursera JHU/4_EXDATA")

# Open library
library(data.table)

# Import data 
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Subset data for plot 1
df1 <- subset(df,df$Date=="1/2/2007" | df$Date =="2/2/2007")

# Save png
png("plot1.png", width=480, height=480)

# Create histogram
hist(as.numeric(as.character(df1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab="Frequency")

dev.off()
