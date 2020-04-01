# Load libraries
pacman::p_load(devtools, tidyverse, readxl, stringr, stringi,blscrapeR, forcats, skimr, rio, lubridate, riem,
               dygraphs, epitools, tidyquant, quantmod, timetk, DT, scales, USAboundaries, USAboundariesData,
               ggrepel, sf, maps, geofacet, ggplot2, maptools, buildings, rnaturalearth, rvest, leaflet, 
               prettydoc, magrittr, cdlTools, htmltools, viridis, RColorBrewer, riem, weathermetrics, here)

# TMY3 data for Texas
tmy <- read_csv("personal_folders/nortont/US_tmy3 copy.csv") %>% 
  filter(State == "TX")
write_csv(tmy, "TX_tmy3.csv")

# Read in TMY3 data from Texas
TX_tmy3 <- read_csv("personal_folders/nortont/TX_tmy3.csv")

# TMY3 weather set for Houston 
Houston_tmy3 <- TX_tmy3 %>% 
  filter(StationName == "HOUSTON WILLIAM P HOBBY AP") %>% 
  mutate(month = month(mdy(`Date (MM/DD/YYYY)`)), 
         day = day(mdy(`Date (MM/DD/YYYY)`)), 
         hour = hour(`Time (HH:MM)`))

# Read in the Energy Plus data for the sample supermarket data 
Houston_StoreSim <- read_csv("raw_data/Energry Plus/houston.csv") 
Houston_StoreSim <- Houston_StoreSim %>% 
  mutate(Date.Time = as.character(`Date/Time`)) %>%
  separate(Date.Time, into = c("Date", "Time"), sep = 6) %>% 
  mutate(month = month(mdy(paste(Date, "/18"))), 
         day = day(mdy(paste(Date, "/18"))), 
         hour = hour(hms(Time))) %>% 
  select(Date, Time, month, day, hour, everything(), -`Date/Time`)

# Join the Energy Plus data and TMY3 data based on the 15 minute increments 
Houston <- left_join(Houston_StoreSim, Houston_tmy3) %>% 
  select(`Date (MM/DD/YYYY)`, `Time (HH:MM)`, Date, Time, month, day, hour, StationName, everything())

# Write joined data to csv
write_csv(Houston, "Houston.csv")