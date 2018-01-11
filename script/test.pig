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

res = limit data 4;
store res into '$output';

     