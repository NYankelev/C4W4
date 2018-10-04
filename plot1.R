# Assumes you have data in wd already
# also assumed you have dplyr installed

# Question to answer - have total emission from PM25 decreased in the United
# States from 1999 to 2008? Use the BASE plot system, and plot the total PM25
# emission from all sources for each of the years available. 

pm25_raw <- readRDS("summarySCC_PM25.rds")
pm25_raw_grouped <- group_by(pm25_raw, year) %>% summarize(Total_Emissions = sum(Emissions))

#one can easily see a downward trend visually just by eyeballing a simple plot
# large drop from 2000 to 2002, slight drop to 2004, large drop again in 2008.

png("plot1.png")
with(pm25_raw_grouped, plot(year, Total_Emissions, main = "Total Emissions of Pm25 over time", type = "b"))
dev.off()



