DROP TABLE IF EXISTS HospitalScore_Measure;

CREATE TABLE HospitalScore_Measure
AS
SELECT hospitalname,measurename,avg(score) as avgscore
FROM AllProcedures
GROUP BY hospitalname,measurename
;
