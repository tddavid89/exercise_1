DROP TABLE IF EXISTS hospital_test;

CREATE EXTERNAL TABLE hospital_test(
  ProviderID String,
  HospitalName String,
  Address String,
  City String,
  State String,
  ZIPCode String,
  CountyName String,
  PhoneNumber String,
  HospitalType String,
  HospitalOwnership String,
  EmergencyServices String
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';


DROP TABLE IF EXISTS effective_care_test;

CREATE EXTERNAL TABLE effective_care_test(
ProviderID String,
HospitalName String,
Address String,
City String,
State String,
ZIPCode String,
CountyName String,
PhoneNumber String,
Condition String,
MeasureID String,
MeasureName String,
Score String,
Sample String,
Footnote String,
MeasureStartDate String,
MeasureEndDate String
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


DROP TABLE IF EXISTS readmissions_test;

CREATE EXTERNAL TABLE readmissions_test(
      ProviderID String,
      HospitalName String,
      Address String,
      City String,
      State String,
      ZIPCode String,
      CountyName String,
      PhoneNumber String,
      MeasureName String,
      MeasureID String,
      ComparedToNational String,
      Denominator String,
      Score String,
      LowerEstimate String,
      HigherEstimate String,
      Footnote String,
      MeasureStartDate String,
      MeasureEndDate String
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE IF EXISTS surveys_responses_test;

CREATE EXTERNAL TABLE surveys_responses_test(
    ProviderID String,
    HospitalName String,
    Address String,
    City String,
    State String,
    ZIPCode String,
    CountyName String,
    CommunicationWithNursesAchievementPoints String,
    CommunicationWithNursesImprovementPoints String,
    CommunicationWithNursesDimensionScore String,
    CommunicationWithDoctorsAchievementPoints String,
    CommunicationWithDoctorsImprovementPoints String,
    CommunicationWithDoctorsDimensionScore String,
    ResponsivenessOfHospitalStaffAchievementPoints String,
    ResponsivenessOfHospitalStaffImprovementPoints String,
    ResponsivenessOfHospitalStaffDimensionScore String,
    PainManagementAchievementPoints String,
    PainManagementImprovementPoints String,
    PainManagementDimensionScore String,
    CommunicationAboutMedicinesAchievementPoints String,
    CommunicationAboutMedicinesImprovementPoints String,
    CommunicationAboutMedicinesDimensionScore String,
    CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints String,
    CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints String,
    CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore String,
    DischargeInformationAchievementPoints String,
    DischargeInformationImprovementPoints String,
    DischargeInformationDimensionScore String,
    OverallRatingOfHospitalAchievementPoints String,
    OverallRatingOfHospitalImprovementPoints String,
    OverallRatingOfHospitalDimensionScore String,
    HCAHPSBaseScore String,
    HCAHPSConsistencyScore String
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar" = '"',
  "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';
