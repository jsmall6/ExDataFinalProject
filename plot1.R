# Exporing Data Project
# James Small
# 9/11/2017

library(tidyr)
library(dplyr)

setwd("C://Users//jsmall//Documents//GitHub//ExDataFinalProject")

SCC <- readRDS("./DataFiles/Source_Classification_Code.rds")
NEI <- readRDS("./DataFiles/summarySCC_PM25.rds")

dfPlot1 <- NEI %>% select(c(Emissions, year)) %>% group_by(year) %>% summarize(Total=sum(Emissions)) 
png(file="plot1.png",width=480,height=480)
plot(dfPlot1$year, dfPlot1$Total/100000, main="Total PM2.5 All Sources \nBy Year", xlab="Year", ylab="PM2.5 per 100,000 tons")
dev.off()

