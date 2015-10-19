DROP TABLE IF EXISTS HospitalScore_Hospital;

CREATE TABLE HospitalScore_Hospital
AS
SELECT hospitalname,avg(avgscore) as overallavgscore
FROM hospitalscore_measure
GROUP BY hospitalname
;
