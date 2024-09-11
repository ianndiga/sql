-- CREATE DATABASE hospital_db;
-- USE hospital_db;

-- CREATE TABLE patients (
--      patient_id INT PRIMARY KEY AUTO_INCREMENT,
--      first_name VARCHAR(255) NOT NULL,
--      last_name VARCHAR(255) NOT NULL,
--      date_of_birth DATE NOT NULL,
--      gender VARCHAR(255) NOT NULL,
--      language VARCHAR(255) NOT NULL

-- );
-- CREATE TABLE providers (
--            provider_id INT PRIMARY KEY AUTO_INCREMENT ,
--            first_name VARCHAR(255) NOT NULL,
--            last_name VARCHAR(255) NOT NULL,
--            provider_speciality VARCHAR(255) NOT NULL,
--            email_address VARCHAR(255),
--            phone_number VARCHAR(255),
--            date_joined DATE NOT NULL
-- );
-- CREATE TABLE visits (
--           visit_id INT PRIMARY KEY AUTO_INCREMENT ,
--           patient_id INT NOT NULL,
--           provider_id INT NOT NULL,
--           date_of_visit DATE NOT NULL,
--           date_scheduled DATE NOT NULL,
--           visit_depertment_id INT NOT NULL,
--           visit_type VARCHAR(255) NOT NULL,
--           blood_pressure_systollic INT ,
--           blood_pressure_diastollic DECIMAL ,
--           pulse DECIMAL ,
--           visit_status VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE ed_visits ( 
-- 		ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
--         visit_id INT NOT NULL,
--         patient_id INT NOT NULL,
--         acuity INT NOT NULL,
--         reason_for_visit VARCHAR(255) NOT NULL,
--         disposition VARCHAR(255) NOT NULL
--         
-- );

-- CREATE TABLE admissions(
--          admission_id INT PRIMARY KEY AUTO_INCREMENT,
--          patient_id INT NOT NULL,
--          admission_date DATE,
--          discharge_date DATE,
--          discharge_dispostion VARCHAR(255) NOT NULL,
--          service VARCHAR(255) NOT NULL,
--          primary_diagnosis VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE discharges(
--          discharge_id INT PRIMARY KEY AUTO_INCREMENT,
--          admission_id INT NOT NULL,
--          patient_id INT  NOT NULL,
--          discharge_date DATE NOT NULL,
--          discharge_disposition VARCHAR(255) NOT NULL
-- );



-- USE hospital_db
-- SELECT first_name, last_name, date_of_birth
-- FROM patients;

-- SELECT provider_id, first_name, provider_speciality
-- FROM providers;
-- SELECT *
-- FROM patients
-- WHERE first_name LIKE 'AB%';

-- SELECT *
-- FROM providers
-- WHERE provider_speciality LIKE '%Y';

-- SELECT *
-- FROM patients
-- WHERE date_of_birth > '1980-01-01';

-- SELECT *
-- FROM ed_visits
-- WHERE acuity >= 2;

-- SELECT *
-- FROM patients
-- WHERE language= 'spanish';

-- SELECT *
-- FROM ed_visits
-- WHERE reason_for_visit = 'Migraine'
--   AND disposition = 'Admitted';

-- SELECT *
-- FROM patients
-- WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-12-31';

-- SELECT *
-- FROM patients
-- ORDER BY last_name ASC;

-- SELECT *
-- FROM visits
-- ORDER BY date_of_visit DESC;

-- SELECT *
-- FROM admissions
-- WHERE primary_diagnosis = 'Stroke'
-- AND discharge_dispostion = 'Home';

-- SELECT *
-- FROM providers
-- WHERE date_joined > '1995-12-31'
-- AND provider_speciality IN ('Pediatrics', 'Cardiology');

