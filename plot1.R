# Plot1 
# Change path to txt file as needed
# Read the first 100 rows & get the datatype of each column

hpc <- read.table("C:\\Users\\MATTHEW\\Desktop\\ExData_Plotting1\\household_power_consumption.txt", 
    sep=";", colClasses=c("character","character",rep("numeric",7)),header=TRUE,fill=TRUE, na.strings=c("","?","NA"))

# Change date column to date format
hpc$Date <-as.Date(hpc$Date,"%d/%m/%Y")

# Subset the dataset to dates 2007-02-01 & 2007-02-02
hpcsub <-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")

# Plot bar chart with dimensions 480x480
png(filename = "plot1.png",width = 480, height = 480)
# Add title and label
hist(hpcsub$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# Add axis graduations
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200))     
dev.off()

