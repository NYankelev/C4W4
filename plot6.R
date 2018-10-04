# Compare MOTOR VEHICLE emissions in BALTIMORE against MOTOR VEHICLE in LOS ANGELES (fips of 06037).

# identifying which SCC has word "vehicle" in it to identify motor vehicle source
motor_codes <- as.character(codes[grepl("*Vehicle*", codes$SCC.Level.Two),1])

pm25_raw <- readRDS("summarySCC_PM25.rds")
pm25_raw_LA <- filter(pm25_raw, fips == "06037" & SCC %in% motor_codes) %>% group_by(fips, year) %>% summarize(Total_Emissions = sum(Emissions))

pm25_raw_Baltimore <- filter(pm25_raw, fips == "24510" & SCC %in% motor_codes) %>% group_by(fips, year) %>% summarize(Total_Emissions = sum(Emissions))


# I looked at the values, and Baltimore and LA are very far apart, and it would be inappropriate to put them both on the same graph. Therefore we are going to plot them separately.

png("plot6.png")
par(mfrow = (c(2,1)))
    
with(pm25_raw_LA, plot(year, Total_Emissions, main = "PM25 emissions for vehicles in LA over time", type = "b"))    

with(pm25_raw_Baltimore, plot(year, Total_Emissions, main = "PM25 emissions for vehicles in Baltimore over time", type = "b"))    
dev.off()




