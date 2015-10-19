DROP TABLE IF EXISTS Allprocedures;

CREATE TABLE AllProcedures
AS
SELECT ProviderID, HospitalName, Address, City, State, ZIPCode, CountyName, PhoneNumber, MeasureID, MeasureName, Score, Footnote, MeasureStartDate, MeasureEndDate
FROM effective_care_test
WHERE score between '0' and '999'

UNION ALL

SELECT ProviderID, HospitalName, Address, City, State, ZIPCode, CountyName, PhoneNumber, MeasureID, MeasureName, Score, Footnote, MeasureStartDate, MeasureEndDate
FROM readmissions_test
WHERE score between '0' and '999'
;




DROP TABLE IF EXISTS HospitalScore_Measure;

CREATE TABLE HospitalScore_Measure
AS
SELECT hospitalname,measurename,avg(score) as avgscore
FROM AllProcedures
GROUP BY hospitalname,measurename
;


DROP TABLE IF EXISTS StateScore_Measure;

CREATE TABLE StateScore_Measure
AS
SELECT state,measurename,avg(score) as avgscore
FROM AllProcedures
GROUP BY state,measurename
;



DROP TABLE IF EXISTS HospitalScore_Hospital;

CREATE TABLE HospitalScore_Hospital
AS
SELECT hospitalname,avg(avgscore) as overallavgscore
FROM hospitalscore_measure
GROUP BY hospitalname
;


DROP TABLE IF EXISTS HospitalVar_Hospital;

CREATE TABLE HospitalVar_Hospital
AS
SELECT hospitalname, variance(avgscore) as scorevar
FROM hospitalscore_measure
GROUP BY hospitalname
;



DROP TABLE IF EXISTS SurveyScore_Hosptial;

CREATE TABLE SurveyScore_Hospital
AS
SELECT HospitalName, avg(HCAHPSBaseScore) as avgSurveyScore
FROM surveys_responses_test
GROUP BY HospitalName
ORDER BY avgSurveyScore desc
;


DROP TABLE IF EXISTS SurveyVar_Hospital;

CREATE TABLE SurveyVar_Hospital
AS
SELECT HospitalName, variance(HCAHPSBaseScore) as ScoreVarSurvey
FROM surveys_responses_test
GROUP BY HospitalName
ORDER BY ScoreVarSurvey desc
;


DROP TABLE IF EXISTS Score_Ratio_Hospital;

CREATE TABLE Score_Ratio_Hospital
AS
SELECT hsh.hospitalname, hsh.overallavgscore, ssh.avgsurveyscore, (hsh.overallavgscore/ssh.avgsurveyscore) as scoresurveyratio
FROM HospitalScore_Hospital hsh, SurveyScore_Hospital ssh
WHERE hsh.hospitalname = ssh.hospitalname
AND hsh.overallavgscore is not null
AND ssh.avgsurveyscore is not null
;



DROP TABLE IF EXISTS Var_Ratio_Hospital;

CREATE TABLE Var_Ratio_Hospital
AS
SELECT hvh.hospitalname, hvh.ScoreVar, svh.ScoreVarSurvey, (hvh.ScoreVar/svh.ScoreVarSurvey) as varsurveyratio
FROM HospitalVar_Hospital hvh, SurveyVar_Hospital svh
WHERE hvh.hospitalname = svh.hospitalname
AND hvh.ScoreVar is not null
AND svh.ScoreVarSurvey is not null
;
