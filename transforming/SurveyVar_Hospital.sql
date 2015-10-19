DROP TABLE IF EXISTS SurveyVar_Hospital;

CREATE TABLE SurveyVar_Hospital
AS
SELECT HospitalName, variance(HCAHPSBaseScore) as ScoreVarSurvey
FROM surveys_responses_test
GROUP BY HospitalName
ORDER BY ScoreVarSurvey desc
;
