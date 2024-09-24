-- CREATE DATABASE hospital_db;
CREATE hospital_db;

-- USE hospital_db;
USE hospital_db;

-- patients TABLE
CREATE TABLE patients (
     patient_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(255) NOT NULL,
     last_name VARCHAR(255) NOT NULL,
     date_of_birth DATE NOT NULL,
     gender VARCHAR(255) NOT NULL,
     language VARCHAR(255) NOT NULL
);

-- providers TABLE
CREATE TABLE providers (
           provider_id INT PRIMARY KEY AUTO_INCREMENT ,
           first_name VARCHAR(255) NOT NULL,
           last_name VARCHAR(255) NOT NULL,
           provider_speciality VARCHAR(255) NOT NULL,
           email_address VARCHAR(255),
           phone_number VARCHAR(255),
           date_joined DATE NOT NULL
);

-- visits TABLE
CREATE TABLE visits (
          visit_id INT PRIMARY KEY AUTO_INCREMENT ,
          patient_id INT NOT NULL,
          provider_id INT NOT NULL,
          date_of_visit DATE NOT NULL,
          date_scheduled DATE NOT NULL,
          visit_depertment_id INT NOT NULL,
          visit_type VARCHAR(255) NOT NULL,
          blood_pressure_systollic INT ,
          blood_pressure_diastollic DECIMAL ,
          pulse DECIMAL ,
          visit_status VARCHAR(255) NOT NULL
);

-- ed_visits
CREATE TABLE ed_visits ( 
		ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
        visit_id INT NOT NULL,
        patient_id INT NOT NULL,
        acuity INT NOT NULL,
        reason_for_visit VARCHAR(255) NOT NULL,
        disposition VARCHAR(255) NOT NULL
);

-- admission TABLE
CREATE TABLE admissions(
         admission_id INT PRIMARY KEY AUTO_INCREMENT,
         patient_id INT NOT NULL,
         admission_date DATE,
         discharge_date DATE,
         discharge_dispostion VARCHAR(255) NOT NULL,
         service VARCHAR(255) NOT NULL,
         primary_diagnosis VARCHAR(255) NOT NULL
);

-- discharges table
CREATE TABLE discharges(
         discharge_id INT PRIMARY KEY AUTO_INCREMENT,
         admission_id INT NOT NULL,
         patient_id INT  NOT NULL,
         discharge_date DATE NOT NULL,
         discharge_disposition VARCHAR(255) NOT NULL
);


-- use hospital_db
USE hospital_db

-- Basic Data Retrieval
SELECT first_name, last_name, date_of_birth
FROM patients;

SELECT provider_id, first_name, provider_speciality
FROM providers;

-- Pattern_Based Filtering
SELECT *
FROM patients
WHERE first_name LIKE 'AB%';

SELECT *
FROM providers
WHERE provider_speciality LIKE '%Y';

-- Comparison Operators
SELECT *
FROM patients
WHERE date_of_birth > '1980-01-01';

SELECT *
FROM ed_visits
WHERE acuity >= 2;

-- WHERE Clause with logical Operators
SELECT *
FROM patients
WHERE language= 'spanish';

SELECT *
FROM ed_visits
WHERE reason_for_visit = 'Migraine'
  AND disposition = 'Admitted';

SELECT *
FROM patients
WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-12-31';

-- Sorting Data
SELECT *
FROM patients
ORDER BY last_name ASC;

SELECT *
FROM visits
ORDER BY date_of_visit DESC;

-- Advanced Filtering
SELECT *
FROM admissions
WHERE primary_diagnosis = 'Stroke'
AND discharge_dispostion = 'Home';

SELECT *
FROM providers
WHERE date_joined > '1995-12-31'
AND provider_speciality IN ('Pediatrics', 'Cardiology');

-- Basic Aggregate Functions
-- 1.1). Write a query to find the total number of patient admissions in the admissions table.
SELECT COUNT(*) AS total_admission
FROM admissions;

-- 1.2). Write a query to calculate the average length of stay (difference between discharge date and admission date) for all patients.
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions;

-- Grouping Data
-- 2.1). Write a query to group admissions by primary_diagnosis and calculate the total number of admissions for each diagnosis.
SELECT COUNT(*) total_number_of_admissions
FROM admissions
GROUP BY primary_diagnosis;

-- 2.2). Write a query to group admissions by service and calculate the average length of stay for each servic
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions
GROUP BY service;

-- 2.3). Write a query to group discharges by discharge_disposition and count the number of discharges in each category
SELECT COUNT(*) the_number_of_discharges
FROM admissions
GROUP BY discharge_dispostion;

-- Combining Aggregates and Filtering
-- 3.1). Write a query to group admissions by service and show the services where the total number of admissions is greater than 5.
SELECT COUNT(*) AS total_number_of_admissions
FROM admissions
GROUP BY service
HAVING COUNT(*)> 5;

-- 3.2). Write a query to find the average length of stay for patients admitted with a primary diagnosis of "Stroke" in the admissions table.
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS average_length_of_stay
FROM admissions
WHERE primary_diagnosis = 'Stroke';

-- Advanced Grouping and Summarizing
-- 4.1). Write a query to group emergency department visits (ed_visits) by acuity and calculate the total number of visits for each acuity level.
SELECT COUNT(*) total_number_of_visits
FROM ed_visits
GROUP BY acuity;

-- 4.2). Write a query to group admissions by primary_diagnosis and service, showing the total number of admissions for each combination.
SELECT primary_diagnosis, service, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis, service;

-- Practical Financial Analysis
-- 5.1). Write a query to group admissions by month (using the admission_date) and calculate the total number of admissions per month.
SELECT DATE_FORMAT(admission_date, '%Y-%m') AS month, COUNT(*) AS total_admissions
FROM admissions
GROUP BY month
ORDER BY month;

-- Write a query to find the maximum length of stay for each primary_diagnosis in the admissions table.
SELECT primary_diagnosis,  MAX(DATEDIFF(discharge_date,admission_date)) AS max_length_of_stay
FROM admissions
GROUP BY primary_diagnosis;


-- Part 1: INSERT Data
-- 1.1). Add a new patient with the following details
INSERT INTO patients (first_name, last_name, date_of_birth, gender, language)
VALUES ('John', 'Doe', '1980-11-15', 'Male', 'English');

-- Part 2: UPDATE Data
-- 2.1). Write a query to change John Doe's languge from "English" to "Spanish"
UPDATE patients
SET language = 'Spanish'
WHERE first_name = 'John' AND  last_name = 'Doe' AND language = 'English';

-- Part 3: DELETE Data
-- 3.1). Delete the patient with the patient_id number 10
DELETE FROM patients
WHERE patient_id = 10;

-- Part 4: Handling NULL Values
-- 4.1). Write a query to find that takes all the names and the emails of the providers and if any of them has a NULL email, replace it with N/A
SELECT first_name, last_name, COALESCE(email_address, 'N/A') AS email_address
FROM providers;

-- 4.2). Write a query that takes the names and contact details of the provider whether phone number or email and if any of the two is missing, replace it with Missing details
SELECT first_name, last_name,
     COALESCE(phone_number, 'Missing details') AS phone_number,
     COALESCE(email_address, 'Missing details') AS email_address
FROM providers;

-- Bonus question(Optional)
-- Write a query to retrieve all providers whose speciality is pediatrics and they are missing either of the contact details.
SELECT first_name, last_name, Phone_number, email_address
    FROM providers
    WHERE provider_speciality = 'pediatrics'
     AND (phone_number IS NULL OR email_address IS NULL);

