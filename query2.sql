-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id), YEAR(enrolment_date)
FROM students
GROUP BY YEAR(enrolment_date);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id),office_address 
FROM teachers
GROUP BY office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id, AVG(vote)
FROM exam_student
GROUP BY exam_id;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(id), department_id
FROM degrees
GROUP BY department_id;

-- #### Join
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*
FROM students 
	JOIN degrees
    	ON students.degree_id = degrees.id
WHERE degrees.name LIKE 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT degrees.*
FROM degrees
	JOIN departments
    	ON degrees.department_id = departments.id
WHERE departments.name LIKE 'Dipartimento di Neuroscienze'
	AND degrees.level LIKE 'magistrale';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.*
FROM courses
	JOIN course_teacher
    	ON courses.id = course_teacher.course_id
    JOIN teachers
    	ON teachers.id = course_teacher.teacher_id
WHERE teachers.name LIKE 'Fulvio'
	AND teachers.surname LIKE 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT *
FROM students
    JOIN degrees
        ON degrees.id = students.degree_id
    JOIN departments
        ON departments.id = degrees.department_id  
ORDER BY students.surname, students.name;

-- ##### BONUS
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami