-- QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * 
FROM `courses`
WHERE `cfu` > 10;

--3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students`
WHERE YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, `date_of_birth`))) > 30;


--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * 
FROM `courses`
WHERE `period` = 'I semestre' 
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * 
FROM `exams`
WHERE HOUR(`hour`) >= 14
AND `date` = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees`
WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*) AS number_of_departments 
FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) AS teachers_without_phone 
FROM `teachers`
WHERE `phone` IS NULL;

-- QUERY CON GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) AS members_number, YEAR(`enrolment_date`) AS enrolement_year
FROM `students`
GROUP BY enrolement_year;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`, COUNT(*) AS teachers_number
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, ROUND(AVG(`vote`)) AS vote_average
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT(*) as degrees_number
FROM `degrees`
GROUP BY `department_id`;