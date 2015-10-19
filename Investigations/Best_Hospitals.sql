SELECT hospitalname,avg(avgscore) as overallavgscore
FROM HospitalScore_Measure
GROUP BY hospitalname
ORDER BY overallavgscore desc
LIMIT 10;
