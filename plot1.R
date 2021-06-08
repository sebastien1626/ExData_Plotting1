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
png('plot1.png')
hist(data$Global_active_power, col = "red", main="Gobal Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
