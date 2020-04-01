# Energy Plus Data

This folder contains the Energy Plus data for eight cities in the United States. The data is essentially simulation data of reference supermarkets. These cities, contained in separate .csv files, include:

- Albuquerque, New Mexico
- Atlanta, Georgia
- Baltimore, Maryland
- Houston, Texas
- Los Angeles, California
- Phoenix, Arizona
- San Francisco, California
- Seattle, Washington

Each .csv has 52560 observations of 21 variables.

## Data Columns

- `Date/Time`                              
- `Environment:Site Outdoor Air Drybulb Temperature [C](TimeStep)`
- `Environment:Site Outdoor Air Wetbulb Temperature [C](TimeStep)`
- `Electricity:Facility [J](TimeStep)` - the total electricity column in Joules
- `Heating:Electricity [J](TimeStep)`
- `Cooling:Electricity [J](TimeStep)`
- `InteriorLights:Electricity [J](TimeStep)`
- `ExteriorLights:Electricity [J](TimeStep)`
- `InteriorEquipment:Electricity [J](TimeStep)`
- `Fans:Electricity [J](TimeStep)`
- `Pumps:Electricity [J](TimeStep)`
- `Refrigeration:Electricity [J](TimeStep)`
- `Power:Facility [W](TimeStep)` - the previous Joules columns, converted into watts; the total electricity column in watts
- `Heating:Electric Power [W](TimeStep)`
- `Cooling::Electric Power [W](TimeStep)`
- `InteriorLights::Electric Power [W](TimeStep)`
- `ExteriorLights::Electric Power [W](TimeStep)`
- `InteriorEquipment::Electric Power [W](TimeStep)`
- `Fans::Electric Power [W](TimeStep)`
- `Pumps::Electric Power [W](TimeStep)`
- `Refrigeration::Electric Power [W](TimeStep)`

## More information:

- More information regarding these Energy Plus simulation datasets from the National Renewable Energy Laboratory (NREL) https://www.nrel.gov/docs/fy15osti/63796.pdf
- Source of Energy Plus Simulation data https://openei.org/datasets/files/961/pub/COMMERCIAL_LOAD_DATA_E_PLUS_OUTPUT/

## Other:

Included in this folder is an Excel file that summarizes zone details for super market buildings.