# Exporing Data Project
# James Small
# 9/11/2017

library(dplyr)
library(ggplot2)

setwd("C://Users//jsmall//Documents//GitHub//ExDataFinalProject")

SCC <- readRDS("./DataFiles/Source_Classification_Code.rds")
NEI <- readRDS("./DataFiles/summarySCC_PM25.rds")

dfPlot3 <- NEI %>% filter(fips == "24510") %>% select(c(Emissions, year, type)) %>% group_by(year, type) %>% summarize(Total=sum(Emissions)) 

ggplot(data=dfPlot3, aes(x=year, y=Total)) + facet_grid(. ~ type) + 
  geom_point() + 
  ggtitle("Total PM2.5 All Sources \nBy Year and Source (Baltimore City)") +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("PM2.5 tons")
  
ggsave("plot3.png", width=4, height=4)
