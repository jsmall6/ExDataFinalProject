# Exporing Data Project
# James Small
# 9/11/2017


library(dplyr)
library(ggplot2)

setwd("C://Users//jsmall//Documents//GitHub//ExDataFinalProject")

SCC <- readRDS("./DataFiles/Source_Classification_Code.rds")
NEI <- readRDS("./DataFiles/summarySCC_PM25.rds")

#Grep for only those Sectors referencing coal.

dfPlot5 <- inner_join(NEI, SCC) %>% 
  filter(SCC.Level.One == "Mobile Sources") %>%
  filter(fips == "24510") %>%
  select(c(Emissions, year)) %>% group_by(year) %>% summarize(Total=sum(Emissions)) 


ggplot(data=dfPlot4, aes(x=year, y=Total/100000)) +
  geom_point() + 
  ggtitle("Total PM2.5 All Mobile Sources \nBy Year (Baltimore City)") +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("PM2.5 per 100,000 tons")

ggsave("plot5.png", width=4, height=4)
