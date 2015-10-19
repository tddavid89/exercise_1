DROP TABLE IF EXISTS SurveyScore_Hosptial;

CREATE TABLE SurveyScore_Hospital
AS
SELECT HospitalName, avg(HCAHPSBaseScore) as avgSurveyScore
FROM surveys_responses_test
GROUP BY HospitalName
ORDER BY avgSurveyScore desc
;
