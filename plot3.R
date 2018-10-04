# Assumes you have data in wd already
# also assumed you have dplyr installed and loaded
#also assumed you have ggplot2 installed and loaded

# Question to answer - have total emission conditioned on type from PM25 decreased in Baltimore City (fips 24510) from 1999 to 2008? Use the BASE plot system, and plot the total PM25
# emission from all sources for each of the years available. 

pm25_raw <- readRDS("summarySCC_PM25.rds")
pm25_raw_grouped <- filter(pm25_raw, fips == "24510") %>% group_by(type, year) %>% summarize(Total_Emissions = sum(Emissions))

#one can easily see a downward trend visually just by eyeballing a simple plot
# large drop from 2000 to 2002, slight drop to 2004, large drop again in 2008.

png("plot3.png")
qplot(year, Total_Emissions, data = pm25_raw_grouped, facets = type~., geom = "line")
dev.off()

# By looking at the graphs it seems that all the types except for "point" have somewhat of a decreasing trend, but "point" has an increasing trend from 1999 - 2005, and a drop off from then until 2008. 




