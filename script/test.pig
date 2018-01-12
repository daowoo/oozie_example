%default input /user/hdfs/test_data.csv
%default output /temp/hdfs/oozie_test
data = load '$input' using PigStorage(',') as (
     storage_code:chararray,
     water_sensor:chararray,
     water_alert_type:chararray,
     water_number:int,
     water_alert_time:chararray,
     tempreture_sensor:chararray,
     temp_alert_type:chararray,
     temp_number:int,
     temp_alert_time:chararray,
     pressure_sensor:chararray,
     pressure_alert_type:chararray,
     pressure_number:int,
     pressure_alert_time:chararray,
     flow_sensor:chararray,
     flow_alert_type:chararray,
     flow_number:int,
     flow_direction:chararray,
     flow_alert_time:chararray
);


add_date = foreach data generate $5 as tempreture_sensor, $6 as temp_alert_type, $7 as temp_number, $8 as temp_alert_time, SUBSTRING($8,0,10) as alert_date;

gp_by_date = GROUP add_date by alert_date;
 
avg_temp = FOREACH gp_by_date generate 
	 add_date.alert_date,
	 AVG(add_date.temp_number);

rmf $output
store avg_temp into '$output';

     