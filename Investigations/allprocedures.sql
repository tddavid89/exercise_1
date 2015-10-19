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
