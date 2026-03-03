外鍵檢查暫停
SET FOREIGN_KEY_CHECKS = 0;



1.檢驗檢查紀錄 - Tests

INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400101,
1023,
35102,
'心電圖檢查',
'ECG',
str_to_date('20220827','%Y%m%d'),
'節律正常',
'已完成',
'無須追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400102,
1056,
36215,
'腦波檢查',
'EEG',
str_to_date('20230106','%Y%m%d'),
'有異常波形',
'已完成',
'建議神經科評估'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400103,
1098,
38541,
'腫瘤標記檢查',
'TM',
str_to_date('20250925','%Y%m%d'),
'陰性',
'已完成',
'建議定期追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400104,
1132,
39673,
'核磁共振檢查',
'MRI',
str_to_date('20220226','%Y%m%d'),
'無異常',
'已完成',
'結構清晰'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400105,
1175,
37488,
'血液培養',
'BC',
str_to_date('20230702','%Y%m%d'),
'無菌',
'已完成',
'無感染跡象'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400106,
1209,
40756,
'腹部超音波',
'US-ABD',
str_to_date('20231111','%Y%m%d'),
'輕度發炎',
'已完成',
'建議消化科評估'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400107,
1244,
41839,
'過敏原檢測',
'Allergy',
str_to_date('20220712','%Y%m%d'),
'對塵蟎過敏',
'已完成',
'建議環境改善'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400108,
1287,
42922,
'焦慮量表評估',
'GAD-7',
str_to_date('20230330','%Y%m%d'),
'中度焦慮',
'已完成',
'建議心理諮詢'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400109,
1321,
44005,
'產前超音波',
'OB-US',
str_to_date('20230915','%Y%m%d'),
'胎兒發育正常',
'已完成',
'建議定期產檢'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400110,
1354,
45188,
'荷爾蒙檢查',
'Hormone',
str_to_date('20240112','%Y%m%d'),
'雌激素偏低',
'已完成',
'建議婦科追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400111,
1389,
47554,
'關節X光',
'XR-Joint',
str_to_date('20241125','%Y%m%d'),
'關節腫脹',
'已完成',
'建議復健科評估'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400112,
1423,
48737,
'胃鏡檢查',
'EGD',
str_to_date('20240721','%Y%m%d'),
'有逆流現象',
'已完成',
'建議調整飲食'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400113,
1456,
49920,
'腎功能檢查',
'RFT',
str_to_date('20250402','%Y%m%d'),
'肌酸酐偏高',
'已完成',
'建議腎臟科追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400115,
1524,
52286,
'胸部X光',
'CXR',
str_to_date('20221230','%Y%m%d'),
'肺部模糊陰影',
'已完成',
'建議胸腔科複檢'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400116,
1557,
53469,
'關節超音波',
'US-Joint',
str_to_date('20240417','%Y%m%d'),
'滲液明顯',
'已完成',
'建議抽液檢查'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400117,
1591,
54652,
'白血球分類',
'WBC-Diff',
str_to_date('20240318','%Y%m%d'),
'中性球升高',
'已完成',
'疑似感染，建議用藥'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400118,
1624,
55835,
'肌力測試',
'Rehab',
str_to_date('20240128','%Y%m%d'),
'肌力不足',
'已完成',
'建議持續復健'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400119,
1658,
57018,
'血紅素檢查',
'Hb',
str_to_date('20230621','%Y%m%d'),
'偏低',
'已完成',
'建議補充鐵劑'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400120,
1692,
58101,
'病理報告審閱',
'Path-Rvw',
str_to_date('20250804','%Y%m%d'),
'良性腫瘤',
'已完成',
'建議定期追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400121,
1725,
59284,
'麻醉前評估',
'Pre-Anes',
str_to_date('20220303','%Y%m%d'),
'合格',
'已完成',
'可安排手術'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400122,
1759,
60467,
'視力檢查',
'VA',
str_to_date('20220313','%Y%m%d'),
'右眼模糊',
'已完成',
'建議眼科追蹤'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400123,
1793,
61650,
'喉嚨視診',
'ENT-Obs',
str_to_date('20241029','%Y%m%d'),
'紅腫',
'已完成',
'建議抗生素治療'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400124,
1826,
62833,
'健康檢查總評估',
'Checkup',
str_to_date('20241010','%Y%m%d'),
'基本正常',
'已完成',
'建議維持生活習慣'
);


INSERT INTO Tests(
TestID,
AppointmentID,
StaffID,
TestName,
TestCode,
TestDate,
TestResult,
TestStatus,
TestNotes
)
VALUES
(
400125,
1860,
39673,
'電腦斷層追蹤檢查',
'CT-FU',
str_to_date('20250906','%Y%m%d'),
'無新病灶',
'已完成',
'建議半年後複檢'
);

2. 醫療資源使用表 - MedicalResourceUsage

INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450001,
10342,
35102,
023,
'醫療設備',
'心電圖機',
str_to_date('20220819','%Y%m%d'),
'30分鐘',
'監測心律變化'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450002,
12491,
36215,
001,
'藥品',
'抗癲癇藥物',
str_to_date('20221226','%Y%m%d'),
'60分鐘',
'服藥後觀察副作用'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450003,
13577,
38541,
006,
'檢查儀器',
'腫瘤標記分析儀',
str_to_date('20250921','%Y%m%d'),
'45分鐘',
'評估腫瘤活性'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450004,
14620,
39673,
008,
'影像設備',
'核磁共振掃描儀',
str_to_date('20220219','%Y%m%d'),
'60分鐘',
'腦部結構掃描'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450005,
15834,
37488,
004,
'醫療耗材',
'小兒退燒貼片',
str_to_date('20230628','%Y%m%d'),
'20分鐘',
'降溫處理'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450006,
16988,
40756,
010,
'檢查儀器',
'腹部超音波機',
str_to_date('20231111','%Y%m%d'),
'30分鐘',
'檢查腹部疼痛原因'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450007,
17241,
41839,
012,
'藥品',
'抗組織胺藥物',
str_to_date('20220705','%Y%m%d'),
'60分鐘',
'紓解皮膚過敏反應'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450008,
18395,
42922,
015,
'心理評估工具',
'焦慮量表',
str_to_date('20230324','%Y%m%d'),
'25分鐘',
'初步心理狀態評估'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450009,
19462,
44005,
017,
'影像設備',
'產前超音波機',
str_to_date('20230901','%Y%m%d'),
'40分鐘',
'胎兒健康檢查'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450010,
20513,
45188,
019,
'檢查儀器',
'荷爾蒙分析儀',
str_to_date('20240112','%Y%m%d'),
'35分鐘',
'評估內分泌功能'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450011,
21674,
47554,
027,
'影像設備',
'關節X光機',
str_to_date('20241125','%Y%m%d'),
'30分鐘',
'評估關節疼痛'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450012,
22735,
48737,
029,
'內視鏡設備',
'胃鏡',
str_to_date('20240716','%Y%m%d'),
'60分鐘',
'檢查胃食道逆流'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450013,
23896,
49920,
031,
'檢查儀器',
'腎功能分析儀',
str_to_date('20250402','%Y%m%d'),
'30分鐘',
'評估腎臟功能'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450014,
24957,
51103,
034,
'影像設備',
'泌尿道超音波機',
str_to_date('20230521','%Y%m%d'),
'45分鐘',
'檢查頻尿原因'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450015,
26018,
52286,
036,
'影像設備',
'胸部X光機',
str_to_date('20221212','%Y%m%d'),
'30分鐘',
'評估呼吸困難'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450016,
27179,
53469,
038,
'檢查儀器',
'關節超音波機',
str_to_date('20240414','%Y%m%d'),
'35分鐘',
'檢查關節腫脹'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450017,
28340,
54652,
040,
'檢查儀器',
'白血球分類儀',
str_to_date('20240312','%Y%m%d'),
'25分鐘',
'疑似感染檢查'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450018,
29401,
55835,
042,
'復健器材',
'肌力訓練機',
str_to_date('20240128','%Y%m%d'),
'60分鐘',
'術後復健使用'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450019,
30562,
57018,
045,
'檢查儀器',
'血紅素分析儀',
str_to_date('20230618','%Y%m%d'),
'30分鐘',
'評估貧血狀況'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450020,
34528,
58101,
047,
'醫療耗材',
'病理報告紙本',
str_to_date('20250804','%Y%m%d'),
'15分鐘',
'醫師解釋報告內容'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450021,
34689,
59284,
049,
'麻醉設備',
'麻醉前評估儀',
str_to_date('20220303','%Y%m%d'),
'40分鐘',
'手術前風險評估'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450022,
34850,
60467,
051,
'檢查儀器',
'視力測試儀',
str_to_date('20220313','%Y%m%d'),
'20分鐘',
'評估視力模糊原因'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450023,
34911,
61650,
053,
'檢查儀器',
'喉嚨視診鏡',
str_to_date('20241027','%Y%m%d'),
'15分鐘',
'檢查喉嚨紅腫'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450024,
13284,
62833,
055,
'醫療設備',
'健康檢查儀',
str_to_date('20241005','%Y%m%d'),
'60分鐘',
'全身健康評估'
);


INSERT INTO MedicalResourceUsage(
UsageID,
PatientID,
StaffID,
DepartmentID,
ResourceType,
ResourceName,
UsageDate,
UsageDuration,
UsageNotes
)
VALUES
(450025,
34999,
39673,
008,
'影像設備',
'電腦斷層掃描儀',
str_to_date('20250902','%Y%m%d'),
'60分鐘',
'追蹤病灶變化'
);


3. 健保費用表 - InsuranceBilling

INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350123,
  10342,
  1023,
str_to_date('20250901','%Y%m%d'),
  '診察費',
  500.00,
  '是',
  400.00,
  100.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350145,
  12491,
  1056,
str_to_date('20250902','%Y%m%d'),
  '抽血費',
  300.00,
  '是',
  250.00,
  50.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350167,
  13577,
  1098,
str_to_date('20250902','%Y%m%d'),
  'X光檢查費',
  800.00,
  '是',
  600.00,
  200.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350189,
  14620,
  1132,
str_to_date('20250904','%Y%m%d'),
  '超音波檢查費',
  1000.00,
  '否',
  0.00,
  1000.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350201,
  16988,
  1209,
str_to_date('20250906','%Y%m%d'),
  '注射費',
  200.00,
  '是',
  150.00,
  50.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350423,
  17481,
  1244,
str_to_date('20250906','%Y%m%d'),
  '血糖檢測費',
  350.00,
  '是',
  300.00,
  50.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350445,
  18231,
  1285,
str_to_date('20250908','%Y%m%d'),
  '心電圖檢查費',
  600.00,
  '是',
  500.00,
  100.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350467,
  19345,
  1321,
str_to_date('20250908','%Y%m%d'),
  '藥品費',
  1200.00,
  '否',
  0.00,
  1200.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350489,
  20456,
  1345,
str_to_date('20250909','%Y%m%d'),
  '病理檢查費',
  950.00,
  '是',
  700.00,
  250.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350511,
  21567,
  1389,
 str_to_date('20250910','%Y%m%d'),
  '疫苗接種費',
  800.00,
  '是',
  600.00,
  200.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350533,
  22678,
  1423,
 str_to_date('20250911','%Y%m%d'),
  '診察費',
  500.00,
  '是',
  400.00,
  100.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350611,
  27145,
  1589,
 str_to_date('20250915','%Y%m%d'),
  '注射費',
  200.00,
  '是',
  150.00,
  50.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350823,
  35038,
  1723,
 str_to_date('20250920','%Y%m%d'),
  '皮膚病理切片檢查',
  1500.00,
  '是',
  1200.00,
  300.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350844,
  36165,
  1756,
 str_to_date('20250921','%Y%m%d'),
  '腹部電腦斷層掃描',
  2800.00,
  '否',
  0.00,
  2800.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350865,
  37293,
  1789,
 str_to_date('20250923','%Y%m%d'),
  '呼吸功能測試',
  950.00,
  '是',
  700.00,
  250.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350886,
  38420,
  1823,
 str_to_date('20250925','%Y%m%d'),  
  '眼底攝影檢查',
  650.00,
  '是',
  500.00,
  150.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350907,
  39547,
  1856,
 str_to_date('20250925','%Y%m%d'),
  '腎功能血液檢查',
  420.00,
  '是',
  350.00,
  70.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350928,
  40675,
  1889,
 str_to_date('20250927','%Y%m%d'),
  '心臟超音波檢查',
  1800.00,
  '否',
  0.00,
  1800.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350949,
  41802,
  1923,
 str_to_date('20250929','%Y%m%d'),
  '骨密度檢查',
  750.00,
  '是',
  600.00,
  150.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350970,
  42930,
  1956,
 str_to_date('20250929','%Y%m%d'),
  '腸胃鏡前麻醉費',
  900.00,
  '是',
  700.00,
  200.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350991,
  44057,
  1989,
 str_to_date('20251002','%Y%m%d'),
  '傷口換藥處置費',
  300.00,
  '是',
  250.00,
  50.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  351012,
  45185,
  2023,
 str_to_date('20251008','%Y%m%d'),
  '疼痛管理諮詢費',
  600.00,
  '否',
  0.00,
  600.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350577,
  24890,
  1466,
  str_to_date('20250919','%Y%m%d'),
  '超音波檢查費',
  1000.00,
  '否',
  0.00,
  1000.00
);


INSERT INTO InsuranceBilling (
  BillingID,
  PATIENTID,
  AppointmentID,
  BillingDate,
  ItemDescription,
  Amount,
  NHI,
  NHIAmount,
  PatientPay
)
VALUES (
  350599,
  26018,
  1524,
  str_to_date('20250928','%Y%m%d'),
  'X光檢查費',
  800.00,
  '是',
  600.00,
  200.00
);


4. 疫苗接種表 - VaccinationRecords

INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200123,
10342,
35102,
'COVID-19疫苗',
1,
str_to_date('20250820','%Y%m%d'),
'新北市立醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(
200124,
12491,
36215,
'流感疫苗',
1,
str_to_date('20250822','%Y%m%d'),
'台大醫院',
'有',
'注射部位紅腫'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200245,
13577,
38541,
'B型肝炎疫苗',
2,
str_to_date('20250816','%Y%m%d'),
'三軍總醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200312,
14620,
39601,
'COVID-19疫苗',
2,
str_to_date('20250825','%Y%m%d'),
'新光醫院',
'有',
'輕微發燒'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200378,
16988,
40753,
'破傷風疫苗',
1,
str_to_date('20250819','%Y%m%d'),
'新店慈濟醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200421,
17481,
41905,
'水痘疫苗',
1,
str_to_date('20250830','%Y%m%d'),
'馬偕醫院',
'有',
'注射部位癢感'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200489,
18231,
43056,
'COVID-19疫苗',
3,
str_to_date('20250831','%Y%m%d'),
'北醫附設醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200534,
19345,
44208,
'HPV疫苗',
1,
str_to_date('20250831','%Y%m%d'),
'台中榮總',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200598,
20456,
45360,
'流感疫苗',
2,
str_to_date('20250901','%Y%m%d'),
'高雄醫學大學附設醫院',
'有',
'頭暈持續一天'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200643,
21567,
46512,
'關節炎疫苗',
1,
str_to_date('20250903','%Y%m%d'),
'彰化基督教醫院',
'有',
'注射部位腫脹'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200701,
22678,
47663,
'COVID-19疫苗',
1,
str_to_date('20250906','%Y%m%d'),
'花蓮慈濟醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200765,
23735,
48703,
'肺炎鏈球菌疫苗',
1,
str_to_date('20250904','%Y%m%d'),
'台北榮總',
'有',
'輕微頭痛'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200879,
26018,
52205,
'流感疫苗',
1,
str_to_date('20250910','%Y%m%d'),
'台南成大醫院',
'有',
'注射部位疼痛'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200812,
24890,
49854,
'B型肝炎疫苗',
3,
str_to_date('20250913','%Y%m%d'),
'新竹馬偕醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200934,
27145,
53357,
'COVID-19疫苗',
2,
str_to_date('20250916','%Y%m%d'),
'台北市立聯合醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(200987,
28273,
54509,
'HPV疫苗',
2,
str_to_date('20250918','%Y%m%d'),
'台北慈濟醫院',
'有',
'輕微噁心'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201045,
29400,
55660,
'B型肝炎疫苗',
1,
str_to_date('20250919','%Y%m%d'),
'台北市立婦幼醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201102,
30528,
56812,
'COVID-19疫苗',
3,
str_to_date('20250921','%Y%m%d'),
'新北市衛生所',
'有',
'注射部位硬塊'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201158,
31655,
57964,
'流感疫苗',
2,
str_to_date('20250923','%Y%m%d'),
'台北市立中興醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201219,
32783,
59115,
'水痘疫苗',
1,
str_to_date('20250924','%Y%m%d'),
'台北市立和平醫院',
'有',
'輕微皮膚紅疹'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201276,
33910,
60267,
'COVID-19疫苗',
1,
str_to_date('20250925','%Y%m%d'),
'台北市立仁愛醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201334,
35038,
61418,
'HPV疫苗',
3,
str_to_date('20250927','%Y%m%d'),
'台北市立陽明醫院',
'有',
'疲倦感持續兩天'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201389,
36165,
62570,
'流感疫苗',
1,
str_to_date('20250929','%Y%m%d'),
'台北市立萬芳醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201503,
38420,
64873,
'COVID-19疫苗',
2,
str_to_date('20250930','%Y%m%d'),
'台北市立松德醫院',
'無',
'無不適'
);


INSERT INTO VaccinationRecords(
VaccinationID,
PatientID,
StaffID,
VaccineName,
Dosenum,
VaccinationDate,
VaccinationLocation,
HaspostvaccinationSymptoms,
PostVaccinationReaction
)
VALUES
(201445,
37293,
63721,
'B型肝炎疫苗',
2,
str_to_date('20250929','%Y%m%d'),
'台北市立忠孝醫院',
'無',
'注射部位發熱'
);

5. 病患滿意程度表 - SatisfactionSurveys

INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300123,
1056,
str_to_date('20250910','%Y%m%d'),
'醫師',
9,
'醫師解說詳細，態度親切。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300145,
1098,
str_to_date('20250911','%Y%m%d'),
'護理師',
8,
'抽血時很溫柔，感覺安心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300167,
1175,
str_to_date('20250910','%Y%m%d'),
'櫃台人員',
7,
'接待速度稍慢，但態度不錯。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300189,
1209,
str_to_date('20250913','%Y%m%d'),
'醫師',
10,
'醫師非常專業，診斷準確。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300201,
1244,
str_to_date('20250913','%Y%m%d'),
'護理師',
7,
'注射時有點痛，希望改善技術。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300243,
1321,
str_to_date('20250915','%Y%m%d'),
'藥師',
9,
'解說用藥方式清楚，態度親切。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300222,
1287,
str_to_date('20250916','%Y%m%d'),
'櫃台人員',
7,
'協助掛號流程順利。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300264,
1354,
str_to_date('20250917','%Y%m%d'),
'醫師',
9,
'回答問題很有耐心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300285,
1389,
str_to_date('20250918','%Y%m%d'),
'護理師',
10,
'換藥時很細心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300306,
1423,
str_to_date('20250918','%Y%m%d'),
'藥師',
8,
'領藥流程順暢。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300327,
1456,
str_to_date('20250920','%Y%m%d'),
'櫃台人員',
6,
'排隊時間稍長。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300348,
1490,
str_to_date('20250921','%Y%m%d'),
'醫師',
9,
'醫師診斷迅速，令人安心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300369,
1524,
str_to_date('20250922','%Y%m%d'),
'護理師',
7,
'照護細心，但語速稍快。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300390,
1591,
str_to_date('20250923','%Y%m%d'),
'藥師',
8,
'提醒副作用很貼心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300411,
1692,
str_to_date('20250923','%Y%m%d'),
'櫃台人員',
9,
'協助報到流程順利。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300432,
1723,
str_to_date('20250925','%Y%m%d'),
'醫師',
10,
'醫師態度溫和，診斷準確。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300453,
1756,
str_to_date('20250926','%Y%m%d'),
'護理師',
8,
'換藥時解說清楚。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300474,
1789,
str_to_date('20250927','%Y%m%d'),
'藥師',
7,
'用藥說明簡潔明瞭。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300495,
1823,
str_to_date('20250927','%Y%m%d'),
'櫃台人員',
5,
'接待人員態度普通。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300516,
1856,
str_to_date('20250928','%Y%m%d'),
'醫師',
9,
'醫師耐心聆聽病情。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300537,
1889,
str_to_date('20250930','%Y%m%d'),
'護理師',
10,
'照護過程非常細心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300558,
1923,
str_to_date('20251001','%Y%m%d'),
'藥師',
8,
'領藥速度快，解說清楚。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300579,
1956,
str_to_date('20251003','%Y%m%d'),
'櫃台人員',
7,
'報到流程順利。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300600,
1989,
str_to_date('20251007','%Y%m%d'),
'醫師',
10,
'醫師非常專業，令人安心。'
);


INSERT INTO satisfactionsurveys(
SurveyID,
AppointmentID,
SURVEYDATE,
TargetRole,
Rating,
Comments
)
VALUES
(300621,
2023,
str_to_date('20251004','%Y%m%d'),
'護理師',
9,
'抽血技術好，幾乎不痛。'
);


























































































































































































































































































































































































































