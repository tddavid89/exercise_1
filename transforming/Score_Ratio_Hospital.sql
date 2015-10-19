DROP TABLE IF EXISTS Score_Ratio_Hospital;

CREATE TABLE Score_Ratio_Hospital
AS
SELECT hsh.hospitalname, hsh.overallavgscore, ssh.avgsurveyscore, (hsh.overallavgscore/ssh.avgsurveyscore) as scoresurveyratio
FROM HospitalScore_Hospital hsh, SurveyScore_Hospital ssh
WHERE hsh.hospitalname = ssh.hospitalname
AND hsh.overallavgscore is not null
AND ssh.avgsurveyscore is not null
;
