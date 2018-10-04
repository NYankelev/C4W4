# Assumes you have data in wd already
# also assumed you have dplyr installed and loaded

#For this problem we need to determine how emissions from COAL combustion related sources changed across the US from 1999-2008. 

#read in the codes and create a variable that contains the SCC values that correspond to vars containing the word "coal"

codes <- readRDS("Source_Classification_Code.rds")
coal_codes <- as.character(codes[grepl("*Coal*", codes$SCC.Level.Three) & grepl("*Combustion*", codes$SCC.Level.One),1])


pm25_raw <- readRDS("summarySCC_PM25.rds")

pm25_raw_grouped <- filter(pm25_raw, SCC %in% coal_codes) %>% group_by(year) %>% summarize(Total_Emissions = sum(Emissions))

png("plot4.png")
with(pm25_raw_grouped, plot(year, Total_Emissions, type = "b", main = "Coal based PM25 emissions over time"))
dev.off()

# it appears from the graph that there was not a very significant trend from 1999-2005, but then a large drop off to 2008. 

