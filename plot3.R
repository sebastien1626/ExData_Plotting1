#Download zip file
filename <- "household_power_consumption.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = filename,method = "curl")

#extract zip file
if(file.exists(filename)){unzip(filename)}

#create data frame
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

#Filter dates between 1/2/2007 and 2/2/2007
data <- subset(dataset, dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007")

#Convert the Date and Time variables to Date/Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")


#Making plot and saving in png
png('plot3.png')
with(data,{
  plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2, type="l", col="red")
  points(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", col =c("black", "blue", "red"), lty = 1, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
})
dev.off()
