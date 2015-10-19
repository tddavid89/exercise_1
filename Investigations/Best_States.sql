SELECT state, avg(avgscore) as overallavgscore
FROM StateScore_Measure
GROUP BY state
ORDER BY overallavgscore desc
LIMIT 10;
