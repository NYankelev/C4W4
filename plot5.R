# Assumes you have data in wd already
# also assumed you have dplyr installed and loaded


#read in the codes and create a variable that contains the SCC values that correspond to vars containing the word "vehicle"

codes <- readRDS("Source_Classification_Code.rds")

# identifying which SCC has word "vehicle" in it to identify motor vehicle source
motor_codes <- as.character(codes[grepl("*Vehicle*", codes$SCC.Level.Two),1])

pm25_raw <- readRDS("summarySCC_PM25.rds")

pm25_raw_grouped <- filter(pm25_raw, SCC %in% motor_codes) %>% group_by(year) %>% summarize(Total_Emissions = sum(Emissions))

png("plot5.png")
with(pm25_raw_grouped, plot(year, Total_Emissions, type = "b", main = "Vehicle based PM25 emissions over time"))
dev.off()

# it appears from the graph that there is a strong downward trend.

