# Load data
a <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

# Convert date format so it can be compared
a$Date1 <- as.Date(as.character(a$Date), "%d/%m/%Y")

# Subset data
a1 <- subset (a, (Date1 == "2007-02-01") |(Date1 == "2007-02-02"))

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(a1$Sub_metering_1,type ="n",main = NULL,xlab="", ylab ="",cex.lab=1,cex.axis=1,xaxt = "n",yaxt = "n")
lines(a1$Sub_metering_1,cex=0.1)
lines(a1$Sub_metering_2,cex=0.1,col="red")
lines(a1$Sub_metering_3,cex=0.1,col="blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))

# Adjust label:
axis(side = 1,tck=-.02,xaxp  = c(0, 2880,2), labels=NA)
axis(side = 2,tck=-.02,labels=NA)
axis(side = 1, lwd = 0, line = -0.2, cex.axis=1,at = c(0, 1440,2880),label = c("Thu","Fri","Sat"))
axis(side = 2, lwd = 0, line = -0.2, cex.axis=1)
mtext(side = 2, "Energy sub metering", line = 2.5,cex=1)
dev.off()