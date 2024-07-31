create database E_Vehicles;

use e_vehicles;

select * from `electric_vehicle_population_data`;


/* Total Vehiches */

select count(`DOL Vehicle ID`) as Total_Vehicles
from `electric_vehicle_population_data`;


/* Average Electric Range */

select concat(Round(avg(`Electric Range`),2), " KM") as Avg_Electric_Range
from `electric_vehicle_population_data`;


/* Total BEV Vehicles */

select count(`DOL Vehicle ID`) as Total_BEV_Vehicle, concat(round(count(`DOL Vehicle ID`)  / (select count(`DOL Vehicle ID`)
from `electric_vehicle_population_data`) * 100,2), "%" ) as "%_of_Total"
from `electric_vehicle_population_data`
where `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)';

/* Total PHEV Vehicle */

select count(`DOL Vehicle ID`) as Total_BEV_Vehicle, concat(round(count(`DOL Vehicle ID`)  / (select count(`DOL Vehicle ID`)
from `electric_vehicle_population_data`) * 100,2), "%" ) as "%_of_Total"
from `electric_vehicle_population_data`
where `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)';

/* Total Electric Vehicle Registered by Model Year */

select `Model Year`, count(`DOL Vehicle ID`) as Total_Vehicle
from `electric_vehicle_population_data`
group by  `Model Year`
order by count(`DOL Vehicle ID`) asc;

/* Total Vehicles By State */

select `State`,`City`, count(`DOL Vehicle ID`) as Total_Vehicle
from `electric_vehicle_population_data`
group by `State`,`City`
order by count(`DOL Vehicle ID`) desc;


/* Top 10 Total Vehicles by Make */

select `Make`, count(`DOL Vehicle ID`) as Total_Vehicle, concat(round(count(`DOL Vehicle ID`)  / (select count(`DOL Vehicle ID`)
from `electric_vehicle_population_data`) * 100,2), "%" ) as "%_of_Total"
from `electric_vehicle_population_data`
group by `Make`
order by count(`DOL Vehicle ID`) desc
limit 10;

/* Total Vehicles by CAFV Eligibility */

select `Clean Alternative Fuel Vehicle (CAFV) Eligibility`, count(`DOL Vehicle ID`)
as Total_Vehicle, concat(round(count(`DOL Vehicle ID`)  / (select count(`DOL Vehicle ID`)
from `electric_vehicle_population_data`) * 100,2), "%" ) as "%_of_Total"
from `electric_vehicle_population_data`
group by `Clean Alternative Fuel Vehicle (CAFV) Eligibility`
order by count(`DOL Vehicle ID`) desc;

/* Top 10 Total Vehicles by Model */

select `Model`,`Make`,`Electric Vehicle Type`, count(`DOL Vehicle ID`) as Total_Vehicle, concat(round(count(`DOL Vehicle ID`)  / (select count(`DOL Vehicle ID`)
from `electric_vehicle_population_data`) * 100,2), "%" ) as "%_of_Total"
from `electric_vehicle_population_data`
group by `Model`,`Make`,`Electric Vehicle Type`
order by count(`DOL Vehicle ID`) desc
limit 10;




