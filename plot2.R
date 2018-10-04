# Assumes you have data in wd already
# also assumed you have dplyr installed

# Question to answer - have total emission from PM25 decreased in Baltimore City (fips 24510) from 1999 to 2008? Use the BASE plot system, and plot the total PM25
# emission from all sources for each of the years available. 

pm25_raw <- readRDS("summarySCC_PM25.rds")
pm25_raw_grouped <- filter(pm25_raw, fips == "24510") %>% group_by(year) %>% summarize(Total_Emissions = sum(Emissions))

png("plot2.png")
with(pm25_raw_grouped, plot(year, Total_Emissions, type = "b", main = "Baltimore City PM25 emissions by year"))
dev.off()

# By looking at the graph it is clear that there is no definite trend in PM25 levels for Baltimore city. 


