# Exporing Data Project
# James Small
# 9/11/2017


library(dplyr)
library(ggplot2)

setwd("C://Users//jsmall//Documents//GitHub//ExDataFinalProject")

SCC <- readRDS("./DataFiles/Source_Classification_Code.rds")
NEI <- readRDS("./DataFiles/summarySCC_PM25.rds")

#Grep for only those Sectors referencing coal.
dfPlot6 <- inner_join(NEI, SCC) %>% 
  filter(SCC.Level.One == "Mobile Sources") %>%
  filter(fips == c("06037","24510")) %>%
  select(c(Emissions, year, fips)) %>% group_by(year, fips) %>% summarize(Total=sum(Emissions)) %>%
  mutate(Region = ifelse(fips == "24510", "Baltimore City", "Los Angeles County"))

ggplot(data=dfPlot6, aes(x=year, y=Total)) +
  facet_grid(. ~ Region) +
  geom_point() + 
  ggtitle("Total PM2.5 All Mobile Sources \nBy Year (Baltimore City vs Los Angeles County)") +
  theme(axis.text.x = element_text(angle = 90)) +
  ylab("PM2.5 per tons")

ggsave("plot6.png", width=4, height=4)
