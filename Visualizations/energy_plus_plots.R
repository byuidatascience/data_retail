# ENERGY PLUS DATA VISUALIZATIONS

# Load libraries
pacman::p_load(devtools, tidyverse, readxl, stringr, stringi,
               blscrapeR, forcats, skimr, rio, lubridate, riem,
               dygraphs, epitools, tidyquant, quantmod, timetk, 
               DT, scales, USAboundaries, USAboundariesData,
               ggrepel, sf, maps, geofacet, ggplot2, maptools, 
               buildings, rnaturalearth, rvest, leaflet, 
               prettydoc, magrittr, cdlTools, htmltools, viridis, 
               RColorBrewer, riem, weathermetrics, here)

# Load data for all eight cities
ABQep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/albuquerque_joined.csv")
ATLep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/atlanta_joined.csv")
BLTep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/baltimore_joined.csv")
HSTep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/houston_joined.csv")
LAep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/los_angeles_joined.csv")
PHXep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/phoenix_joined.csv")
SFep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/san_francisco_joined.csv")
STLep <- read_csv("~/Desktop/EMERSON/emerson_data_retail/Energy_Plus_data/Energy_Plus_TMY3_Joined/seattle_joined.csv")

# Albuquerque Plot
ggplot(ABQep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Albuquerque, NM)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("albuquerque_energy_plus.png")

# Atlanta Plot
ggplot(ATLep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Atlanta, GA)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("atlanta_energy_plus.png")

# Baltimore Plot
ggplot(BLTep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Baltimore, MD)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("baltimore_energy_plus.png")

# Houston Plot
ggplot(HSTep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Houston, TX)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("houston_energy_plus.png")

# Los Angeles Plot
ggplot(LAep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Los Angeles, CA)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("los_angeles_energy_plus.png")

# Phoenix Plot
ggplot(PHXep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Phoenix, AZ)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("phoenix_energy_plus.png")

# San Francisco Plot
ggplot(SFep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (San Francisco, CA)") +
  theme(plot.title = element_text(hjust = 0.5)) 
  #theme(legend.position = "none")
  #ggsave("san_francisco_energy_plus.png")

# Seattle Plot
ggplot(STLep, aes(x = month, y = `Power:Facility [W](TimeStep)`)) +
  theme_bw() +
  geom_bin2d() +
  scale_y_continuous(breaks = seq(48723, 383544, 30000)) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  geom_smooth(color = "firebrick", size = 1.5) +
  labs(x = "Month", y = "Total kilowatts") +
  ggtitle("Total Facility Power by Month (Seattle, WA)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  #theme(legend.position = "none")
  #ggsave("seattle_energy_plus.png", width = 2.22, height = 1.72 , units = "in")
  ggsave("seattle_energy_plus.png", limitsize = TRUE)
