# Tanners Master Script

# Load libraries
pacman::p_load(devtools,tidyverse, readxl, stringr, stringi,blscrapeR, forcats, skimr, rio, lubridate, riem, 
               dygraphs,epitools, tidyquant, quantmod, timetk, DT, scales, USAboundaries, USAboundariesData,
               ggrepel,sf, maps, geofacet, ggplot2, maptools, buildings, rnaturalearth, rvest, leaflet, 
               prettydoc, magrittr, cdlTools, htmltools, viridis, RColorBrewer, riem, weathermetrics, here)

#set working directory to project directory.
# Dynamic loop to pull all the weather dataframes
states <- c("ID", "FL", "MA", "CA", "IL", "UT")


for (st in states) {
  WeatherStation <- read_csv(paste("derived_data/", st, "_tmy3/", st, "_WeatherStationList.csv", sep = "")) %>% 
    mutate(StationName = Name)
  
  # Loop to read in all the weather station/airport data
  tmy3 <- data.frame() # Empty Dataframe to put tmy3 info
  
  for (name in WeatherStation$Name){
    station <- read_csv(paste("derived_data/",st,"_tmy3/",name,".csv",sep=""), skip = 1) %>% 
      mutate(StationName = name) %>% 
      select(1,2,StationName,everything()) # Replace the station name each loop
    tmy3 <- rbind(tmy3, station) # Bind to main dataframe
    tmy3[is.na(tmy3)] <- 0    # Enters in 00:00 for time when values were null
    print(name) # indicator for how it's moving *shrug* 
  }
  
  nam <- paste(st,"_tmy3", sep = "")
  assign(nam,tmy3)
}





# Tmy3 weather set for San Fransisco
SanFrancisco_tmy3 <- CA_tmy3 %>% 
  filter(StationName == "San Francisco Intl AP") %>% 
  mutate(month = month(mdy(`Date (MM/DD/YYYY)`)), 
         day = day(mdy(`Date (MM/DD/YYYY)`)), 
         hour = hour(`Time (HH:MM)`))

# Read in the data for the sample supermarket data 
SanFrancisco_StoreSim <- read_csv("raw_data/Energry Plus/san_fran.csv") 
# Reading in the data is commented out because I used a slower package from the gdata library 
SanFrancisco_StoreSim <- SanFrancisco_StoreSim %>% 
  mutate(Date.Time = as.character(`Date/Time`)) %>%
  separate(Date.Time, into = c("Date", "Time"), sep = 6) %>% 
  mutate(month = month(mdy(paste(Date, "/18"))), 
         day = day(mdy(paste(Date, "/18"))), 
         hour = hour(as_hms(Time))) %>% 
  select(Date, Time, month, day, hour, everything(), -`Date/Time`)

# Join the two datasets based on the 15 minute increments 
SanFran <- left_join(SanFrancisco_StoreSim, SanFrancisco_tmy3) 


# Write joined data to csv
# write_csv(SanFran, "SanFran.csv")

SanFran <- read_csv("derived_data/joined_data/SanFran.csv") %>% 
  select(`Date (MM/DD/YYYY)`, `Time (HH:MM)`, Date, Time, month, day, hour, StationName, everything())

# write_csv(SanFran, "SanFran.csv")

