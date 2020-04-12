plot2<-function(){
    
    library(dplyr)
    
    #read data from the file using reade data and defining separator ";" and Header = TRUE to get the header
    dataset<-read.table(".\\data\\household_power_consumption.txt", sep =";", header = TRUE)
    
    #Converting Date values for date class
    dataset$Date<-as.Date(as.character(strptime(dataset$Date,"%d/%m/%Y")))
    
    #subset data using dplyr filter fucntion for the selected dates
    febdataset<-filter(dataset, Date>="2007/02/01" & Date<="2007/02/02")
    
    #read.table brought values as factor, this next line is to convert to numeric
    febdataset$Global_active_power<-as.numeric(as.character(febdataset$Global_active_power))
    
    #Create new column with Data/Time together
    febdataset$DateTime<-paste(febdataset$Date, febdataset$Time)
    febdataset$DateTime<-ymd_hms(febdataset$DateTime)
    
    #Open PNG device; create 'plot2.png' in my working directory
    png(file = "plot2.png", width = 480, height = 480, units = "px") 
    
    #Second Plot: scatter graf with type = "n" to don't display anything, xlab empty ylab with string
    plot(febdataset$DateTime, febdataset$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
    #plot lines instead of pch
    lines(febdataset$DateTime, febdataset$Global_active_power)
    
    #Closing PNG Device
    dev.off() # close the PNG device!
    
    
}