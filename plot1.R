plot1 <- function() {
  
  ## supposes data already local in working directory
  setwd("/Volumes/LightRoom 2 Backup/Data Science/Exploratory Data Analysis/Course Project 1")
  ## Substitute "?" as NA and cast columns as deisired (ie<> factor)
  epc.df<-read.csv("household_power_consumption.txt",sep=";", colClasses=c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?",NULL))  
 
  ## add timestamp field and date column with date type/ Dat2
  
  epc.df$ts <- strptime(paste(  epc.df[, 1] , epc.df[,2] ), "%d/%m/%Y %H:%M:%S")
  epc.df$Dat2 <- as.Date(epc.df[, 1], "%d/%m/%Y")
  ## subset rows to dates required with merge and typecast of character date
  epc2.df<-epc.df[epc.df$Dat2 %in% c(as.Date('2007-02-01'), as.Date('2007-02-02')),]
  ## remove all NAs 
  ## epc3.df<-epc2.df[complete.cases(epc2.df),]
  ## ready to plot
  par(mar = rep(4, 4))
  hist(epc2.df$Global_active_power, col=2,main="Global Active Power",xlab="Global Active Power (kilowatts)")
}