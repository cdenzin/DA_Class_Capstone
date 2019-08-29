BEGIN;

CREATE SCHEMA IF NOT EXISTS da_energy;

CREATE TABLE IF NOT EXISTS da_energy.primaryconsumption (
	Month_Year DATE,	
	Coal_Consumption DECIMAL,
	Natural_Gas_Consumption DECIMAL,
	Petroleum_Consumption DECIMAL,
	Total_Fossil_Fuels_Consumption DECIMAL,
	Nuclear_Electric_Power_Consumption DECIMAL,
	Hydroelectric_Power_Consumption DECIMAL,
	Geothermal_Energy_Consumption DECIMAL,
	Solar_Energy_Consumption DECIMAL,
	Wind_Energy_Consumption DECIMAL,
	Biomass_Energy_Consumption DECIMAL,
	Total_Renewable_Energy_Consumption DECIMAL,
	Total_Primary_Energy_Consumption DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.primaryproduction (
	Month_Year DATE,
	Coal_Production DECIMAL,
	Natural_Gas_Production DECIMAL,
	Crude_Oil_Production DECIMAL,
	Natural_Gas_Plant_Liquids_Production DECIMAL,
	Total_Fossil_Fuels_Production DECIMAL,
	Nuclear_Electric_Power_Production DECIMAL,
	Hydroelectric_Power_Production DECIMAL,
	Geothermal_Energy_Production DECIMAL,
	Solar_Energy_Production DECIMAL,
	Wind_Energy_Production DECIMAL,
	Biomass_Energy_Production DECIMAL,
	Total_Renewable_Energy_Production DECIMAL,
	Total_Primary_Energy_Production DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.renewables(
	Month_Year DATE,
	Biofuels_Production DECIMAL,
	Total_Biomass_Energy_Production DECIMAL,
	Total_Renewable_Energy_Production DECIMAL,
	Hydroelectric_Power_Consumption DECIMAL,
	Geothermal_Energy_Consumption DECIMAL,
	Solar_Energy_Consumption DECIMAL,
	Wind_Energy_Consumption DECIMAL,
	Wood_Energy_Consumption DECIMAL,
	Waste_Energy_Consumption DECIMAL,
	Biofuels_Consumption DECIMAL,
	Total_Biomass_Energy_Consumption DECIMAL,
	Total_Renewable_Energy_Consumption DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.solarconsumption (
	Month_Year DATE,
	Solar_Energy_Consumption_for_Heat DECIMAL,
	Solar_Energy_Consumption_Residential DECIMAL,
	Solar_Energy_Consumption_Commercial	DECIMAL,
	Solar_Energy_Consumption_Industrial	DECIMAL,
	Solar_Energy_Consumption_Total DECIMAL,
	Distributed_Solar_Energy_Consumption_Total DECIMAL,
	Utility_Scale_Solar_Energy_Consumption_Commercial DECIMAL,
	Utility_Scale_Solar_Energy_Consumption_Industrial DECIMAL,
	Utility_Scale_Solar_Energy_Consumption_Electric_Power DECIMAL,
	Utility_Scale_Solar_Energy_Consumption_Total DECIMAL,
	Total_Solar_Energy_Consumption DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.solargeneration (
	Month_Year DATE,
	Solar_Photovoltaic_Generation_Residential DECIMAL,
	Solar_Photovoltaic_Generation_Commercial DECIMAL,
	Solar_Photovoltaic_Generation_Industrial DECIMAL,
	Solar_Photovoltaic_Generation_Total DECIMAL,
	Utility_Scale_Solar_Electricity_Net_Generation_Commercial DECIMAL,
	Utility_Scale_Solar_Electricity_Net_Generation_Industrial DECIMAL,
	Utility_Scale_Solar_Electricity_Net_Generation_Electric_Power DECIMAL,
	Utility_Scale_Solar_Electricity_Net_Generation_Total DECIMAL,
	Total_Solar_Electricity_Net_Generation DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.plannedgencap (
	Year DATE,
	Energy_Source VARCHAR (50),
	Number_of_Generators_Added DECIMAL,
	Net_Summer_Capacity_Added DECIMAL,
	Number_of_Generators_Retired DECIMAL,
	Net_Summer_Capacity_Retired DECIMAL,
	Net_Number_of_Generators DECIMAL,
	Net_Summer_Capacity DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.solargenbystate (
	State VARCHAR (50),
	Year DATE,
	Generation_From_All_Sectors	DECIMAL,
	Generation_Utility_Scale DECIMAL,
	Generation_Small_Scale DECIMAL
);

CREATE TABLE IF NOT EXISTS da_energy.capacity (
	Energy_Source VARCHAR (50),
	Facility_Type VARCHAR (50),
	Number_of_Generators DECIMAL,
	Generator_Nameplate_Capacity DECIMAL,
	Net_Summer_Capacity DECIMAL,
	Net_Winter_Capacity DECIMAL,
	Total_Capacity DECIMAL
);

COPY da_energy.primaryproduction FROM 'C:/Users/cdenzin/Documents/Data_Analytics/Table_1.2_Primary_Energy_Production_by_Source.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.primaryconsumption FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Table_1.3_Primary_Energy_Consumption_by_Source.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.renewables FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Table_10.1_Renewable_Energy_Production_and_Consumption_by_Source.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.solarconsumption FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Table_10.5__Solar_Energy_Consumption.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.solargeneration FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Table_10.6__Solar_Electricity_Net_Generation.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.plannedgencap FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Planned_Generator_Capacity.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.solargenbystate FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Solar_Gen_By_State.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'Not Available';
COPY da_energy.capacity FROM 'C:\Users\cdenzin\Documents\Data_Analytics\Capacity_By_Energy_Source.txt'
WITH DELIMITER E'\t' CSV HEADER NULL AS 'null';

COMMIT;