DROP TABLE IF EXISTS HOSPITAL;

--CREATE TABLE HOSPITAL

CREATE TABLE HOSPITAL(
Hospital_Name VARCHAR(100),
Location VARCHAR(100),
Department VARCHAR(100),
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM HOSPITAL;


--1)Total Number of Patients
--Write an SQL query to find the total number of patients across all hospitals.

SELECT SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM HOSPITAL;

--2)Average Number of Doctors per Hospital 
--Retrieve the average count of doctors available in each hospital.

SELECT HOSPITAL_NAME,AVG(DOCTORS_COUNT)AS AVG_DOCTORS
FROM HOSPITAL
GROUP BY HOSPITAL_NAME;

--3)Top 3 Departments with the Highest Number of Patients 
--Find the top 3 hospital departments that have the highest number of patients.

SELECT DEPARTMENT,SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM HOSPITAL
GROUP BY DEPARTMENT
ORDER BY TOTAL_PATIENTS DESC
LIMIT 3;

--4)Hospital with the Maximum Medical Expe--nses 
--Identify the hospital that recorded the highest medical expenses.

SELECT Hospital_Name,medical_expenses
FROM HOSPITAL
ORDER BY MEDICAL_EXPENSES DESC
LIMIT 1

--5)Daily Average Medical Expenses 
--Calculate the average medical expenses per day for each hospital.

SELECT *,
(Discharge_Date - Admission_Date) AS Stay_Duration
FROM Hospital
ORDER BY Stay_Duration DESC
LIMIT 1;


--6)Longest Hospital Stay 
-- Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. 

SELECT * FROM HOSPITAL
ORDER BY (DISCHARGE_DATE-ADMISSION_DATE) DESC
LIMIT 1;

--7)Total Patients Treated Per City 
-- Count the total number of patients treated in each city.

SELECT HOSPITAL_NAME,SUM(PATIENTS_COUNT) AS PATIENTS
FROM HOSPITAL
GROUP BY HOSPITAL_NAME
ORDER BY PATIENTS;

--8)Average Length of Stay Per Department 
--Calculate the average number of days patients spend in each department. 


SELECT DEPARTMENT,
AVG(discharge_date - admission_date) AS SPEND_IN_DEPT
FROM HOSPITAL
GROUP BY DEPARTMENT;


--9)Identify the Department with the Lowest Number of Patients 
--Find the department with the least number of patients. 

SELECT DEPARTMENT,SUM(PATIENTS_COUNT) AS LEAST_PATIENTS
FROM HOSPITAL
GROUP BY DEPARTMENT
ORDER BY LEAST_PATIENTS ASC
LIMIT 1;

--10) Monthly Medical Expenses Report 
--Group the data by month and calculate the total medical expenses for each month. 

SELECT 
DATE_TRUNC('month', admission_date) AS month,
SUM(medical_expenses) AS total_medical_expenses
FROM  hospital
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month;


