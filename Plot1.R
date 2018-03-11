library(data.table)
library(dplyr)

#read the file after unzipping and kept the file in the correct pathway and named the folder EP

file1<-read.table("./EP/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

# As per instructions need only selected rows

subsetfile1<-file1[file1$Date %in% c("1/2/2007","2/2/2007"),]
str(subsetfile1)

# Convert the required variable into numeric as they are in characters

global_active_power<-as.numeric(subsetfile1$Global_active_power)
png("plot1.png",width=480,height=480)
hist(global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
