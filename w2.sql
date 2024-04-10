
--11 sai
SELECT first_name, last_name
FROM student
WHERE (2024 - EXTRACT(YEAR FROM dob)) >= 25;

--12
SELECT first_name, last_name
FROM student
WHERE EXTRACT(YEAR FROM dob)= 1988;
--15
SELECT t.lecturer_id, l.first_name, t.count as num_subjects 
FROM (SELECT lecturer_id, COUNT(subject_id) FROM teaching GROUP BY lecturer_id) t JOIN lecturer l ON t.lecturer_id = l.lecturer_id 
--16
SELECT 
    subject_id
FROM teaching
GROUP BY 
    subject_id
HAVING 
    COUNT(lecturer_id) >= 2;
--18
SELECT student_id,
FROM enrollment
WHERE semester='20172' and subject_id = 'IT3080' and (midterm_score+final_score)/2 = (select max((midterm_score+final_score)/2)
                                                                                           from enrollment 
                                                                                           where semester='20172' and subject_id = 'IT3080')
--19
SELECT subject_id 
FROM (
    SELECT subject_id, COUNT(student_id) as enrollment_count
    FROM enrollment
    WHERE semester = '20172'
    GROUP BY subject_id
) AS t
WHERE enrollment_count = (SELECT MAX(enrollment_count) FROM (
    SELECT COUNT(student_id) as enrollment_count
    FROM enrollment
    WHERE semester = '20172'
    GROUP BY subject_id
) AS subquery);








