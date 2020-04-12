plot3<-function(){
    
    library(dplyr)
    
    #read data from the file using reade data and defining separator ";" and Header = TRUE to get the header
    dataset<-read.table(".\\data\\household_power_consumption.txt", sep =";", header = TRUE)
    
    #Converting Date values for date class
    dataset$Date<-as.Date(as.character(strptime(dataset$Date,"%d/%m/%Y")))
    
    #subset data using dplyr filter fucntion for the selected dates
    febdataset<-filter(dataset, Date>="2007/02/01" & Date<="2007/02/02")
    
    #read.table brought values as factor, this next line is to convert to numeric
    febdataset$Sub_metering_1<-as.numeric(as.character(febdataset$Sub_metering_1))
    febdataset$Sub_metering_2<-as.numeric(as.character(febdataset$Sub_metering_2))
    febdataset$Sub_metering_3<-as.numeric(as.character(febdataset$Sub_metering_3))
    
    febdataset$DateTime<-paste(febdataset$Date, febdataset$Time)
    febdataset$DateTime<-ymd_hms(febdataset$DateTime)
    
    #Open PNG device; create 'plot3.png' in my working directory
    png(file = "plot3.png", width = 480, height = 480, units = "px") 
    
    #Third Plot: scatter graf with type = "n" to don't display anything, xlab empty ylab with string
    plot(febdataset$DateTime, febdataset$Sub_metering_1, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    points(febdataset$Sub_metering_2)
    points(febdataset$Sub_metering_3)
    
    #plot lines instead of pch and change color for the other data series
    lines(febdataset$DateTime, febdataset$Sub_metering_1)
    lines(febdataset$DateTime, febdataset$Sub_metering_2, col="red")
    lines(febdataset$DateTime, febdataset$Sub_metering_3, col="blue")
    
    #create legend
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
    
    #Closing PNG Device
    dev.off() # close the PNG device!
    
    
}