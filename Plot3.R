##first few lines of code is same as the Plot2.R file
file1<-read.table("./EP/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetfile1<-file1[file1$Date %in% c("1/2/2007","2/2/2007"),]
str(subsetfile1)
global_active_power<-as.numeric(subsetfile1$Global_active_power)
datetime<-strptime(paste(subsetfile1$Date,subsetfile1$Time,sep=""),"%d/%m/%Y %H:%M:%S")

# convert all the submetering data into numeric value and save in separate variables
submetering1<-as.numeric(subsetfile1$Sub_metering_1)
submetering2<-as.numeric(subsetfile1$Sub_metering_2)
submetering3<-as.numeric(subsetfile1$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(datetime,submetering1,type="l",ylab="Energy Metering",xlab="")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()
