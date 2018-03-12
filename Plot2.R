
##first few lines of code is same as the Plot1.R file





datetime<-strptime(paste(subsetfile1$Date,subsetfile1$Time,sep=""),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(datetime,global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
