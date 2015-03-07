# Plot4
# Change path to txt file as needed
# Read the first 100 rows & get the datatype of each column

hpc <- read.table("C:\\Users\\MATTHEW\\Desktop\\ExData_Plotting1\\household_power_consumption.txt", 
                  sep=";", colClasses=c("character","character",rep("numeric",7)),header=TRUE,fill=TRUE, na.strings=c("","?","NA"))

# Change date column to date format
hpc$Date <-as.Date(hpc$Date,"%d/%m/%Y")

# Subset the dataset to dates 2007-02-01 & 2007-02-02
hpcsub <-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")

# Converting dates 
datetime <- paste(as.Date(hpcsub$Date), hpcsub$Time) 
hpcsub$Datetime <- as.POSIXct(datetime) 


# Plot file with dimensions 480x480 
png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) 
with(hpcsub, { 
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="") 
  
  
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime") 
  
  plot(Sub_metering_1~Datetime, type="l",  ylab="Energy sub metering", xlab="") 
  lines(Sub_metering_2~Datetime,col='Red') 
  lines(Sub_metering_3~Datetime,col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  
  plot(Global_reactive_power~Datetime, type="l",  
       ylab="Global_reactive_power",xlab="datetime") 
}) 


dev.off()