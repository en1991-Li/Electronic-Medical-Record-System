allergyrecord
CREATE TABLE `allergyrecords` (
	`AllergyID` INT NOT NULL,
	`PatientID` INT NOT NULL,
	`Allergen` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ReactionSymptoms` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`OccurrenceDate` DATE NULL DEFAULT NULL,
	`Severity` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`AllergyNotes` VARCHAR(150) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci'
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

appointments
CREATE TABLE ` appointments` (
	`AppointmentID` INT NOT NULL,
	`PatientID` INT NOT NULL,
	`DepartmentID` INT NOT NULL,
	`StaffID` INT NOT NULL,
	`AppointmentTime` DATE NULL DEFAULT NULL,
	`AppointmentStatus` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ChiefComplaint` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`VisitDate` DATE NULL DEFAULT NULL,
	`VisitStatus` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci'
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

departments
CREATE TABLE `departments` (
	`DepartmentID` INT NOT NULL,
	`DepartmentName` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`DepartmentDescription` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci'
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

diagnoses
CREATE TABLE `diagnoses` (
	`DiagnosisID` INT NOT NULL,
	`RecordID` INT NOT NULL,
	`StaffID` INT NOT NULL,
	`RecordType` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`DiagnosisDate` DATE NULL DEFAULT NULL,
	`Subjective` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Objective` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Assessment` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Plan` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`ICDCode` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`DiagnosisNotes` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci'
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
;

HospitalizationRecords
CREATE TABLE `HospitalizationRecords` (
	`HospitalizationID` INT(15) NOT NULL,
	`AppointmentID` INT(15) NOT NULL,
	`DepartmentID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`AdmissionDate` DATE NULL DEFAULT NULL,
	`LengthOfStay` INT(15) NULL DEFAULT NULL,
	`ExpectedDischargeDate` DATE NULL DEFAULT NULL,
	`ActualDischargeDate` DATE NULL DEFAULT NULL,
	`WardArea` VARCHAR(20) NULL DEFAULT NULL,
	`RoomNum` VARCHAR(10) NULL DEFAULT NULL,
	`BedNum` VARCHAR(20) NULL DEFAULT NULL,
	`AdmissionDiagnosis` VARCHAR(100) NULL DEFAULT NULL,
	`DischargeDiagnosis` VARCHAR(100) NULL DEFAULT NULL,
	`HospitalizationStatus` VARCHAR(20) NULL DEFAULT NULL,
	`CreateTime` DATE NULL DEFAULT NULL,
	`DischargeSummary` VARCHAR(100) NULL DEFAULT NULL,
	`HospitalizationNotes` VARCHAR(100) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

InsuranceBilling
CREATE TABLE `InsuranceBilling` (
	`BillingID` INT(15) NOT NULL,
	`PatientID` INT(15) NOT NULL,
	`AppointmentID` INT NOT NULL,
	`BillingDate` DATE NULL,
	`ItemDescription` VARCHAR(100) NULL DEFAULT NULL,
	`Amount` INT(10) NULL,
	`NHI` CHAR(1) NULL DEFAULT NULL,
	`NHIAmount` INT(10) NULL DEFAULT NULL,
	`PatientPay` INT(10) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

MedicalResourceUsage
CREATE TABLE `MedicalResourceUsage` (
	`UsageID` INT(15) NOT NULL,
	`PatientID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`DepartmentID` INT(15) NOT NULL,
	`ResourceType` VARCHAR(50) NULL DEFAULT NULL,
	`ResourceName` VARCHAR(50) NULL DEFAULT NULL,
	`UsageDate` DATE NULL,
	`UsageDuration` VARCHAR(15) NULL DEFAULT NULL,
	`UsageNotes` VARCHAR(100) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Patients
CREATE TABLE `Patients` (
	`PatientID` INT(15) NOT NULL,
	`PatientName` VARCHAR(25) NULL DEFAULT NULL,
	`PatientGender` CHAR(10) NULL DEFAULT NULL,
	`PatientBirth` DATE NULL,
	`BloodType` VARCHAR(10) NULL DEFAULT NULL,
	`PatientPhone` VARCHAR(20) NULL DEFAULT NULL,
	`PatientAddress` VARCHAR(50) NULL DEFAULT NULL,
	`PatientIdentityNumber` VARCHAR(15) NULL DEFAULT NULL,
	`EmergencyRelation` VARCHAR(10) NULL DEFAULT NULL,
	`EmergencyName` VARCHAR(10) NULL DEFAULT NULL,
	`EmergencyPhone` VARCHAR(20) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Prescriptions
CREATE TABLE `Prescriptions` (
	`PrescriptionID` INT(15) NOT NULL,
	`DiagnosisID` INT(15) NOT NULL,
	`MedicationName` VARCHAR(50) NULL DEFAULT NULL,
	`MedicationInstruction` VARCHAR(20) NULL DEFAULT NULL,
	`MedicationDays` INT NULL,
	`MedicationCode` VARCHAR(20) NULL DEFAULT NULL,
	`MedicationType` VARCHAR(20) NULL DEFAULT NULL,
	`MedicationStatus` CHAR(1) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Records
CREATE TABLE `Records` (
	`RecordID` INT(15) NOT NULL,
	`PatientID` INT(15) NOT NULL,
	`AppointmentID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`FamilyHistory` VARCHAR(50) NULL DEFAULT NULL,
	`Habits` VARCHAR(50) NULL DEFAULT NULL,
	`SurgicalHistory` VARCHAR(100) NULL DEFAULT NULL,
	`HospitalHistory` VARCHAR(100) NULL DEFAULT NULL,
	`AllergyHistory` VARCHAR(100) NULL DEFAULT NULL,
	`VaccinationRecord` VARCHAR(50) NULL DEFAULT NULL,
	`CreateDate` DATE NULL,
	`UpdatedDate` DATE NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

SatisfactionSurveys
CREATE TABLE `SatisfactionSurveys` (
	`SurveyID` INT(15) NOT NULL,
	`AppointmentID` INT(15) NOT NULL,
	`SurveyDate` DATE NULL,
	`TargetRole` VARCHAR(20) NULL DEFAULT NULL,
	`Rating` INT NULL,
	`Comments` VARCHAR(150) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Schedules
CREATE TABLE `Schedules` (
	`ScheduleID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`ScheduleDate` DATE NULL,
	`DepartmentID` INT(15) NOT NULL,
	`TimeSlot` VARCHAR(10) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Staff
CREATE TABLE `Staff` (
	`StaffID` INT(15) NOT NULL,
	`DepartmentID` INT(15) NOT NULL,
	`StaffName` VARCHAR(20) NULL DEFAULT NULL,
	`StaffGender` VARCHAR(20) NULL DEFAULT NULL,
	`StaffRole` VARCHAR(20) NULL DEFAULT NULL,
	`StaffLicneseNum` VARCHAR(30) NULL DEFAULT NULL,
	`StaffPhone` VARCHAR(20) NULL DEFAULT NULL,
	`YearsOfExperience` INT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

SurgeryRecords
CREATE TABLE `SurgeryRecords` (
	`SurgeryID` INT(15) NOT NULL,
	`AppointmentID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`SurgeryDate` DATE NULL,
	`SurgeryName` VARCHAR(50) NULL DEFAULT NULL,
	`SurgerySite` VARCHAR(20) NULL DEFAULT NULL,
	`SurgeryType` VARCHAR(20) NULL DEFAULT NULL,
	`AnesthesiaType` VARCHAR(20) NULL DEFAULT NULL,
	`DurationMinutes` INT NULL DEFAULT NULL,
	`Complications` VARCHAR(150) NULL DEFAULT NULL,
	`PostOperativeInstructions` VARCHAR(150) NULL DEFAULT NULL,
	`StaffNotes` VARCHAR(100) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

Tests
CREATE TABLE `Tests` (
	`TestID` INT(15) NOT NULL,
	`AppointmentID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`TestName` VARCHAR(50) NULL DEFAULT NULL,
	`TestCode` VARCHAR(20) NULL DEFAULT NULL,
	`TestDate` DATE NULL DEFAULT NULL,
	`TestResult` VARCHAR(100) NULL DEFAULT NULL,
	`TestStatus` VARCHAR(20) NULL DEFAULT NULL,
	`TestNotes` VARCHAR(100) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;

VaccinationRecords
CREATE TABLE `VaccinationRecords` (
	`VaccinationID` INT(15) NOT NULL,
	`PatientID` INT(15) NOT NULL,
	`StaffID` INT(15) NOT NULL,
	`VaccineName` VARCHAR(50) NULL DEFAULT NULL,
	`DoseNum` INT NULL DEFAULT NULL,
	`VaccinationDate` DATE NULL DEFAULT NULL,
	`VaccinationLocation` VARCHAR(50) NULL DEFAULT NULL,
	`HasPostVaccinationSymptoms` CHAR(1) NULL DEFAULT NULL,
	`PostVaccinationReaction` VARCHAR(150) NULL DEFAULT NULL
)
COLLATE='utf8mb4_0900_ai_ci'
;



