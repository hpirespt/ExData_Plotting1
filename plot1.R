plot1<-function(){
    
    library(dplyr)
    
    #read data from the file using reade data and defining separator ";" and Header = TRUE to get the header
    dataset<-read.table(".\\data\\household_power_consumption.txt", sep =";", header = TRUE)
    
    #Converting Date values for date class
    dataset$Date<-as.Date(as.character(strptime(dataset$Date,"%d/%m/%Y")))
    
    #subset data using dplyr filter fucntion for the selected dates
    febdataset<-filter(dataset, Date>="2007/02/01" & Date<="2007/02/02")
    
    #read.table brought values as factor, this next line is to convert to numeric
    febdataset$Global_active_power<-as.numeric(as.character(febdataset$Global_active_power))
    
    #Open PNG device; create 'plot1.png' in my working directory
    png(file = "plot1.png") 
    
    #First Plot: col to define color, main to define title, xlab to define x axis text
    hist(febdataset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
    #Closing PNG Device
    dev.off() # close the PNG device!
    
                          
}