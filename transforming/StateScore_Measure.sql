DROP TABLE IF EXISTS StateScore_Measure;

CREATE TABLE StateScore_Measure
AS
SELECT state,measurename,avg(score) as avgscore
FROM AllProcedures
GROUP BY state,measurename
;
