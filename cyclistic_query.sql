SELECT *
  INTO  dbo.annual 
FROM
(select * from feb21$
union
select * from mar21$
union
select * from apr21$
union
select * from may21$
union
select * from jun21$
union
select * from jul21$
union
select * from agu21$
union
select * from sep21$
union
select * from oct21$
union
select * from nov21$
union
select * from dec21$
union
select * from jan22$
) a

select top 10 *
from annual2;

alter table annual
alter column started_at_date date ;

select started_at_date ,
day = DATENAME(dw,started_at_date)
from bicyclist.dbo.annual ;

select *
from annual
where 
distance = 0 ;

delete from annual
where distance = 0 ;

select *
from annual ; 

select * 
from annual
where 
ride_length = 0 ;

alter table annual
drop column day_of_week ;

SELECT *
  INTO  dbo.annual2 
FROM(
select * ,
day = DATENAME(dw,started_at_date)
from bicyclist.dbo.annual)
a

select *
from annual2;

select distinct rideable_type
from bicyclist.dbo.annual2;

select COUNT(rideable_type)
from bicyclist.dbo.annual2
where rideable_type = 'classic_bike';

select COUNT(day_of_week)
from bicyclist.dbo.annual2
where day_of_week = sunday;

select count(*)
from bicyclist.dbo.annual2
where member_casual = 'member' and 
rideable_type = 'docked_bike' ;

select count(*)
from bicyclist.dbo.annual2
where member_casual = 'casual' and 
rideable_type = 'classic_bike' and
day_of_week = sunday;

select count(distinct start_station_name)
from bicyclist.dbo.annual2;

select SUM(distance) as total_distance_covered
from bicyclist.dbo.annual2;

select SUM(distance) as total_distance_covered
from bicyclist.dbo.annual2
where member_casual = 'casual';

select SUM(distance) as total_distance_covered
from bicyclist.dbo.annual2
where member_casual = 'casual' and
rideable_type = 'electric_bike';

select SUM(distance) as total_distance_covered
from bicyclist.dbo.annual2
where member_casual = 'casual' and
rideable_type = 'classic_bike' and
day_of_week = sunday;

SELECT       end_station_name,
COUNT(end_station_name) AS name
FROM     bicyclist.dbo.annual2
where member_casual = 'member'
GROUP BY end_station_name
ORDER BY name desc;


