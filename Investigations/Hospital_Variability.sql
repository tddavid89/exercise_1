SELECT measurename, variance(score) as var_score
FROM AllProcedures
GROUP BY measurename
ORDER BY var_score desc
LIMIT 10;
