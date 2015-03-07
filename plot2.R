# Plot2 
# Change path to txt file as needed
# Read the first 100 rows & get the datatype of each column

hpc <- read.table("C:\\Users\\MATTHEW\\Desktop\\ExData_Plotting1\\household_power_consumption.txt", 
    sep=";", colClasses=c("character","character",rep("numeric",7)),header=TRUE,fill=TRUE, na.strings=c("","?","NA"))

# Change date column to date format
hpc$Date <-as.Date(hpc$Date,"%d/%m/%Y")

# Subset the dataset to dates 2007-02-01 & 2007-02-02
hpcsub <-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")
hpcsub$datetime<-as.POSIXct(paste(hpcsub$Date, hpcsub$Time), format="%Y-%m-%d %H:%M:%S")

# Plot file with dimensions 480x480
png(filename = "plot2.png",width = 480, height = 480)
# Add title and label
plot(hpcsub$datetime,hpcsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")    
dev.off()
