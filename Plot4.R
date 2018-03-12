##first few lines of code is same as the Plot3.R file
file1<-read.table("./EP/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetfile1<-file1[file1$Date %in% c("1/2/2007","2/2/2007"),]
str(subsetfile1)
# convert all the column data into numeric value and save in separate variables
global_active_power<-as.numeric(subsetfile1$Global_active_power)
datetime<-strptime(paste(subsetfile1$Date,subsetfile1$Time,sep=""),"%d/%m/%Y %H:%M:%S")
submetering1<-as.numeric(subsetfile1$Sub_metering_1)
submetering2<-as.numeric(subsetfile1$Sub_metering_2)
submetering3<-as.numeric(subsetfile1$Sub_metering_3)
voltage<-as.numeric(subsetfile1$Voltage)
global_reactive_power<-as.numeric(subsetfile1$Global_reactive_power)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#cex=0.2, reduces the sizes of the plot, makes the whole image smaller
plot(datetime,global_active_power,type="l",xlab="",ylab="Global Active Power",cex=0.2)
plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")
plot(datetime,submetering1,type="l",xlab="",ylab="Energy Metering")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
#bty="n", removes the box from the legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"),bty="n")
plot(datetime,global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_Power")
dev.off()
