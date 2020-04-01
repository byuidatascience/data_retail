# Tanners Master Script

# Load libraries
pacman::p_load(devtools,tidyverse, readxl, stringr, stringi,blscrapeR, forcats, skimr, rio, lubridate, riem, 
               dygraphs,epitools, tidyquant, quantmod, timetk, DT, scales, USAboundaries, USAboundariesData,
               ggrepel,sf, maps, geofacet, ggplot2, maptools, buildings, rnaturalearth, rvest, leaflet, 
               prettydoc, magrittr, cdlTools, htmltools, viridis, RColorBrewer, riem, weathermetrics, here)



# tmy <- read_csv("personal_folders/nortont/US_tmy3 copy.csv") %>% 
# filter(State == "WA")

# write_csv(tmy, "WA_tmy3.csv")


# Read in tmy3 data from Washington state
WA_tmy3 <- read_csv("personal_folders/nortont/WA_tmy3.csv")

# Tmy3 weather set for Seattle
Seattle_tmy3 <- WA_tmy3 %>% 
  filter(StationName == "SEATTLE SEATTLE-TACOMA INTL A") %>% 
  mutate(month = month(mdy(`Date (MM/DD/YYYY)`)), 
         day = day(mdy(`Date (MM/DD/YYYY)`)), 
         hour = hour(`Time (HH:MM)`))

# Read in the data for the sample supermarket data 
Seattle_StoreSim <- read_csv("raw_data/Energry Plus/seattle.csv") 
# Reading in the data is commented out because I used a slower package from the gdata library 
Seattle_StoreSim <- Seattle_StoreSim %>% 
  mutate(Date.Time = as.character(`Date/Time`)) %>%
  separate(Date.Time, into = c("Date", "Time"), sep = 6) %>% 
  mutate(month = month(mdy(paste(Date, "/18"))), 
         day = day(mdy(paste(Date, "/18"))), 
         hour = hour(hms(Time))) %>% 
  select(Date, Time, month, day, hour, everything(), -`Date/Time`)

# Join the two datasets based on the 15 minute increments 
Seattle <- left_join(Seattle_StoreSim, Seattle_tmy3) %>% 
  select(`Date (MM/DD/YYYY)`, `Time (HH:MM)`, Date, Time, month, day, hour, StationName, everything())

# Write joined data to csv
# write_csv(Seattle, "Seattle.csv")
 