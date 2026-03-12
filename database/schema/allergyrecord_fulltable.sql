-- -------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 傾印 allergyrecords 的資料庫結構
CREATE DATABASE IF NOT EXISTS `allergyrecords` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `allergyrecords`;

-- 傾印  資料表 allergyrecords.allergyrecords 結構
CREATE TABLE IF NOT EXISTS `allergyrecords` (
  `AllergyID` int NOT NULL,
  `PatientID` int NOT NULL,
  `Allergen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ReactionSymptoms` varchar(100) DEFAULT NULL,
  `OccurenceDate` date DEFAULT NULL,
  `Severity` varchar(20) DEFAULT NULL,
  `AllergyNotes` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`AllergyID`),
  KEY `AllergyRecords_Patients_FK` (`PatientID`),
  CONSTRAINT `AllergyRecords_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.allergyrecords 的資料：~17 rows (近似值)
INSERT INTO `allergyrecords` (`AllergyID`, `PatientID`, `Allergen`, `ReactionSymptoms`, `OccurenceDate`, `Severity`, `AllergyNotes`) VALUES
	(500001, 100342, '花粉', '打噴嚏、鼻塞', '2015-03-16', '輕度', '春季過敏，建議配戴口罩。'),
	(500002, 13577, '蝦類', '嘔吐、皮膚紅疹', '2019-07-13', '中度', '建議避免食用海鮮。'),
	(500003, 14620, '花生', '呼吸困難、喉嚨腫脹', '2013-05-26', '重度', '已開立腎上腺素筆。'),
	(500004, 16988, '灰塵', '鼻子癢、眼睛癢', '2020-08-19', '輕度', '建議加強居家清潔。'),
	(500005, 17241, '藥物(青黴素)', '發燒、皮膚紅疹', '2017-12-29', '重度', '已註記藥物過敏警示。'),
	(500006, 19462, '牛奶', '腹瀉、脹氣', '2012-06-17', '中度', '建議改用植物奶。'),
	(500007, 20513, '鰻重', '咳嗽、氣喘', '2013-08-25', '重度', '建議使用防蟎寢具。'),
	(500008, 22735, '藥物(止痛藥)', '頭暈、皮膚紅疹', '2016-01-02', '中度', '已註記藥物禁用。'),
	(500009, 23896, '蛋白', '嘔吐、腹痛', '2017-04-22', '中度', '建議避免攝取蛋類製品。'),
	(500010, 26018, '香水', '頭痛、皮膚刺癢', '2014-08-03', '中度', '建議避免使用香氛產品。'),
	(500011, 27179, '芒果', '嘴唇刺痛、紅腫', '2016-06-04', '輕度', '建議避免生食芒果。'),
	(500012, 29401, '蛋黃', '嘔吐、腹瀉', '2018-11-16', '中度', '建議改用蛋白替代。'),
	(500013, 30562, '花粉', '鼻塞、打噴嚏', '2019-01-23', '輕度', '建議外出配戴口罩。'),
	(500014, 34528, '藥物（阿斯匹靈）', '頭暈、皮膚紅疹', '2017-05-29', '中度', '已註記藥物禁用。'),
	(500015, 34850, '蝦類', '嘔吐、皮膚搔癢', '2012-03-18', '中度', '建議避免食用海鮮。'),
	(500016, 34911, '藥物(止痛藥)', '噁心、皮膚紅疹', '2018-02-16', '中度', '已註記藥物過敏。'),
	(500017, 13284, '花生', '呼吸困難、喉嚨腫脹', '2011-09-27', '重度', '建議隨身攜帶急救藥物。'),
	(500018, 32265, '阿司匹林', '服藥後出現皮膚紅疹與呼吸困難', '2023-08-14', '中度', '建議避免使用NSAID類藥物，已標註於病歷中');

-- 傾印  資料表 allergyrecords.appointments 結構
CREATE TABLE IF NOT EXISTS `appointments` (
  `AppointmentID` int NOT NULL,
  `PatientID` int NOT NULL,
  `DepartmentID` int NOT NULL,
  `StaffID` int NOT NULL,
  `AppointmentTime` date DEFAULT NULL,
  `AppointmentStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ChiefComplaint` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VisitDate` date DEFAULT NULL,
  `VisitStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `Appointments_Departments_FK` (`DepartmentID`),
  KEY `Appointments_Patients_FK` (`PatientID`),
  KEY `Appointments_Staff_FK` (`StaffID`),
  CONSTRAINT `Appointments_Departments_FK` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `Appointments_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `Appointments_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.appointments 的資料：~25 rows (近似值)
INSERT INTO `appointments` (`AppointmentID`, `PatientID`, `DepartmentID`, `StaffID`, `AppointmentTime`, `AppointmentStatus`, `ChiefComplaint`, `VisitDate`, `VisitStatus`) VALUES
	(1023, 10342, 23, 35102, NULL, '已預約', '胸悶胸痛', '2022-08-19', '已就診'),
	(1056, 12491, 1, 36215, NULL, '已完成', '癲癇發作', '2022-12-26', '已就診'),
	(1098, 13577, 6, 38541, NULL, '已預約', '腫瘤評估', '2025-09-21', '未到診'),
	(1132, 14620, 8, 39673, NULL, '已取消', '安排核磁共診檢查', '2022-02-19', '已改期'),
	(1175, 15834, 4, 37488, NULL, '已完成', '小兒發燒', '2023-06-28', '已就診'),
	(1209, 16988, 10, 40756, NULL, '已預約', '急性腹痛', '2023-11-11', '已就診'),
	(1244, 17241, 12, 41839, NULL, '已完成', '皮膚紅疹', '2022-07-05', '已就診'),
	(1287, 18395, 15, 42922, NULL, '已預約', '焦慮情緒', '2023-03-24', '未到診'),
	(1321, 19462, 17, 44005, NULL, '已完成', '產前檢查', '2023-09-01', '已就診'),
	(1354, 20513, 19, 45188, NULL, '已預約', '月經不規則', '2024-01-12', '已就診'),
	(1389, 21674, 27, 47554, NULL, '已完成', '關節疼痛', '2024-11-25', '已就診'),
	(1423, 22735, 29, 48737, NULL, '已取消', '胃食道逆流', '2024-07-16', '已改期'),
	(1456, 23896, 31, 49920, NULL, '已預約', '腎功能檢查', '2025-04-02', '已就診'),
	(1490, 24957, 34, 51103, NULL, '已完成', '頻尿', '2023-05-21', '已就診'),
	(1524, 26018, 36, 52286, NULL, '已預約', '呼吸困難', '2022-12-22', '未到診'),
	(1557, 27179, 38, 53469, NULL, '已完成', '關節腫脹', '2024-04-14', '已就診'),
	(1591, 28340, 40, 54652, NULL, '已預約', '疑似感染', '2024-03-12', '已就診'),
	(1624, 29401, 42, 55835, NULL, '已完成', '術後復健', '2024-01-28', '已就診'),
	(1658, 30562, 45, 57018, NULL, '已預約', '貧血檢查', '2023-06-18', '未到診'),
	(1692, 34528, 47, 58101, NULL, '已完成', '病理報告諮詢', '2025-08-04', '已就診'),
	(1725, 34689, 49, 59284, NULL, '已預約', '手術前麻醉評估', '2022-03-03', '已就診'),
	(1759, 34850, 51, 60467, NULL, '已完成', '視力模糊', '2022-03-13', '已就診'),
	(1793, 34911, 53, 61650, NULL, '已取消', '喉嚨痛', '2024-10-27', '已改期'),
	(1826, 13284, 55, 62833, NULL, '已預約', '健康檢查', '2024-10-05', '已就診'),
	(1860, 34999, 8, 39673, NULL, '已完成', '電腦斷層追蹤檢查', '2025-09-02', '已就診'),
	(1889, 32265, 23, 62898, NULL, '已預約', '心跳不規則', '2025-09-25', '已就診');

-- 傾印  資料表 allergyrecords.departments 結構
CREATE TABLE IF NOT EXISTS `departments` (
  `DepartmentID` int NOT NULL,
  `DepartmentName` varchar(20) DEFAULT NULL,
  `DepartmentDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.departments 的資料：~25 rows (近似值)
INSERT INTO `departments` (`DepartmentID`, `DepartmentName`, `DepartmentDescription`) VALUES
	(1, 'Neurology', '處理神經系統相關疾病'),
	(4, 'Pediatrics', '提供兒童健康照護與疾病治療'),
	(6, 'Oncology', '專門治療各類癌症'),
	(8, 'Radiology', '進行影像檢查如X光、MRI等'),
	(10, 'Emergency Medicine', '處理急診病患與緊急醫療狀況'),
	(12, 'Dermatology', '治療皮膚、毛髮與指甲相關問題'),
	(15, 'Psychiatry', '提供心理健康與精神疾病治療'),
	(17, 'Obstetrics', '負責孕婦照護與分娩相關醫療'),
	(19, 'Gynecology', '女性生殖系統疾病診斷與治療'),
	(23, 'Cardiology', '負責心臟疾病的診斷與治療'),
	(25, 'Orthopedics', '骨骼與關節疾病的診斷與手術治療'),
	(27, 'Urology', '處理泌尿系統與男性生殖器相關疾病'),
	(29, 'Gastroenterology', '專注於腸胃道疾病的診斷與治療'),
	(31, 'Nephrology', '腎臟疾病的診斷與長期照護'),
	(34, 'Endocrinology', '治療內分泌系統疾病如糖尿病、甲狀腺問題'),
	(36, 'Pulmonology', '處理肺部與呼吸系統疾病'),
	(38, 'Rheumatology', '治療關節炎與自體免疫疾病'),
	(40, 'Infectious Diseases', '專門處理傳染性疾病與防疫'),
	(42, 'Rehabilitation', '提供復健治療與功能恢復訓練'),
	(45, 'Hematology', '血液疾病的診斷與治療'),
	(47, 'Pathology', '進行病理檢查與疾病診斷支援'),
	(49, 'Anesthesiology', '負責麻醉與疼痛控制'),
	(51, 'Ophthalmology', '眼科疾病診斷與視力治療'),
	(53, 'Otolaryngology', '耳鼻喉相關疾病的診斷與治療'),
	(55, 'Family Medicine', '提供全人照護與家庭健康管理');

-- 傾印  資料表 allergyrecords.diagnoses 結構
CREATE TABLE IF NOT EXISTS `diagnoses` (
  `DiagnosisID` int NOT NULL,
  `RecordID` int NOT NULL,
  `StaffID` int NOT NULL,
  `RecordType` varchar(10) DEFAULT NULL,
  `DiagnosisDate` date DEFAULT NULL,
  `Subjective` varchar(50) DEFAULT NULL,
  `Objective` varchar(50) DEFAULT NULL,
  `Assessment` varchar(100) DEFAULT NULL,
  `Plan` varchar(100) DEFAULT NULL,
  `ICDCode` varchar(20) DEFAULT NULL,
  `DiagnosisNotes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DiagnosisID`),
  KEY `Diagnoses_Records_FK` (`RecordID`),
  KEY `Diagnoses_Staff_FK` (`StaffID`),
  CONSTRAINT `Diagnoses_Records_FK` FOREIGN KEY (`RecordID`) REFERENCES `records` (`RecordID`),
  CONSTRAINT `Diagnoses_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.diagnoses 的資料：~25 rows (近似值)
INSERT INTO `diagnoses` (`DiagnosisID`, `RecordID`, `StaffID`, `RecordType`, `DiagnosisDate`, `Subjective`, `Objective`, `Assessment`, `Plan`, `ICDCode`, `DiagnosisNotes`) VALUES
	(600001, 3001, 35102, '初診', '2022-08-19', '胸悶胸痛', '心音異常', '疑似冠狀動脈堵塞', '安排心導管檢查', 'I25.10', '建議住院進一步觀察'),
	(600002, 3002, 36215, '初診', '2022-12-26', '癲癇發作', 'EEG異常', '癲癇症候群', '安排顱內電極植入手術', 'G40.9', '建議神經科住院觀察'),
	(600003, 3003, 38541, '初診', '2025-09-21', '腹部腫塊', '腫瘤可觸及', '腹部腫瘤疑似惡性', '安排切片與影像檢查', 'C78.7', '建議手術切除並送病理'),
	(600004, 3004, 39673, '初診', '2022-02-19', '頭痛、視力模糊', 'MRI顯示腫瘤', '顱內腫瘤', '安排腦部切除手術', 'D33.0', '建議術前麻醉評估'),
	(600005, 3005, 37488, '初診', '2023-06-28', '發燒、咳嗽糊', '體溫38.9°C', '上呼吸道感染', '開立退燒藥與觀察', 'J06.9', '無需手術，門診追蹤'),
	(600006, 3006, 40756, '初診', '2023-11-11', '右上腹痛', '超音波顯示膽結石', '急性膽囊炎', '安排腹腔鏡膽囊切除手術', 'K81.0', '建議住院手術處理'),
	(600007, 3007, 41839, '初診', '2022-07-05', '皮膚紅疹', '紅疹分布於背部', '接觸性皮膚炎', '開立抗組織胺藥物', 'L23.9', '建議避免接觸過敏原'),
	(600008, 3008, 42922, '初診', '2022-03-24', '情緒低落', 'PHQ-9分數偏高', '輕度憂鬱症', '安排心理諮商與追蹤', 'F32.0', '建議定期心理評估'),
	(600009, 3009, 44005, '初診', '2022-09-01', '月經過多', '超音波顯示肌瘤', '子宮肌瘤', '安排子宮切除手術', 'D25.2', '建議術後定期追蹤'),
	(600010, 3010, 45188, '初診', '2024-01-12', '月經不規則', '賀爾蒙檢查異常', '荷爾蒙失調', '開立荷爾蒙調節藥物', 'E28.9', '建議三週後回診評估'),
	(600011, 3011, 47554, '初診', '2024-11-25', '肘部疼痛', '關節活動受限', '滑膜炎', '安排關節鏡清創術', 'M65.9', '建議術後物理治療'),
	(600012, 3012, 48737, '初診', '2024-07-16', '胃酸逆流', '胃鏡顯示食道炎', '胃食道逆流病', '開立制酸劑並飲食調整', 'K21.0', '建議減少刺激性食物'),
	(600013, 3013, 49920, '初診', '2025-04-02', '血尿', '腎臟腫塊影像異常', '腎臟病變疑似腫瘤', '安排腎臟穿刺活檢', 'N28.9', '建議住院進一步檢查'),
	(600014, 3014, 51103, '初診', '2023-05-21', '頻尿', '尿液檢查正常', '輕度膀胱過動症', '開立抗膀胱收縮藥物', 'N32.81', '建議觀察排尿頻率'),
	(600015, 3015, 52286, '初診', '2022-12-22', '右上腹腫塊', 'CT顯示肝腫瘤', '肝臟腫瘤', '安排肝臟部分切除手術', 'C22.0', '建議術後監測肝功能'),
	(600016, 3016, 53469, '初診', '2024-04-14', '手部疼痛', '關節腫脹', '關節滑膜炎', '安排關節鏡手術', 'M65.9', '建議術後避免使用患側'),
	(600017, 3017, 54652, '初診', '2024-03-12', '疲倦、發燒', '白血球偏低', '疑似病毒感染', '安排血液檢查與觀察', 'B34.9', '建議補充水分並休息'),
	(600018, 3018, 55835, '初診', '2024-01-28', '腿部無力', '肌力下降', '神經傳導異常', '安排復健治療', 'G62.9', '建議物理治療三週'),
	(600019, 3019, 57018, '初診', '2023-06-18', '疲倦、貧血', '血紅素偏低', '疑似骨髓疾病', '安排骨髓活檢', 'D64.9', '建議住院進一步檢查'),
	(600020, 3020, 58101, '初診', '2025-08-04', '腹部腫塊', '切片顯示良性病灶', '腹部良性腫瘤', '建議定期追蹤', 'D36.7', '無需手術，門診觀察'),
	(600021, 3021, 59284, '初診', '2022-03-03', '手術前評估', '血壓穩定', '無麻醉禁忌', '可安排手術', 'Z01.81', '麻醉風險低，可進行手術'),
	(600022, 3022, 60467, '初診', '2022-03-13', '視力模糊', '視力0.3/0.4', '疑似白內障', '安排眼科進一步檢查', 'H25.9', '建議定期視力追蹤'),
	(600023, 3023, 61650, '初診', '2024-10-27', '喉嚨痛', '咽部紅腫', '急性咽喉炎', '開立消炎藥與漱口水', 'J02.9', '建議多喝水並避免刺激性食物'),
	(600024, 3024, 62833, '初診', '2024-10-05', '健康檢查', '生理指數正常', '無明顯異常', '建議持續健康生活習慣', 'Z00.0', '無需治療，定期追蹤即可'),
	(600025, 3025, 39673, '初診', '2025-09-02', '鼻塞、打噴嚏', '鼻黏膜腫脹', '過敏性鼻炎', '開立抗組織胺藥物', 'J30.1', '建議避免接觸過敏原'),
	(600026, 3026, 62898, '初診', '2025-09-25', '心律不規則', '霍特心電圖顯示間歇性顫動', '可能為陣發性心房顫動，需進一步評估中風風險', '建議使用抗凝劑並安排導管消融手術', 'I48.0', '病患無心衰病史，CHA₂DS₂-VASc評分為2，建議開始Apixaban');

-- 傾印  資料表 allergyrecords.hospitalizationrecords 結構
CREATE TABLE IF NOT EXISTS `hospitalizationrecords` (
  `HospitalizationID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `DepartmentID` int NOT NULL,
  `StaffID` int NOT NULL,
  `AdmissionDate` date DEFAULT NULL,
  `LengthOfStay` int DEFAULT NULL,
  `ExpectedDischargeDate` date DEFAULT NULL,
  `ActualDischargeDate` date DEFAULT NULL,
  `WardArea` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RoomNum` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `BedNum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AdmissionDiagnosis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DischargeDiagnosis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HospitalizationStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreateTime` date DEFAULT NULL,
  `DischargeSummary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HospitalizationNotes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`HospitalizationID`) USING BTREE,
  KEY `HospitalRecord_Appointments_FK` (`AppointmentID`),
  KEY `HospitalRecord_Departments_FK` (`DepartmentID`),
  KEY `HospitalRecord_Staff_FK` (`StaffID`),
  CONSTRAINT `HospitalRecord_Appointments_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`),
  CONSTRAINT `HospitalRecord_Departments_FK` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `HospitalRecord_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.hospitalizationrecords 的資料：~15 rows (近似值)
INSERT INTO `hospitalizationrecords` (`HospitalizationID`, `AppointmentID`, `DepartmentID`, `StaffID`, `AdmissionDate`, `LengthOfStay`, `ExpectedDischargeDate`, `ActualDischargeDate`, `WardArea`, `RoomNum`, `BedNum`, `AdmissionDiagnosis`, `DischargeDiagnosis`, `HospitalizationStatus`, `CreateTime`, `DischargeSummary`, `HospitalizationNotes`) VALUES
	(100501, 1056, 1, 36215, '2025-09-03', 6, '2025-09-09', '2025-09-09', 'A07', 'B05', 'C18', '癲癇發作', '症狀穩定，持續服藥', '已出院', '2025-09-02', '建議神經科門診追蹤', '注意作息與藥物依從性'),
	(100502, 1098, 6, 38541, '2025-09-05', 5, '2025-09-10', '2025-09-10', 'A12', 'B19', 'C33', '腫瘤評估', '無惡性病變，門診追蹤', '已出院', '2025-09-04', '建議定期影像檢查', '注意身體變化'),
	(100503, 1175, 10, 40753, '2025-09-07', 4, '2025-09-11', '2025-09-11', 'A19', 'B08', 'C27', '小兒發燒', '病毒感染緩解', '已出院', '2025-09-06', '建議居家照護', '注意體溫與水分補充'),
	(100504, 1209, 15, 41905, '2025-09-09', 6, '2025-09-15', '2025-09-15', 'A02', 'B11', 'C14', '急性腹痛', '急性腸胃炎痊癒', '已出院', '2025-09-08', '飲食需注意', '建議清淡飲食與休息'),
	(100505, 1244, 17, 43056, '2025-09-11', 5, '2025-09-16', '2025-09-16', 'A09', 'B16', 'C21', '皮膚紅疹', '輕度過敏反應改善', '已出院', '2025-09-10', '無需住院追蹤', '建議避免接觸過敏源'),
	(100506, 1287, 19, 44208, '2025-09-13', 7, '2025-09-20', '2025-09-20', 'A14', 'B03', 'C29', '焦慮情緒', '情緒穩定，持續追蹤', '已出院', '2025-09-12', '建議心理諮詢', '注意壓力管理與睡眠品質'),
	(100507, 1321, 21, 45360, '2025-09-15', 3, '2025-09-15', '2025-09-18', 'A06', 'B22', 'C06', '產前檢查', '檢查正常，無併發症', '已出院', '2025-09-14', '建議定期產檢', '注意營養與胎動觀察'),
	(100508, 1354, 24, 46512, '2025-09-17', 5, '2025-09-22', '2025-09-22', 'A17', 'B09', 'C10', '月經不規則', '荷爾蒙調整後穩定', '已出院', '2025-09-16', '建議婦科門診追蹤', '注意作息與壓力'),
	(100509, 1389, 29, 47663, '2025-09-19', 6, '2025-09-25', '2025-09-25', 'A01', 'B14', 'C25', '關節疼痛', '關節炎控制穩定', '已出院', '2025-09-18', '建議復健治療', '注意關節活動與保暖'),
	(100510, 1423, 31, 48703, '2025-09-21', 4, '2025-09-25', '2025-09-25', 'A11', 'B06', 'C30', '胃食道逆流', '症狀改善，持續服藥', '已出院', '2025-09-20', '飲食需調整', '建議避免刺激性食物'),
	(100511, 1456, 33, 49854, '2025-09-23', 5, '2025-09-28', '2025-09-28', 'A08', 'B17', 'C04', '腎功能檢查', '腎功能穩定，門診追蹤', '已出院', '2025-09-22', '建議定期抽血檢查', '注意水分攝取與藥物使用'),
	(100512, 1490, 36, 52205, '2025-09-25', 3, '2025-09-28', '2025-09-28', 'A13', 'B20', 'C12', '頻尿', '泌尿道感染痊癒', '已出院', '2025-09-24', '無需住院追蹤', '建議多喝水與注意衛生'),
	(100513, 1524, 38, 53357, '2025-09-27', 6, '2025-10-03', '2025-10-03', 'A04', 'B01', 'C16', '呼吸困難', '輕度氣喘控制良好', '已出院', '2025-09-26', '建議使用吸入劑', '注意過敏源與空氣品質'),
	(100514, 1591, 40, 54509, '2025-09-29', 5, '2025-10-04', '2025-10-04', 'A16', 'B13', 'C08', '疑似感染', '細菌感染已控制', '已出院', '2025-09-28', '建議門診追蹤', '注意體溫與服藥紀律'),
	(100515, 1692, 43, 55660, '2025-10-01', 4, '2025-10-05', '2025-10-05', 'A10', 'B07', 'C20', '病理報告諮詢', '結果已說明，無需住院', '已出院', '2025-09-30', '建議門診報告解釋', '注意後續檢查安排'),
	(100516, 1889, 23, 62898, '2025-09-27', 3, '2025-09-30', '2025-09-30', '心臟科病房', '302A', 'B-03', '間歇性心房顫動，合併心悸與暈眩', '心房顫動穩定，建議門診追蹤', '已出院', '2025-09-27', '住院期間接受導管消融術，恢復良好', '術後心律穩定無併發症，建議服用抗凝劑');

-- 傾印  資料表 allergyrecords.insurancebilling 結構
CREATE TABLE IF NOT EXISTS `insurancebilling` (
  `BillingID` int NOT NULL,
  `PatientID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `BillingDate` date DEFAULT NULL,
  `ItemDescription` varchar(100) DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `NHI` char(1) DEFAULT NULL,
  `NHIAmount` int DEFAULT NULL,
  `PatientPay` int DEFAULT NULL,
  PRIMARY KEY (`BillingID`),
  KEY `InsuranceBilling_Patients_FK` (`PatientID`),
  KEY `InsureBill_Appointments_FK` (`AppointmentID`),
  CONSTRAINT `InsuranceBilling_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `InsureBill_Appointments_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.insurancebilling 的資料：~26 rows (近似值)
INSERT INTO `insurancebilling` (`BillingID`, `PatientID`, `AppointmentID`, `BillingDate`, `ItemDescription`, `Amount`, `NHI`, `NHIAmount`, `PatientPay`) VALUES
	(350123, 10342, 1023, '2025-09-01', '診察費', 500, '是', 400, 100),
	(350145, 12491, 1056, '2025-09-02', '抽血費', 300, '是', 250, 50),
	(350167, 13577, 1098, '2025-09-02', 'X光檢查費', 800, '是', 600, 200),
	(350189, 14620, 1132, '2025-09-04', '超音波檢查費', 1000, '否', 0, 1000),
	(350201, 16988, 1209, '2025-09-06', '注射費', 200, '是', 150, 50),
	(350423, 17481, 1244, '2025-09-06', '血糖檢測費', 350, '是', 300, 50),
	(350445, 18231, 1285, '2025-09-08', '心電圖檢查費', 600, '是', 500, 100),
	(350467, 19345, 1321, '2025-09-08', '藥品費', 1200, '否', 0, 1200),
	(350489, 20456, 1345, '2025-09-09', '病理檢查費', 950, '是', 700, 250),
	(350511, 21567, 1389, '2025-09-10', '疫苗接種費', 800, '是', 600, 200),
	(350533, 22678, 1423, '2025-09-11', '診察費', 500, '是', 400, 100),
	(350555, 23735, 1435, '2025-09-12', '抽血費', 300, '是', 250, 50),
	(350577, 24890, 1466, '2025-09-19', '超音波檢查費', 1000, '否', 0, 1000),
	(350579, 32265, 1889, '2025-09-30', '心房顫動導管消融手術與住院3日', 48000, '是', 36000, 12000),
	(350599, 26018, 1524, '2025-09-28', 'X光檢查費', 800, '是', 600, 200),
	(350611, 27145, 1589, '2025-09-15', '注射費', 200, '是', 150, 50),
	(350823, 35038, 1723, '2025-09-20', '皮膚病理切片檢查', 1500, '是', 1200, 300),
	(350844, 36165, 1756, '2025-09-21', '腹部電腦斷層掃描', 2800, '否', 0, 2800),
	(350865, 37293, 1789, '2025-09-23', '呼吸功能測試', 950, '是', 700, 250),
	(350886, 38420, 1823, '2025-09-25', '眼底攝影檢查', 650, '是', 500, 150),
	(350907, 39547, 1856, '2025-09-25', '腎功能血液檢查', 420, '是', 350, 70),
	(350928, 40675, 1889, '2025-09-27', '心臟超音波檢查', 1800, '否', 0, 1800),
	(350949, 41802, 1923, '2025-09-29', '骨密度檢查', 750, '是', 600, 150),
	(350970, 42930, 1956, '2025-09-29', '腸胃鏡前麻醉費', 900, '是', 700, 200),
	(350991, 44057, 1989, '2025-10-02', '傷口換藥處置費', 300, '是', 250, 50),
	(351012, 45185, 2023, '2025-10-08', '疼痛管理諮詢費', 600, '否', 0, 600);

-- 傾印  資料表 allergyrecords.medicalresourceusage 結構
CREATE TABLE IF NOT EXISTS `medicalresourceusage` (
  `UsageID` int NOT NULL,
  `PatientID` int NOT NULL,
  `StaffID` int NOT NULL,
  `DepartmentID` int NOT NULL,
  `ResourceType` varchar(50) DEFAULT NULL,
  `ResourceName` varchar(50) DEFAULT NULL,
  `UsageDate` date DEFAULT NULL,
  `UsageDuration` varchar(15) DEFAULT NULL,
  `UsageNotes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UsageID`),
  KEY `MRU_Departments_FK` (`DepartmentID`),
  KEY `MRU_Patients_FK` (`PatientID`),
  KEY `MRU_Staff_FK` (`StaffID`),
  CONSTRAINT `MRU_Departments_FK` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `MRU_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `MRU_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.medicalresourceusage 的資料：~26 rows (近似值)
INSERT INTO `medicalresourceusage` (`UsageID`, `PatientID`, `StaffID`, `DepartmentID`, `ResourceType`, `ResourceName`, `UsageDate`, `UsageDuration`, `UsageNotes`) VALUES
	(450001, 10342, 35102, 23, '醫療設備', '心電圖機', '2022-08-19', '30分鐘', '監測心律變化'),
	(450002, 12491, 36215, 1, '藥品', '抗癲癇藥物', '2022-12-26', '60分鐘', '服藥後觀察副作用'),
	(450003, 13577, 38541, 6, '檢查儀器', '腫瘤標記分析儀', '2025-09-21', '45分鐘', '評估腫瘤活性'),
	(450004, 14620, 39673, 8, '影像設備', '核磁共振掃描儀', '2022-02-19', '60分鐘', '腦部結構掃描'),
	(450005, 15834, 37488, 4, '醫療耗材', '小兒退燒貼片', '2023-06-28', '20分鐘', '降溫處理'),
	(450006, 16988, 40756, 10, '檢查儀器', '腹部超音波機', '2023-11-11', '30分鐘', '檢查腹部疼痛原因'),
	(450007, 17241, 41839, 12, '藥品', '抗組織胺藥物', '2022-07-05', '60分鐘', '紓解皮膚過敏反應'),
	(450008, 18395, 42922, 15, '心理評估工具', '焦慮量表', '2023-03-24', '25分鐘', '初步心理狀態評估'),
	(450009, 19462, 44005, 17, '影像設備', '產前超音波機', '2023-09-01', '40分鐘', '胎兒健康檢查'),
	(450010, 20513, 45188, 19, '檢查儀器', '荷爾蒙分析儀', '2024-01-12', '35分鐘', '評估內分泌功能'),
	(450011, 21674, 47554, 27, '影像設備', '關節X光機', '2024-11-25', '30分鐘', '評估關節疼痛'),
	(450012, 22735, 48737, 29, '內視鏡設備', '胃鏡', '2024-07-16', '60分鐘', '檢查胃食道逆流'),
	(450013, 23896, 49920, 31, '檢查儀器', '腎功能分析儀', '2025-04-02', '30分鐘', '評估腎臟功能'),
	(450014, 24957, 51103, 34, '影像設備', '泌尿道超音波機', '2023-05-21', '45分鐘', '檢查頻尿原因'),
	(450015, 26018, 52286, 36, '影像設備', '胸部X光機', '2022-12-12', '30分鐘', '評估呼吸困難'),
	(450016, 27179, 53469, 38, '檢查儀器', '關節超音波機', '2024-04-14', '35分鐘', '檢查關節腫脹'),
	(450017, 28340, 54652, 40, '檢查儀器', '白血球分類儀', '2024-03-12', '25分鐘', '疑似感染檢查'),
	(450018, 29401, 55835, 42, '復健器材', '肌力訓練機', '2024-01-28', '60分鐘', '術後復健使用'),
	(450019, 30562, 57018, 45, '檢查儀器', '血紅素分析儀', '2023-06-18', '30分鐘', '評估貧血狀況'),
	(450020, 34528, 58101, 47, '醫療耗材', '病理報告紙本', '2025-08-04', '15分鐘', '醫師解釋報告內容'),
	(450021, 34689, 59284, 49, '麻醉設備', '麻醉前評估儀', '2022-03-03', '40分鐘', '手術前風險評估'),
	(450022, 34850, 60467, 51, '檢查儀器', '視力測試儀', '2022-03-13', '20分鐘', '評估視力模糊原因'),
	(450023, 34911, 61650, 53, '檢查儀器', '喉嚨視診鏡', '2024-10-27', '15分鐘', '檢查喉嚨紅腫'),
	(450024, 13284, 62833, 55, '醫療設備', '健康檢查儀', '2024-10-05', '60分鐘', '全身健康評估'),
	(450025, 34999, 39673, 8, '影像設備', '電腦斷層掃描儀', '2025-09-02', '60分鐘', '追蹤病灶變化'),
	(450026, 32265, 62898, 23, '手術空間、藥品', '心臟導管室、Apixaban', '2025-09-27', '150分鐘', '用於心房顫動導管消融術，術後順利');

-- 傾印  資料表 allergyrecords.patients 結構
CREATE TABLE IF NOT EXISTS `patients` (
  `PatientID` int NOT NULL,
  `PatientName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PatientGender` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PatientBirth` date DEFAULT NULL,
  `BloodType` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PatientPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PatientAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PatientIdentityNumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmergencyRelation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmergencyName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmergencyPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PatientID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.patients 的資料：~26 rows (近似值)
INSERT INTO `patients` (`PatientID`, `PatientName`, `PatientGender`, `PatientBirth`, `BloodType`, `PatientPhone`, `PatientAddress`, `PatientIdentityNumber`, `EmergencyRelation`, `EmergencyName`, `EmergencyPhone`) VALUES
	(10342, 'Smith Ethan', 'M', '2004-07-15', 'B', '0918765432', 'Tainan City', 'A123456', '0934567890', 'Father', 'Smith David'),
	(12491, 'Johnson Ava', 'F', '2003-11-02', 'O', '0911122334', 'Hualien City', 'C345678', '0945678901', 'Sister', 'Johnson Grace'),
	(13284, 'Morgan Olivia', 'F', '2004-06-23', 'B', '0918234567', 'Taichung City', 'M456789', '0923456789', 'Mother', 'Morgan Lily'),
	(13577, 'Lee Noah', 'M', '2002-09-30', 'AB', '0919988776', 'Taichung City', 'D456789', '0956789012', 'Father', 'Lee Daniel'),
	(14620, 'Brown Mia', 'F', '2001-12-25', 'O', '0912233445', 'Kaohsiung City', 'E567890', '0967890123', 'Mother', 'Brown Lily'),
	(15834, 'Davis Liam', 'M', '2005-06-18', 'A', '0913344556', 'Yilan City', 'F678901', '0978901234', 'Father', 'Davis Henry'),
	(16988, 'Wilson Isabella', 'F', '2004-03-09', 'B', '0914455667', 'Taipei City', 'G789012', '0989012345', 'Sister', 'Wilson Emily'),
	(17241, 'Martinez James', 'M', '2003-08-21', 'AB', '0915566778', 'Chiayi City', 'H890123', '0990123456', 'Brother', 'Martinez Lucas'),
	(18395, 'Anderson Charlotte', 'F', '2002-05-30', 'O', '0916677889', 'Nantou City', 'I901234', '0911234567', 'Mother', 'Anderson Amelia'),
	(19462, 'Thomas Benjamin', 'M', '2001-10-10', 'O', '0917788990', 'Miaoli City', 'J012345', '0922345678', 'Father', 'Thomas William	'),
	(20513, 'Jackson Harper', 'F', '2005-01-01', 'O', '0918899001', 'Tainan City', 'K123456', '0933456789', 'Sister', 'Jackson Ella'),
	(21674, 'White Alexander', 'M', '2005-02-14', 'O', '0919900112', 'Tainan City', 'L234567', '0944567890', 'Brother', 'White Samuel'),
	(22735, 'Harris Evelyn', 'F', '2003-03-22', 'AB', '0911011223', 'Hualien City', 'M345678', '0955678901', 'Mother', 'Harris Victoria'),
	(23896, 'Clark Logan', 'M', '2002-04-30', 'A', '0912122334', 'Taichung City', 'N456789', '0966789012', 'Father', 'Clark Joseph'),
	(24957, 'Lewis Abigail', 'F', '2001-06-08', 'B', '0913233445', 'Kaohsiung City', 'O567890', '0977890123', 'Sister', 'Lewis Natalie'),
	(25525, 'Taylor Emma', 'F', '2005-04-02', 'O', '0970660917', 'New Taipei City', 'F230259', '0925081592', 'Mother', 'Taylor Olivia'),
	(26018, 'Robinson Jacob', 'M', '2005-07-06', 'B', '0914344556', 'Yilan City', 'P678901', '0988901234', 'Father', 'Robinson Ryan'),
	(27179, 'Walker Sofia', 'F', '2004-08-26', 'O', '0915455667', 'Taipei City', 'Q789012', '0999012345', 'Mother', 'Walker Hannah'),
	(28340, 'Young Daniel', 'M', '2003-09-16', 'A', '0916566778', 'Chiayi City', 'R890123', '0910123456', 'Father', 'Young Matthew'),
	(29401, 'Allen Scarlett', 'F', '2002-11-12', 'AB', '0917677889', 'Miaoli City', 'S901234', '0921234567', 'Sister', 'Allen Zoe'),
	(30562, 'King William', 'M', '1999-12-22', 'O', '0918788990', 'Nantou City', 'T012345', '0954567890', 'Father', 'Scott George'),
	(32265, '林雅婷', 'F', '2007-07-13', 'AB', '989330915', '新北市新莊區', 'F189564', '母女', '張淑娟', '918555111'),
	(34528, 'Nelson Jack', 'M', '2005-05-17', 'A', '0914344556', 'Yilan City', 'Z678901', '0998901234', 'Father', 'Nelson Charles'),
	(34689, 'Hill Zoey', 'F', '2008-05-28', 'A', '0915455667', 'New Taipei City', 'A789012', '0919012345', 'Father', 'Hill Hack'),
	(34850, 'Ramirez Luke', 'M', '2003-07-19', 'AB', '0916566778', 'New Taipei City', 'B890123', '0920123456', 'Mother', 'Ramirez Sarah'),
	(34911, 'Mitchell Isaac', 'M', '2001-09-20', 'o', '0918788990', 'Nantou City', 'D012345', '0942345678', 'Father', 'Mitchell Tom'),
	(34999, 'Campbell Aria', 'F', '2002-08-31', 'o', '0917677889', 'Miaoli City', 'C901234', '0931234567', 'Mother', 'Campbell Hazel');

-- 傾印  資料表 allergyrecords.prescriptions 結構
CREATE TABLE IF NOT EXISTS `prescriptions` (
  `PrescriptionID` int NOT NULL,
  `DiagnosisID` int NOT NULL,
  `MedicationName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MedicationInstruction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MedicationDays` int DEFAULT NULL,
  `MedicationCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MedicationType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MedicationStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`) USING BTREE,
  KEY `Prescriptions_Diagnoses_FK` (`DiagnosisID`),
  CONSTRAINT `Prescriptions_Diagnoses_FK` FOREIGN KEY (`DiagnosisID`) REFERENCES `diagnoses` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.prescriptions 的資料：~25 rows (近似值)
INSERT INTO `prescriptions` (`PrescriptionID`, `DiagnosisID`, `MedicationName`, `MedicationInstruction`, `MedicationDays`, `MedicationCode`, `MedicationType`, `MedicationStatus`) VALUES
	(650001, 600001, '硝酸甘油錠', '每日三次，胸痛時服用', 7, 'M001', '口服藥', '已領藥'),
	(650002, 600002, '抗癲癇藥物', '每日一次，睡前服用', 14, 'N002', '口服藥', '已領藥'),
	(650003, 600003, '止痛藥', '每日兩次，飯後服用', 5, 'A003', '口服藥', '已領藥'),
	(650004, 600004, '顱壓調節劑', '每日一次，早上服用', 10, 'N004', '口服藥', '已領藥'),
	(650005, 600005, '退燒藥', '每六小時一次，體溫超過38°C服用', 3, 'P005', '口服藥', '已領藥'),
	(650006, 600006, '抗生素', '每日兩次，飯後服用', 7, 'K006', '口服藥', '已領藥'),
	(650007, 600007, '抗組織胺藥物', '每日一次，睡前服用', 5, 'D007', '口服藥', '已領藥'),
	(650008, 600008, '抗憂鬱藥物', '每日一次，早上服用', 14, 'F008', '口服藥', '未領藥'),
	(650009, 600009, '止血藥', '每日三次，飯後服用', 7, 'G009', '口服藥', '已領藥'),
	(650010, 600010, '荷爾蒙調節劑', '每日一次，固定時間服用', 21, 'E010', '口服藥', '已領藥'),
	(650011, 600011, '消炎止痛藥', '每日兩次，飯後服用', 5, 'M011', '口服藥', '已領藥'),
	(650012, 600012, '制酸劑', '每日三次，飯前服用', 7, 'G012', '口服藥', '已領藥'),
	(650013, 600013, '利尿劑', '每日一次，早上服用', 5, 'N013', '口服藥', '已領藥'),
	(650014, 600014, '抗膀胱收縮藥物', '每日兩次，飯後服用', 7, 'U014', '口服藥', '已領藥'),
	(650015, 600015, '肝功能保護劑', '每日一次，飯後服用', 10, 'L015', '口服藥', '未領藥'),
	(650016, 600016, '止痛藥', '每日兩次，術後使用', 5, 'M0156', '注射劑', '已領藥'),
	(650017, 600017, '維他命C補充劑', '每日一次，飯後服用', 7, 'V017', '口服藥', '未領藥'),
	(650018, 600018, '神經修復劑', '每日一次，睡前服用', 14, 'N018', '口服藥', '已領藥'),
	(650019, 600019, '鐵劑', '每日一次，飯後服用', 10, 'N019', '口服藥', '已領藥'),
	(650020, 600020, '無需藥物', '無需服藥', 0, 'Z020', '無', '無'),
	(650021, 600021, '無需藥物', '僅麻醉評估，無需服藥', 0, 'Z021', '無', '無'),
	(650022, 600022, '眼科維他命', '每日一次，飯後服用', 7, 'E022', '口服藥', '已領藥'),
	(650023, 600023, '抗生素漱口水', '每日三次，飯後漱口', 5, 'J023', '外用藥', '已領藥'),
	(650024, 600024, '無需藥物', '健康檢查，無需服藥', 0, 'Z024', '無', '無'),
	(650025, 600025, '抗組織胺藥物', '每日一次，睡前服用', 5, 'A025', '口服藥', '已領藥'),
	(650026, 600026, 'Apixaban', '每日早晚各服一次，飯後服用', 30, 'R046', '口服藥', '有效');

-- 傾印  資料表 allergyrecords.records 結構
CREATE TABLE IF NOT EXISTS `records` (
  `RecordID` int NOT NULL,
  `PatientID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `StaffID` int NOT NULL,
  `FamilyHistory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Habits` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SurgicalHistory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HospitalHistory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AllergyHistory` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VaccinationRecord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `UpdatedDate` date DEFAULT NULL,
  PRIMARY KEY (`RecordID`) USING BTREE,
  KEY `Records_Appointments_FK` (`AppointmentID`),
  KEY `Records_Patients_FK` (`PatientID`),
  KEY `Records_Staff_FK` (`StaffID`),
  CONSTRAINT `Records_Appointments_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`),
  CONSTRAINT `Records_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `Records_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.records 的資料：~25 rows (近似值)
INSERT INTO `records` (`RecordID`, `PatientID`, `AppointmentID`, `StaffID`, `FamilyHistory`, `Habits`, `SurgicalHistory`, `HospitalHistory`, `AllergyHistory`, `VaccinationRecord`, `CreateDate`, `UpdatedDate`) VALUES
	(3001, 35102, 10342, 1023, '高血壓家族史', '吸菸', '心導管置放術', '曾住院治療胸痛', '花粉過敏', 'COVID-19疫苗', '2022-08-19', NULL),
	(3002, 36215, 12491, 1056, '癲癇家族史', '熬夜', '顱內電極植入手術', '無住院紀錄', '無', '流感疫苗', '2022-12-26', NULL),
	(3003, 38541, 13577, 1098, '無', '偏食', '腫瘤切除手術', '曾因腫瘤住院', '蝦類過敏', 'B型肝炎疫苗', '2025-09-21', NULL),
	(3004, 39673, 14620, 1132, '無', '熬夜', '腦部腫瘤切除手術', '曾住院神經科', '花生過敏', 'COVID-19疫苗', '2022-02-19', NULL),
	(3005, 37488, 15834, 1175, '無', '無', '無', '小兒科急診觀察', '無', '五合一疫苗', '2023-06-28', NULL),
	(3006, 40756, 16988, 1209, '高血脂家族史', '高油飲食', '膽囊切除手術', '曾住院外科', '牛奶過敏', 'B型肝炎疫苗', '2023-11-11', NULL),
	(3007, 41839, 17241, 1244, '過敏體質家族史', '熬夜', '無', '皮膚科門診', '藥物過敏（青黴素）', 'COVID-19疫苗', '2022-07-05', NULL),
	(3008, 42922, 18395, 1287, '無', '無', '無', '心理諮詢門診', '無', 'HPV疫苗', '2023-03-24', NULL),
	(3009, 44005, 19462, 1321, '子宮肌瘤家族史', '無', '子宮鏡肌瘤切除手術', '婦科住院', '蛋白過敏', 'B型肝炎疫苗', '2023-09-01', NULL),
	(3010, 45188, 20513, 1354, '無', '熬夜', '無', '內分泌科門診', '荷爾蒙藥物過敏', '流感疫苗', '2024-01-12', NULL),
	(3011, 47554, 21674, 1389, '關節炎家族史', '久坐', '關節鏡手術', '骨科住院', '無', 'COVID-19疫苗', '2024-11-25', NULL),
	(3012, 48737, 22735, 1423, '胃食道逆流家族史', '高油飲食', '胃鏡下修復手術', '消化科門診', '無', 'B型肝炎疫苗', '2024-07-16', NULL),
	(3013, 49920, 23896, 1456, '腎臟病家族史', '無', '腎臟活檢術', '泌尿科住院', '無', 'COVID-19疫苗', '2025-04-02', NULL),
	(3014, 51103, 24957, 149, '無', '熬夜', '無', '泌尿科門診', '藥物過敏（阿斯匹靈）', '流感疫苗', '2023-05-21', NULL),
	(3015, 52286, 26018, 1524, '肝病家族史', '飲酒', '肝臟腫瘤切除手術', '外科住院', '香水過敏', 'B型肝炎疫苗', '2022-12-22', NULL),
	(3016, 53469, 27179, 1557, '無', '無', '關節鏡手術', '骨科門診', '芒果過敏', 'COVID-19疫苗', '2024-04-14', NULL),
	(3017, 54652, 28340, 1591, '無', '無', '無', '感染科門診', '藥物過敏（止痛藥）', '流感疫苗', '2024-03-12', NULL),
	(3018, 55835, 29401, 1624, '無', '無', '無', '復健科門診', '蛋黃過敏', 'B型肝炎疫苗', '2024-01-28', NULL),
	(3019, 57018, 30562, 1658, '血液疾病家族史', '無', '骨髓活檢手術', '血液腫瘤科住院', '無', 'COVID-19疫苗', '2023-06-18', NULL),
	(3020, 58101, 34528, 1692, '無', '無', '病理切片手術', '外科門診', '花粉過敏', 'B型肝炎疫苗', '2025-08-04', NULL),
	(3021, 59284, 34689, 1725, '無', '無', '麻醉前評估處置', '麻醉科門診', '無', 'COVID-19疫苗', '2022-03-03', NULL),
	(3022, 60467, 34850, 1759, '無', '無', '麻醉前評估處置', '眼科門診', '無', '流感疫苗', '2022-03-13', NULL),
	(3023, 61650, 34911, 1793, '無', '熬夜', '無', '耳鼻喉科門診', '藥物過敏（止痛藥）', 'B型肝炎疫苗', '2024-10-27', NULL),
	(3024, 62833, 13284, 1826, '無', '無', '無', '健康檢查門診', '花生過敏', 'COVID-19疫苗', '2024-10-05', NULL),
	(3025, 39673, 34999, 1859, '高血壓家族史', '久坐', '無', '內科門診', '灰塵過敏', 'B型肝炎疫苗', '2024-10-05', NULL),
	(3026, 32265, 1889, 62898, '心臟病家族史', '無', '無', '無', '阿司匹林', 'COVID-19疫苗', '2025-09-25', NULL);

-- 傾印  資料表 allergyrecords.satisfactionsurveys 結構
CREATE TABLE IF NOT EXISTS `satisfactionsurveys` (
  `SurveyID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `SurveyDate` date DEFAULT NULL,
  `TargetRole` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Comments` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`SurveyID`) USING BTREE,
  KEY `SatisfySurvey_Appointments_FK` (`AppointmentID`),
  CONSTRAINT `SatisfySurvey_Appointments_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.satisfactionsurveys 的資料：~25 rows (近似值)
INSERT INTO `satisfactionsurveys` (`SurveyID`, `AppointmentID`, `SurveyDate`, `TargetRole`, `Rating`, `Comments`) VALUES
	(300123, 1056, '2025-09-10', '醫師', 9, '醫師解說詳細，態度親切。'),
	(300145, 1098, '2025-09-11', '護理師', 8, '抽血時很溫柔，感覺安心。'),
	(300167, 1175, '2025-09-10', '櫃台人員', 7, '接待速度稍慢，但態度不錯。'),
	(300189, 1209, '2025-09-13', '醫師', 10, '醫師非常專業，診斷準確。'),
	(300201, 1244, '2025-09-13', '護理師', 7, '注射時有點痛，希望改善技術。'),
	(300222, 1287, '2025-09-16', '櫃台人員', 7, '協助掛號流程順利。'),
	(300243, 1321, '2025-09-15', '藥師', 9, '解說用藥方式清楚，態度親切。'),
	(300264, 1354, '2025-09-17', '醫師', 9, '回答問題很有耐心。'),
	(300285, 1389, '2025-09-18', '護理師', 10, '換藥時很細心。'),
	(300306, 1423, '2025-09-18', '藥師', 8, '領藥流程順暢。'),
	(300327, 1456, '2025-09-20', '櫃台人員', 6, '排隊時間稍長。'),
	(300348, 1490, '2025-09-21', '醫師', 9, '醫師診斷迅速，令人安心。'),
	(300369, 1524, '2025-09-22', '護理師', 7, '照護細心，但語速稍快。'),
	(300390, 1591, '2025-09-23', '藥師', 8, '提醒副作用很貼心。'),
	(300411, 1692, '2025-09-23', '櫃台人員', 9, '協助報到流程順利。'),
	(300432, 1723, '2025-09-25', '醫師', 10, '醫師態度溫和，診斷準確。'),
	(300453, 1756, '2025-09-26', '護理師', 8, '換藥時解說清楚。'),
	(300474, 1789, '2025-09-27', '藥師', 7, '用藥說明簡潔明瞭。'),
	(300495, 1823, '2025-09-27', '櫃台人員', 5, '接待人員態度普通。'),
	(300516, 1856, '2025-09-28', '醫師', 9, '醫師耐心聆聽病情。'),
	(300537, 1889, '2025-09-30', '護理師', 10, '照護過程非常細心。'),
	(300558, 1923, '2025-10-01', '藥師', 8, '領藥速度快，解說清楚。'),
	(300579, 1956, '2025-10-03', '櫃台人員', 7, '報到流程順利。'),
	(300600, 1989, '2025-10-07', '醫師', 10, '醫師非常專業，令人安心。'),
	(300621, 2023, '2025-10-04', '護理師', 9, '抽血技術好，幾乎不痛。'),
	(300622, 1889, '2025-09-30', '醫師', 10, '醫師診斷仔細，態度親切，詳細說明病情與後續治療選項，非常安心');

-- 傾印  資料表 allergyrecords.schedules 結構
CREATE TABLE IF NOT EXISTS `schedules` (
  `ScheduleID` int NOT NULL,
  `StaffID` int NOT NULL,
  `ScheduleDate` date DEFAULT NULL,
  `DepartmentID` int NOT NULL,
  `TimeSlot` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`) USING BTREE,
  KEY `Schedules_Departments_FK` (`DepartmentID`),
  KEY `Schedules_Staff_FK` (`StaffID`),
  CONSTRAINT `Schedules_Departments_FK` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `Schedules_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.schedules 的資料：~24 rows (近似值)
INSERT INTO `schedules` (`ScheduleID`, `StaffID`, `ScheduleDate`, `DepartmentID`, `TimeSlot`) VALUES
	(7012, 35102, '2025-09-24', 23, '早診'),
	(7045, 36215, '2025-09-25', 1, '午診'),
	(7083, 38541, '2025-09-25', 6, '晚診'),
	(7127, 39673, '2025-09-26', 8, '早診'),
	(7159, 37488, '2025-09-27', 4, '午診'),
	(7194, 40756, '2025-09-27', 10, '早診'),
	(7231, 41839, '2025-09-25', 12, '晚診'),
	(7268, 42922, '2025-09-28', 15, '午診'),
	(7302, 44005, '2025-09-29', 17, '晚診'),
	(7337, 45188, '2025-09-30', 19, '早診'),
	(7374, 47554, '2025-09-29', 27, '午診'),
	(7409, 48737, '2025-09-30', 29, '午診'),
	(7446, 49920, '2025-09-30', 31, '早診'),
	(7483, 51103, '2025-10-02', 34, '午診'),
	(7517, 52286, '2025-10-02', 36, '晚診'),
	(7552, 53469, '2025-10-01', 38, '早診'),
	(7589, 54652, '2025-10-03', 40, '午診'),
	(7624, 55835, '2025-10-05', 42, '晚診'),
	(7659, 57018, '2025-10-04', 45, '早診'),
	(7694, 58101, '2025-10-02', 47, '晚診'),
	(7729, 59284, '2025-09-29', 49, '午診'),
	(7764, 60467, '2025-09-28', 51, '晚診'),
	(7799, 61650, '2025-09-30', 53, '午診'),
	(7834, 62833, '2025-10-02', 55, '早診'),
	(7856, 62898, '0000-00-00', 23, '早診');

-- 傾印  資料表 allergyrecords.staff 結構
CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` int NOT NULL,
  `DepartmentID` int NOT NULL,
  `StaffName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffGender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffRole` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffLicneseNum` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `YearsOfExperience` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`) USING BTREE,
  KEY `Staff_Departments_FK` (`DepartmentID`),
  CONSTRAINT `Staff_Departments_FK` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.staff 的資料：~25 rows (近似值)
INSERT INTO `staff` (`StaffID`, `DepartmentID`, `StaffName`, `StaffGender`, `StaffRole`, `StaffLicneseNum`, `StaffPhone`, `YearsOfExperience`) VALUES
	(35102, 23, 'Carter Emily', 'F', 'Nurse', '71234', '0912345678', 5),
	(36215, 1, 'Smith James', 'M', 'Doctor', '85912', '0918765432', 1),
	(37488, 4, 'Brown Sophia', 'F', 'Nurse', '81204', '0912233445', 5),
	(38541, 6, 'Lee William', 'M', 'Technician', '79832', '0919988776', 1),
	(39673, 8, 'Johnson Olivia', 'F', 'Therapist', '93045', '0911122334', 3),
	(40756, 10, 'Davis Benjamin', 'M', 'Doctor', '94567', '0913344556', 3),
	(41839, 12, 'Wilson Isabella', 'F', 'Pharmacist', '97890', '0914455667', 3),
	(42922, 15, 'Martinez Noah', 'M', 'Nurse', '82345', '0915566778', 1),
	(44005, 17, 'Anderson Mia', 'F', 'Therapist', '86789', '0916677889', 4),
	(45188, 19, 'Thomas Logan', 'M', 'Doctor', '89012', '0917788990', 7),
	(46371, 25, 'Jackson Lily', 'F', 'Nurse', '83456', '0918899001', 7),
	(47554, 27, 'White Daniel', 'M', 'Technician', '97891', '0919900112', 2),
	(48737, 29, 'Harris Grace', 'F', 'Pharmacist', '81234', '0911011223', 1),
	(49920, 31, 'Clark Henry', 'M', 'Doctor', '95678', '0912122334', 3),
	(51103, 34, 'Lewis Ava', 'F', 'Nurse', '79012', '0913233445', 6),
	(52286, 36, 'Robinson Jack', 'M', 'Therapist', '84321', '0914344556', 2),
	(53469, 38, 'Walker Ella', 'F', 'Nurse', '98765', '0915455667', 2),
	(54652, 40, 'Young David', 'M', 'Doctor', '82109', '0916566778', 8),
	(55835, 42, 'Allen Scarlett', 'F', 'Technician', '96543', '0917677889', 2),
	(57018, 45, 'King Andrew', 'M', 'Pharmacist', '80987', '0918788990', 3),
	(58101, 47, 'Wright Zoe', 'F', 'Nurse', '87654', '0919899001', 1),
	(59284, 49, 'Scott Matthew', 'M', 'Doctor', '83210', '0910900112', 1),
	(60467, 51, 'Green Nora', 'F', 'Therapist', '96543', '0911011223', 3),
	(61650, 53, 'Adams Claire', 'F', 'Pharmacist', '94321', '0913233445', 2),
	(62833, 55, 'Baker Thomas', 'M', 'Nurse', '98765', '0912122334', 5),
	(62898, 23, 'Thomas Tony', 'M', 'Doctor', '85067', '918565913', 4);

-- 傾印  資料表 allergyrecords.surgeryrecords 結構
CREATE TABLE IF NOT EXISTS `surgeryrecords` (
  `SurgeryID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `StaffID` int NOT NULL,
  `SurgeryDate` date DEFAULT NULL,
  `SurgeryName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SurgerySite` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SurgeryType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AnesthesiaType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DurationMinutes` int DEFAULT NULL,
  `Complications` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `OperativeInstructions` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffNotes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`SurgeryID`) USING BTREE,
  KEY `SurgeryRecords_Staff_FK` (`StaffID`),
  CONSTRAINT `SurgeryRecords_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.surgeryrecords 的資料：~6 rows (近似值)
INSERT INTO `surgeryrecords` (`SurgeryID`, `AppointmentID`, `StaffID`, `SurgeryDate`, `SurgeryName`, `SurgerySite`, `SurgeryType`, `AnesthesiaType`, `DurationMinutes`, `Complications`, `OperativeInstructions`, `StaffNotes`) VALUES
	(550001, 1023, 35102, '2022-08-19', '冠狀動脈支架置放術', '心臟', '心臟介入', '局部麻醉', 90, '無', '術後需臥床6小時', '血流恢復良好'),
	(550002, 1056, 36215, '2022-12-26', '顱內電極植入術', '頭部', '神經外科', '全身麻醉', 150, '術後頭痛', '術後觀察癲癇活動', '電極位置精準'),
	(550003, 1098, 38541, '2025-09-21', '腫瘤切除手術', '腹部', '一般外科', '全身麻醉', 120, '術中出血', '術後需補充鐵劑', '腫瘤邊緣清晰'),
	(550004, 1132, 39673, '2022-02-19', '腦部核磁共振導引切除手術', '頭部', '神經外科', '全身麻醉', 180, '無', '術後需神經功能評估', '無神經損傷'),
	(550005, 1175, 37488, '2023-06-28', '無', '無', '無', '無', 0, '無', '僅進行退燒與觀察，未安排手術。', '小兒發燒，無手術適應症。'),
	(550006, 1209, 40756, '2023-11-11', '腹腔鏡膽囊切除術', '腹部', '一般外科', '全身麻醉', 90, '術後腹脹', '建議少量多餐', '無膽管損傷'),
	(550007, 1244, 41839, '2022-07-05', '無', '無', '無', '無', 0, '無', '僅進行藥物治療，未安排手術。', '皮膚紅疹，無手術適應症。'),
	(550008, 1287, 42922, '2023-03-24', '無', '無', '無', '無', 0, '無', '情緒評估後無需手術。', '焦慮情緒，無手術處置。'),
	(550009, 1321, 44005, '2023-09-01', '子宮鏡肌瘤切除手術', '骨盆腔', '婦科手術', '全身麻醉', 75, '術中出血', '術後需補充鐵劑', '建議定期追蹤'),
	(550010, 1354, 45188, '2024-01-12', '無', '無', '無', '無', 0, '無', '調整荷爾蒙，無需手術。', '月經不規則，無手術紀錄。'),
	(550011, 1389, 47554, '2024-11-25', '關節鏡滑膜切除手術', '肘部', '骨科手術', '局部麻醉', 45, '術後腫脹', '建議冰敷並避免重複動作', '滑膜切除完整'),
	(550012, 1423, 48737, '2024-07-16', '胃鏡下逆流修復手術', '胃部', '內視鏡手術', '鎮靜麻醉', 40, '無', '術後禁食4小時', '括約肌功能改善'),
	(550013, 1456, 49920, '2025-04-02', '腎臟穿刺活檢術', '腎臟', '泌尿科', '局部麻醉', 45, '術後血尿', '建議臥床並補充水分', '樣本品質良好'),
	(550014, 1490, 51103, '2023-05-21', '無', '無', '無', '無', 0, '無', '泌尿科評估後無需手術', '頻尿，無手術紀錄'),
	(550015, 1524, 52286, '2022-12-22', '肝臟腫瘤切除手術', '肝臟', '一般外科', '全身麻醉', 150, '術中出血', '術後需密切監測肝功能', '建議住院觀察'),
	(550016, 1557, 53469, '2024-04-14', '關節鏡滑膜清創手術', '手部', '骨科外科', '局部麻醉', 45, '無', '術後避免使用患側手', '滑膜病灶已清除'),
	(550017, 1591, 54652, '2024-03-12', '無', '無', '無', '無', 0, '無', '感染控制後無需手術', '疑似感染，無手術紀錄'),
	(550018, 1624, 55835, '2024-01-28', '無', '無', '無', '無', 0, '無', '僅進行復健，無手術處置', '術後復健階段'),
	(550019, 1658, 57018, '2023-06-18', '骨髓活檢術', '骨盆腔', '血液腫瘤科', '局部麻醉', 30, '無', '術後需補充水分並臥床', '樣本品質良好'),
	(550020, 1692, 58101, '2025-08-04', '病理切片手術', '腹部', '一般外科', '局部麻醉', 30, '無', '術後觀察傷口癒合', '切片已送病理分析'),
	(550021, 1725, 59284, '2022-03-03', '麻醉前評估處置', '無', '麻醉科', '無', 0, '無', '評估完成，待安排手術', '麻醉風險低，可手術'),
	(550022, 1759, 60467, '2022-03-13', '無', '無', '無', '無', 0, '無', '視力模糊，安排眼科檢查', '無手術處置'),
	(550023, 1793, 61650, '2024-10-27', '無', '無', '無', '無', 0, '無', '喉嚨痛，無需手術', '建議藥物治療'),
	(550024, 1826, 62833, '2024-10-05', '無', '無', '無', '無', 0, '無', '健康檢查無異常，無手術紀錄', '建議定期追蹤'),
	(550025, 1889, 62898, '2025-09-27', '心房顫動導管消融術', '左心房', '電燒消融', '全身麻醉', 150, '術後輕微胸悶，無明顯併發症', '術後需服用抗凝劑並定期追蹤心律', '建議避免劇烈運動，三週內回診');

-- 傾印  資料表 allergyrecords.tests 結構
CREATE TABLE IF NOT EXISTS `tests` (
  `TestID` int NOT NULL,
  `AppointmentID` int NOT NULL,
  `StaffID` int DEFAULT NULL,
  `TestName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TestCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TestDate` date DEFAULT NULL,
  `TestResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TestStatus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TestNotes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`TestID`) USING BTREE,
  KEY `Tests_Appointments_FK` (`AppointmentID`),
  KEY `Tests_Staff_FK` (`StaffID`),
  CONSTRAINT `Tests_Appointments_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`),
  CONSTRAINT `Tests_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.tests 的資料：~25 rows (近似值)
INSERT INTO `tests` (`TestID`, `AppointmentID`, `StaffID`, `TestName`, `TestCode`, `TestDate`, `TestResult`, `TestStatus`, `TestNotes`) VALUES
	(400101, 1023, 35102, '心電圖檢查', 'ECG', '2022-08-27', '節律正常', '已完成', '無須追蹤'),
	(400102, 1056, 36215, '腦波檢查', 'EEG', '2023-01-06', '有異常波形', '已完成', '建議神經科評估'),
	(400103, 1098, 38541, '腫瘤標記檢查', 'TM', '2025-09-25', '陰性', '已完成', '建議定期追蹤'),
	(400104, 1132, 39673, '核磁共振檢查', 'MRI', '2022-02-26', '無異常', '已完成', '結構清晰'),
	(400105, 1175, 37488, '血液培養', 'BC', '2023-07-02', '無菌', '已完成', '無感染跡象'),
	(400106, 1209, 40756, '腹部超音波', 'US-ABD', '2023-11-11', '輕度發炎', '已完成', '建議消化科評估'),
	(400107, 1244, 41839, '過敏原檢測', 'Allergy', '2022-07-12', '對塵蟎過敏', '已完成', '建議環境改善'),
	(400108, 1287, 42922, '焦慮量表評估', 'GAD-7', '2023-03-30', '中度焦慮', '已完成', '建議心理諮詢'),
	(400109, 1321, 44005, '產前超音波', 'OB-US', '2023-09-15', '胎兒發育正常', '已完成', '建議定期產檢'),
	(400110, 1354, 45188, '荷爾蒙檢查', 'Hormone', '2024-01-12', '雌激素偏低', '已完成', '建議婦科追蹤'),
	(400111, 1389, 47554, '關節X光', 'XR-Joint', '2024-11-25', '關節腫脹', '已完成', '建議復健科評估'),
	(400112, 1423, 48737, '胃鏡檢查', 'EGD', '2024-07-21', '有逆流現象', '已完成', '建議調整飲食'),
	(400113, 1456, 49920, '腎功能檢查', 'RFT', '2025-04-02', '肌酸酐偏高', '已完成', '建議腎臟科追蹤'),
	(400114, 1490, 51103, '泌尿道超音波', 'US-URO', '2023-05-29', '膀胱殘尿多', '已完成', '建議泌尿科評估'),
	(400115, 1524, 52286, '胸部X光', 'CXR', '2022-12-30', '肺部模糊陰影', '已完成', '建議胸腔科複檢'),
	(400116, 1557, 53469, '關節超音波', 'US-Joint', '2024-04-17', '滲液明顯', '已完成', '建議抽液檢查'),
	(400117, 1591, 54652, '白血球分類', 'WBC-Diff', '2024-03-18', '中性球升高', '已完成', '疑似感染，建議用藥'),
	(400118, 1624, 55835, '肌力測試', 'Rehab', '2024-01-28', '肌力不足', '已完成', '建議持續復健'),
	(400119, 1658, 57018, '血紅素檢查', 'Hb', '2023-06-21', '偏低', '已完成', '建議補充鐵劑'),
	(400120, 1692, 58101, '病理報告審閱', 'Path-Rvw', '2025-08-04', '良性腫瘤', '已完成', '建議定期追蹤'),
	(400121, 1725, 59284, '麻醉前評估', 'Pre-Anes', '2022-03-03', '合格', '已完成', '可安排手術'),
	(400122, 1759, 60467, '視力檢查', 'VA', '2022-03-13', '右眼模糊', '已完成', '建議眼科追蹤'),
	(400123, 1793, 61650, '喉嚨視診', 'ENT-Obs', '2024-10-29', '紅腫', '已完成', '建議抗生素治療'),
	(400124, 1826, 62833, '健康檢查總評估', 'Checkup', '2024-10-10', '基本正常', '已完成', '建議維持生活習慣'),
	(400125, 1860, 39673, '電腦斷層追蹤檢查', 'CT-FU', '2025-09-06', '無新病灶', '已完成', '建議半年後複檢'),
	(400126, 1889, 62898, '24小時霍特式心電圖', 'ECG-Holter', '2025-09-25', '間歇性心房顫動，夜間心率低至42bpm', '已完成', '建議進一步評估是否需使用抗凝劑');

-- 傾印  資料表 allergyrecords.vaccinationrecords 結構
CREATE TABLE IF NOT EXISTS `vaccinationrecords` (
  `VaccinationID` int NOT NULL,
  `PatientID` int NOT NULL,
  `StaffID` int NOT NULL,
  `VaccineName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DoseNum` int DEFAULT NULL,
  `VaccinationDate` date DEFAULT NULL,
  `VaccinationLocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `HasPostVaccinationSymptoms` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PostVaccinationReaction` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`VaccinationID`) USING BTREE,
  KEY `VaccinationRecords_Patients_FK` (`PatientID`),
  KEY `VaccinationRecords_Staff_FK` (`StaffID`),
  CONSTRAINT `VaccinationRecords_Patients_FK` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  CONSTRAINT `VaccinationRecords_Staff_FK` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 正在傾印表格  allergyrecords.vaccinationrecords 的資料：~25 rows (近似值)
INSERT INTO `vaccinationrecords` (`VaccinationID`, `PatientID`, `StaffID`, `VaccineName`, `DoseNum`, `VaccinationDate`, `VaccinationLocation`, `HasPostVaccinationSymptoms`, `PostVaccinationReaction`) VALUES
	(200123, 10342, 35102, 'COVID-19疫苗', 1, '2025-08-20', '新北市立醫院', '無', '無不適'),
	(200124, 12491, 36215, '流感疫苗', 1, '2025-08-22', '台大醫院', '有', '注射部位紅腫'),
	(200245, 13577, 38541, 'B型肝炎疫苗', 2, '2025-08-16', '三軍總醫院', '無', '無不適'),
	(200312, 14620, 39601, 'COVID-19疫苗', 2, '2025-08-25', '新光醫院', '有', '輕微發燒'),
	(200378, 16988, 40753, '破傷風疫苗', 1, '2025-08-19', '新店慈濟醫院', '無', '無不適'),
	(200421, 17481, 41905, '水痘疫苗', 1, '2025-08-30', '馬偕醫院', '有', '注射部位癢感'),
	(200489, 18231, 43056, 'COVID-19疫苗', 3, '2025-08-31', '北醫附設醫院', '無', '無不適'),
	(200534, 19345, 44208, 'HPV疫苗', 1, '2025-08-31', '台中榮總', '無', '無不適'),
	(200598, 20456, 45360, '流感疫苗', 2, '2025-09-01', '高雄醫學大學附設醫院', '有', '頭暈持續一天'),
	(200643, 21567, 46512, '關節炎疫苗', 1, '2025-09-03', '彰化基督教醫院', '有', '注射部位腫脹'),
	(200701, 22678, 47663, 'COVID-19疫苗', 1, '2025-09-06', '花蓮慈濟醫院', '無', '無不適'),
	(200765, 23735, 48703, '肺炎鏈球菌疫苗', 1, '2025-09-04', '台北榮總', '有', '輕微頭痛'),
	(200812, 24890, 49854, 'B型肝炎疫苗', 3, '2025-09-13', '新竹馬偕醫院', '無', '無不適'),
	(200879, 26018, 52205, '流感疫苗', 1, '2025-09-10', '台南成大醫院', '有', '注射部位疼痛'),
	(200934, 27145, 53357, 'COVID-19疫苗', 2, '2025-09-16', '台北市立聯合醫院', '無', '無不適'),
	(200987, 28273, 54509, 'HPV疫苗', 2, '2025-09-18', '台北慈濟醫院', '有', '輕微噁心'),
	(201045, 29400, 55660, 'B型肝炎疫苗', 1, '2025-09-19', '台北市立婦幼醫院', '無', '無不適'),
	(201102, 30528, 56812, 'COVID-19疫苗', 3, '2025-09-21', '新北市衛生所', '有', '注射部位硬塊'),
	(201158, 31655, 57964, '流感疫苗', 2, '2025-09-23', '台北市立中興醫院', '無', '無不適'),
	(201219, 32783, 59115, '水痘疫苗', 1, '2025-09-24', '台北市立和平醫院', '有', '輕微皮膚紅疹'),
	(201276, 33910, 60267, 'COVID-19疫苗', 1, '2025-09-25', '台北市立仁愛醫院', '無', '無不適'),
	(201334, 35038, 61418, 'HPV疫苗', 3, '2025-09-27', '台北市立陽明醫院', '有', '疲倦感持續兩天'),
	(201389, 36165, 62570, '流感疫苗', 1, '2025-09-29', '台北市立萬芳醫院', '無', '無不適'),
	(201445, 37293, 63721, 'B型肝炎疫苗', 2, '2025-09-29', '台北市立忠孝醫院', '無', '注射部位發熱'),
	(201503, 38420, 64873, 'COVID-19疫苗', 2, '2025-09-30', '台北市立松德醫院', '無', '無不適'),
	(201756, 32265, 62898, 'COVID-19疫苗', 3, '2021-09-15', '新北市汐止區衛生所', '有', '注射部位輕微腫脹與疲倦感，無需特殊處理');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

