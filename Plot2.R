
##first few lines of code is same as the Plot1.R file
file1<-read.table("./EP/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetfile1<-file1[file1$Date %in% c("1/2/2007","2/2/2007"),]
str(subsetfile1)
global_active_power<-as.numeric(subsetfile1$Global_active_power)


datetime<-strptime(paste(subsetfile1$Date,subsetfile1$Time,sep=""),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(datetime,global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
