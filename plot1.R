# Load data
a <- read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?")

# Convert date format so it can be compared
a$Date1 <- as.Date(as.character(a$Date), "%d/%m/%Y")

# Subset data
a1 <- subset (a, (Date1 == "2007-02-01") |(Date1 == "2007-02-02"))

# Make a histogram
png("plot1.png", width = 480, height = 480)
hist(a1$Global_active_power, main = "Global Active Power",xlab=NULL, ylab =NULL,col = 2,cex.lab=1,cex.axis=1,cex.main=1.2,xaxt = "n",yaxt = "n")
# Adjust label:
axis(side = 1,tck=-.02,labels=NA)
axis(side = 2,tck=-.02,labels=NA)
axis(side = 1, lwd = 0, line = -0.2, cex.axis=1)
axis(side = 2, lwd = 0, line = -0.2, cex.axis=1)
mtext(side = 1, "Global Active Power (kilowatts)", line = 2.5,cex=1)
mtext(side = 2, "Frequency", line = 2.5,cex=1)
dev.off()
