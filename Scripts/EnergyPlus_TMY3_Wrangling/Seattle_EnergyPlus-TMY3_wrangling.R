#SEATTLE WRANGLING

# Read joined Energy Plus and TMY3 data
STL <- read_csv("~/Desktop/EMERSON/emerson_data_WI20/derived_data/Joined_data/Seattle.csv") %>% 
  
  # Renaming columns to be shorter but still descriptive
  # Divide by 1000 to convert units into kilowatts
  mutate(total_kW = `Power:Facility [W](TimeStep)` / 1000, 
         heating_kW = `Heating:Electric Power [W](TimeStep)` / 1000, 
         cooling_kW = `Cooling::Electric Power [W](TimeStep)` / 1000, 
         lightInt_kW = `InteriorLights::Electric Power [W](TimeStep)` / 1000, 
         lightsExt_kW = `ExteriorLights::Electric Power [W](TimeStep)` / 1000, 
         equipment_kW = `InteriorEquipment::Electric Power [W](TimeStep)` / 1000, 
         fans_kW = `Fans::Electric Power [W](TimeStep)` / 1000, 
         pumps_kW = `Pumps::Electric Power [W](TimeStep)` / 1000, 
         refrigeration_kW = `Refrigeration::Electric Power [W](TimeStep)` / 1000) %>% 
  
  # Removing unnecessary or redundant columns
  select(-c(`Power:Facility [W](TimeStep)`,`Heating:Electric Power [W](TimeStep)`,
            `Cooling::Electric Power [W](TimeStep)`, `InteriorLights::Electric Power [W](TimeStep)`,
            `ExteriorLights::Electric Power [W](TimeStep)`, `InteriorEquipment::Electric Power [W](TimeStep)`, 
            `Fans::Electric Power [W](TimeStep)`, `Pumps::Electric Power [W](TimeStep)`, `GHI source`, 
            `GHI uncert (%)`, `DNI source`, `DNI uncert (%)`, `DHI source`, `DHI uncert (%)`, `GH illum source`,
            `Global illum uncert (%)`, `DN illum source`, `DN illum uncert (%)`, `DH illum source`, 
            `DH illum uncert (%)`, `Zenith lum source`, `Zenith lum uncert (%)`, `TotCld source`, 
            `TotCld uncert (code)`, `OpqCld source`, `OpqCld uncert (code)`, `Dry-bulb source`, 
            `Dry-bulb uncert (code)`, `Dew-point source`, `Dew-point uncert (code)`, `RHum source`, 
            `RHum uncert (code)`, `Pressure source`, `Pressure uncert (code)`, `Wdir source`, 
            `Wdir uncert (code)`, `Wspd source`, `Wspd uncert (code)`, `Hvis source`, `Hvis uncert (code)`, 
            `CeilHgt source`, `CeilHgt uncert (code)`, `Pwat source`, `Pwat uncert (code)`, `AOD source`, 
            `AOD uncert (code)`, `Alb source`, `Alb uncert (code)`, `Lprecip quantity (hr)`, `Lprecip source`, 
            `Lprecip uncert (code)`, `PresWth (METAR code)`, `PresWth source`, `PresWth uncert (code)`, 
            `Dry-bulb (C)`, `Refrigeration::Electric Power [W](TimeStep)`, `Electricity:Facility [J](TimeStep)`,
            `Heating:Electricity [J](TimeStep)`, `Cooling:Electricity [J](TimeStep)`, 
            `InteriorLights:Electricity [J](TimeStep)`, `ExteriorLights:Electricity [J](TimeStep)`, 
            `InteriorEquipment:Electricity [J](TimeStep)`, `Fans:Electricity [J](TimeStep)`, 
            `Pumps:Electricity [J](TimeStep)`, `Refrigeration:Electricity [J](TimeStep)`, 
            `Date (MM/DD/YYYY)`, `State`)) %>% 
  
  # Rename remaining columns to be shorter but still descriptive
  rename(date = Date, time = Time, station = StationName) %>% 
  rename(drybulb_tempC = `Environment:Site Outdoor Air Drybulb Temperature [C](TimeStep)`) %>% 
  rename(wetbulb_tempC = `Environment:Site Outdoor Air Wetbulb Temperature [C](TimeStep)`) %>% 
  rename(Time = `Time (HH:MM)`)

# Write into .csv
write.csv(STL, "Seattle_dat.csv")