DROP TABLE IF EXISTS Var_Ratio_Hospital;

CREATE TABLE Var_Ratio_Hospital
AS
SELECT hvh.hospitalname, hvh.ScoreVar, svh.ScoreVarSurvey, (hvh.ScoreVar/svh.ScoreVarSurvey) as varsurveyratio
FROM HospitalVar_Hospital hvh, SurveyVar_Hospital svh
WHERE hvh.hospitalname = svh.hospitalname
AND hvh.ScoreVar is not null
AND svh.ScoreVarSurvey is not null
;
