DROP TABLE IF EXISTS HospitalVar_Hospital;

CREATE TABLE HospitalVar_Hospital
AS
SELECT hospitalname, variance(avgscore) as scorevar
FROM hospitalscore_measure
GROUP BY hospitalname
;
