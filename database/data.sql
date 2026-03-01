-- ===================== USE DATABASE =====================
USE medi_master;

-- ===================== MEDICINE =====================
INSERT INTO MEDICINE VALUES 
('Paracetamol', 'Tablet', 'None', 'Fever', 'Ibuprofen'),
('Ibuprofen', 'Tablet', 'None', 'Pain', 'Paracetamol'),
('Amoxicillin', 'Capsule', 'Doctor\'s Prescription', 'Infection', 'Azithromycin'),
('Cetirizine', 'Tablet', 'None', 'Allergy', 'Loratadine'),
('Omeprazole', 'Capsule', 'Before Meal', 'Acidity', 'Pantoprazole'),
('Loratadine', 'Tablet', 'None', 'Allergy', 'Cetirizine'),
('Azithromycin', 'Tablet', 'Doctor\'s Prescription', 'Bacterial Infection', 'Amoxicillin'),
('Pantoprazole', 'Tablet', 'Before Meal', 'GERD', 'Omeprazole'),
('Metformin', 'Tablet', 'With Food', 'Diabetes', 'Glipizide'),
('Salbutamol', 'Inhaler', 'Doctor\'s Prescription', 'Asthma', 'Levosalbutamol'),
('Glipizide', 'Tablet', 'With Food', 'Diabetes', 'Metformin'),
('Levosalbutamol', 'Inhaler', 'Doctor\'s Prescription', 'Asthma', 'Salbutamol'),
('Aspirin', 'Tablet', 'After Meal', 'Headache', 'Ibuprofen'),
('Ondansetron', 'Tablet', 'None', 'Nausea', 'Domperidone'),
('Domperidone', 'Tablet', 'Before Meal', 'Vomiting', 'Ondansetron'),
('ORS Sachets', 'Powder', 'Dissolved in Water', 'Diarrhea', 'Electral'),
('Lactulose', 'Syrup', 'Before Bed', 'Constipation', 'Isabgol'),
('Ascoril LS', 'Syrup', 'After Food', 'Cough', 'Benadryl'),
('Benadryl', 'Syrup', 'After Food', 'Cough', 'Ascoril LS'),
('Dolo 650', 'Tablet', 'None', 'Fever', 'Paracetamol'),
('Cefixime', 'Tablet', 'Doctor\'s Prescription', 'Bacterial Infection', 'Azithromycin'),
('Clonazepam', 'Tablet', 'Doctor\'s Prescription', 'Seizures', 'Phenytoin'),
('Fludrocortisone', 'Tablet', 'Doctor\'s Prescription', 'Low BP', 'Prednisolone'),
('Sertraline', 'Tablet', 'Doctor\'s Prescription', 'Depression', 'Fluoxetine'),
('Fluoxetine', 'Capsule', 'Doctor\'s Prescription', 'Depression', 'Sertraline'),
('Diazepam', 'Tablet', 'Doctor\'s Prescription', 'Anxiety', 'Hydroxyzine'),
('Levocetirizine', 'Tablet', 'None', 'Allergy', 'Cetirizine'),
('Ranitidine', 'Tablet', 'Before Meal', 'Acidity', 'Omeprazole'),
('Telmisartan', 'Tablet', 'None', 'Hypertension', 'Losartan'),
('Losartan', 'Tablet', 'None', 'Hypertension', 'Telmisartan'),
('Hydroxyzine', 'Tablet', 'None', 'Anxiety', 'Levocetirizine'),
('Amlodipine', 'Tablet', 'None', 'Blood Pressure', 'Losartan'),
('Phenytoin', 'Tablet', 'Doctor\'s Prescription', 'Seizures', 'Clonazepam');

-- ===================== SYMPTOM =====================
INSERT INTO SYMPTOM (SID, Symptom, Category) VALUES
(1, 'Fever', 'General'),
(2, 'Fatigue', 'General'),
(3, 'Chills', 'General'),
(4, 'Weight Loss', 'General'),
(5, 'Night Sweats', 'General'),
(6, 'Headache', 'Neurological'),
(7, 'Dizziness', 'Neurological'),
(8, 'Seizures', 'Neurological'),
(9, 'Confusion', 'Neurological'),
(10, 'Memory Loss', 'Neurological'),
(11, 'Cough', 'Respiratory'),
(12, 'Shortness of Breath', 'Respiratory'),
(13, 'Wheezing', 'Respiratory'),
(14, 'Chest Tightness', 'Respiratory'),
(15, 'Sore Throat', 'Respiratory'),
(16, 'Runny Nose', 'Respiratory'),
(17, 'Sneezing', 'Respiratory'),
(18, 'Nasal Congestion', 'Respiratory'),
(19, 'Chest Pain', 'Cardiovascular'),
(20, 'Palpitations', 'Cardiovascular'),
(21, 'High Blood Pressure', 'Cardiovascular'),
(22, 'Low Blood Pressure', 'Cardiovascular'),
(23, 'Swelling in Legs', 'Cardiovascular'),
(24, 'Nausea', 'Gastrointestinal'),
(25, 'Vomiting', 'Gastrointestinal'),
(26, 'Diarrhea', 'Gastrointestinal'),
(27, 'Constipation', 'Gastrointestinal'),
(28, 'Abdominal Pain', 'Gastrointestinal'),
(29, 'Bloating', 'Gastrointestinal'),
(30, 'Loss of Appetite', 'Gastrointestinal'),
(31, 'Heartburn', 'Gastrointestinal'),
(32, 'Skin Rash', 'Dermatological'),
(33, 'Itching', 'Dermatological'),
(34, 'Redness', 'Dermatological'),
(35, 'Dry Skin', 'Dermatological'),
(36, 'Swelling', 'Dermatological'),
(37, 'Joint Pain', 'Musculoskeletal'),
(38, 'Muscle Pain', 'Musculoskeletal'),
(39, 'Back Pain', 'Musculoskeletal'),
(40, 'Neck Pain', 'Musculoskeletal'),
(41, 'Shoulder Pain', 'Musculoskeletal'),
(42, 'Frequent Urination', 'Urological'),
(43, 'Painful Urination', 'Urological'),
(44, 'Blood in Urine', 'Urological'),
(45, 'Urinary Incontinence', 'Urological'),
(46, 'Difficulty Urinating', 'Urological'),
(47, 'Blurred Vision', 'Ophthalmologic'),
(48, 'Eye Pain', 'Ophthalmologic'),
(49, 'Red Eyes', 'Ophthalmologic'),
(50, 'Sensitivity to Light', 'Ophthalmologic'),
(51, 'Tearing', 'Ophthalmologic'),
(52, 'Hearing Loss', 'ENT'),
(53, 'Ear Pain', 'ENT'),
(54, 'Tinnitus', 'ENT'),
(55, 'Nasal Bleeding', 'ENT'),
(56, 'Sinus Pressure', 'ENT'),
(57, 'Depression', 'Psychiatric'),
(58, 'Anxiety', 'Psychiatric'),
(59, 'Insomnia', 'Psychiatric'),
(60, 'Mood Swings', 'Psychiatric'),
(61, 'Irritability', 'Psychiatric'),
(62, 'Sweating', 'Endocrine'),
(63, 'Hair Loss', 'Endocrine'),
(64, 'Cold Intolerance', 'Endocrine'),
(65, 'Heat Intolerance', 'Endocrine'),
(66, 'Menstrual Irregularities', 'Gynecological'),
(67, 'Pelvic Pain', 'Gynecological'),
(68, 'Vaginal Discharge', 'Gynecological'),
(69, 'Breast Pain', 'Gynecological'),
(70, 'Lump in Breast', 'Gynecological'),
(71, 'Swollen Glands', 'Immunological'),
(72, 'Frequent Infections', 'Immunological'),
(73, 'Bruising Easily', 'Hematological'),
(74, 'Bleeding Gums', 'Hematological');

-- ===================== SYMPTOM_MEDICINE_MAP =====================
INSERT INTO SYMPTOM_MEDICINE_MAP (Symptom, MNAME) VALUES
('Fever', 'Paracetamol'),
('Fever', 'Dolo 650'),
('Fatigue', 'Metformin'),
('Chills', 'Paracetamol'),
('Weight Loss', 'Metformin'),
('Night Sweats', 'Fluoxetine'),
('Headache', 'Aspirin'),
('Dizziness', 'Levocetirizine'),
('Seizures', 'Clonazepam'),
('Confusion', 'Hydroxyzine'),
('Memory Loss', 'Diazepam'),
('Cough', 'Ascoril LS'),
('Shortness of Breath', 'Salbutamol'),
('Wheezing', 'Levosalbutamol'),
('Chest Tightness', 'Salbutamol'),
('Sore Throat', 'Amoxicillin'),
('Runny Nose', 'Cetirizine'),
('Sneezing', 'Loratadine'),
('Nasal Congestion', 'Levocetirizine'),
('Chest Pain', 'Aspirin'),
('Palpitations', 'Amlodipine'),
('High Blood Pressure', 'Amlodipine'),
('Low Blood Pressure', 'Fludrocortisone'),
('Swelling in Legs', 'Telmisartan'),
('Nausea', 'Ondansetron'),
('Vomiting', 'Domperidone'),
('Diarrhea', 'ORS Sachets'),
('Constipation', 'Lactulose'),
('Abdominal Pain', 'Pantoprazole'),
('Bloating', 'Ranitidine'),
('Loss of Appetite', 'Pantoprazole'),
('Heartburn', 'Omeprazole'),
('Skin Rash', 'Cetirizine'),
('Itching', 'Levocetirizine'),
('Redness', 'Hydroxyzine'),
('Dry Skin', 'Levocetirizine'),
('Swelling', 'Hydroxyzine'),
('Joint Pain', 'Ibuprofen'),
('Muscle Pain', 'Ibuprofen'),
('Back Pain', 'Ibuprofen'),
('Neck Pain', 'Ibuprofen'),
('Shoulder Pain', 'Ibuprofen'),
('Frequent Urination', 'Glipizide'),
('Painful Urination', 'Cefixime'),
('Blood in Urine', 'Cefixime'),
('Urinary Incontinence', 'Diazepam'),
('Difficulty Urinating', 'Diazepam'),
('Blurred Vision', 'Metformin'),
('Eye Pain', 'Levocetirizine'),
('Red Eyes', 'Cetirizine'),
('Sensitivity to Light', 'Levocetirizine'),
('Tearing', 'Levocetirizine'),
('Hearing Loss', 'Amoxicillin'),
('Ear Pain', 'Amoxicillin'),
('Tinnitus', 'Hydroxyzine'),
('Nasal Bleeding', 'Loratadine'),
('Sinus Pressure', 'Cetirizine'),
('Depression', 'Sertraline'),
('Anxiety', 'Diazepam'),
('Insomnia', 'Fluoxetine'),
('Mood Swings', 'Fluoxetine'),
('Irritability', 'Hydroxyzine'),
('Sweating', 'Metformin'),
('Hair Loss', 'Levocetirizine'),
('Cold Intolerance', 'Levocetirizine'),
('Heat Intolerance', 'Levocetirizine'),
('Menstrual Irregularities', 'Metformin'),
('Pelvic Pain', 'Ibuprofen'),
('Vaginal Discharge', 'Cefixime'),
('Breast Pain', 'Ibuprofen'),
('Lump in Breast', 'Fluoxetine'),
('Swollen Glands', 'Azithromycin'),
('Frequent Infections', 'Amoxicillin'),
('Bruising Easily', 'Paracetamol'),
('Bleeding Gums', 'Paracetamol');

-- ===================== SIDE_EFFECTS =====================
INSERT INTO SIDE_EFFECTS (SIDE_EFFECT_ID, DESCRIPTION) VALUES
(1, 'Nausea'),
(2, 'Vomiting'),
(3, 'Headache'),
(4, 'Dizziness'),
(5, 'Dry Mouth'),
(6, 'Drowsiness'),
(7, 'Constipation'),
(8, 'Abdominal Pain'),
(9, 'Bloating'),
(10, 'Insomnia'),
(11, 'Nervousness'),
(12, 'Anxiety'),
(13, 'Rash'),
(14, 'Itching'),
(15, 'Swelling'),
(16, 'Loss of Appetite'),
(17, 'Weakness'),
(18, 'Heartburn'),
(19, 'Gas'),
(20, 'Indigestion'),
(21, 'Increased Thirst'),
(22, 'Frequent Urination'),
(23, 'Muscle Cramps'),
(24, 'Fatigue'),
(25, 'Sweating'),
(26, 'Flushing'),
(27, 'Blurred Vision');

-- ===================== SIDE_EFFECT_MEDICINE_MAP =====================
INSERT INTO SIDE_EFFECT_MEDICINE_MAP (SIDE_EFFECT_ID, MNAME) VALUES
(1, 'Paracetamol'),
(1, 'Amoxicillin'),
(2, 'Paracetamol'),
(2, 'Amoxicillin'),
(3, 'Paracetamol'),
(3, 'Amoxicillin'),
(4, 'Cetirizine'),
(4, 'Loratadine'),
(5, 'Cetirizine'),
(5, 'Loratadine'),
(6, 'Cetirizine'),
(6, 'Loratadine'),
(7, 'Pantoprazole'),
(7, 'Omeprazole'),
(8, 'Pantoprazole'),
(8, 'Omeprazole'),
(9, 'Pantoprazole'),
(9, 'Omeprazole'),
(10, 'Fluoxetine'),
(10, 'Sertraline'),
(11, 'Fluoxetine'),
(11, 'Sertraline'),
(12, 'Fluoxetine'),
(12, 'Sertraline'),
(13, 'Levocetirizine'),
(13, 'Hydroxyzine'),
(14, 'Levocetirizine'),
(14, 'Hydroxyzine'),
(15, 'Levocetirizine'),
(15, 'Hydroxyzine'),
(16, 'Metformin'),
(16, 'Glipizide'),
(17, 'Metformin'),
(17, 'Glipizide'),
(18, 'Ranitidine'),
(18, 'Pantoprazole'),
(19, 'Ranitidine'),
(19, 'Pantoprazole'),
(20, 'Ranitidine'),
(20, 'Pantoprazole'),
(21, 'Metformin'),
(21, 'Glipizide'),
(22, 'Metformin'),
(22, 'Glipizide'),
(23, 'Losartan'),
(23, 'Telmisartan'),
(24, 'Losartan'),
(24, 'Telmisartan'),
(25, 'Amlodipine'),
(26, 'Amlodipine'),
(27, 'Amlodipine');

-- ===================== PATIENT_LOG TABLE =====================
CREATE TABLE IF NOT EXISTS PATIENT_LOG (
    LOG_ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    LOG_TIMESTAMP DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ===================== TRIGGER: Log Patient Insert =====================
DELIMITER $$

CREATE TRIGGER before_patient_insert
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN
    INSERT INTO PATIENT_LOG (NAME) VALUES (NEW.NAME);
END$$

DELIMITER ;




-- Stored Procedure to get all medicines for a symptom
DELIMITER //

CREATE PROCEDURE GetMedicinesForSymptom(IN symptom_name VARCHAR(255))
BEGIN
    SELECT m.medicine_name, m.manufacturer, m.price
    FROM MEDICINE m
    JOIN SYMPTOM_MEDICINE_MAP smm ON m.medicine_name = smm.medicine_name
    WHERE smm.symptom_name = symptom_name;
END //

-- Function to get average price of medicines for a symptom
CREATE FUNCTION AvgMedicinePrice(symptom VARCHAR(255))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_price DECIMAL(10,2);

    SELECT AVG(m.price)
    INTO avg_price
    FROM MEDICINE m
    JOIN SYMPTOM_MEDICINE_MAP smm ON m.medicine_name = smm.medicine_name
    WHERE smm.symptom_name = symptom;

    RETURN avg_price;
END //

DELIMITER ;
