# Solar Energy Market Growth

Introduction

    In this project, I set out to look at energy data to
    determine solar energy's market growth and outlook.
    The data I used came from the US Energy Information
    Administration (EIA). You can find the data sets
    here (https://www.eia.gov).

SQL

    Here are my SQL queries:
    SELECT *
    FROM da_energy.solargenbystate
    ORDER BY generation_from_all_sectors DESC

    SELECT state, generation_from_all_sectors
    FROM da_energy.solargenbystate
    WHERE year = '2017-01-01' AND generation_from_all_sectors < 100
    ORDER BY generation_from_all_sectors DESC

    SELECT state, generation_from_all_sectors
    FROM da_energy.solargenbystate
    WHERE year = '2017-01-01' AND generation_from_all_sectors = 0
    ORDER BY generation_from_all_sectors DESC

    SELECT c.energy_source, number_of_generators, total_capacity, net_number_of_generators
    FROM da_energy.capacity c
    JOIN da_energy.plannedgencap  p
    ON c.energy_source = p.energy_source
    ORDER BY net_number_of_generators

    SELECT c.energy_source, number_of_generators, total_capacity, net_number_of_generators,
    CASE
	    WHEN net_number_of_generators <= 0 THEN 'NEGATIVE'
	    WHEN net_number_of_generators > 0 THEN 'POSITIVE'
	    ELSE 'NULL'
	    END AS net_change
    FROM da_energy.capacity c
    JOIN da_energy.plannedgencap  p
    ON c.energy_source = p.energy_source
    ORDER BY net_number_of_generators

    SELECT AVG(generation_from_all_sectors)
    FROM da_energy.solargenbystate
        
    For these queries, I looked at state level solar data to
    determine what states generated the most solar energy and also
    looked at energy generators from all energy sources to 
    determine which energy sources were losing generators and which
    have gained generators.

Tableau

    You can view my Tableu dashboards here (https://public.tableau.com/profile/collin.denzin#!/vizhome/DAClassCapstone/PrimaryEnergyMarketOverview?publish=yes).

    I included information on primary energy consumption as well
    as their compounded growth rates. I did the same for renewable
    energy sources as well and included the Top 3 energy sources by
    estimated generators added for the next 3 years. Lastly, their
    is a solar generation map on the state level.

Excel

    I created a pivot table using the solar generation by state 
    where you can filter by state and year to see the states solar
    generation.
