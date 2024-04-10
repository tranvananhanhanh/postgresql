
SELECT * FROM public.subject WHERE credit > 5;

SELECT student_id
FROM student
INNER JOIN clazz
ON student.clazz_id = clazz.clazz_id  WHERE clazz.name='CNTT 2 K58';

SELECT student_id 
FROM student 
INNER JOIN clazz
ON student.clazz_id = clazz.clazz_id WHERE clazz.name LIKE '%CNTT%';


SELECT student_id 
FROM student 
INNER JOIN subject
ON student. = clazz.clazz_id WHERE clazz.name LIKE '%CNTT%';


--tinh hoc lai bi lap
SELECT student_id
FROM enrollment
WHERE subject_id IN (
    SELECT subject_id 
    FROM subject 
    WHERE name IN ('Tin học đại cương', 'Cơ sở dữ liệu')
);
----UNION A va B ra sv 1 hoac 2 mon hoc
(SELECT student_id
FROM enrollment
WHERE subject_id IN (
    SELECT subject_id 
    FROM subject 
    WHERE name = 'Tin học đại cương')
)
UNION
(SELECT student_id
FROM enrollment
WHERE subject_id IN (
    SELECT subject_id 
    FROM subject 
    WHERE name = 'Cơ sở dữ liệu')
);



SELECT student_id
FROM enrollment
WHERE subject_id IN (
    SELECT subject_id 
    FROM subject 
    WHERE name = 'Tin học đại cương'
)
AND student_id IN (
    SELECT student_id
    FROM enrollment
    WHERE subject_id IN (
        SELECT subject_id 
        FROM subject 
        WHERE name = 'Cơ sở dữ liệu'
    )
)
GROUP BY student_id;
--INTERSECT giua A va B ra sv chung (cho intersect o giua)


SELECT DISTINCT name
FROM subject
LEFT JOIN enrollment ON subject.subject_id = enrollment.subject_id
WHERE enrollment.subject_id IS NULL;
--7->10 chuaxong
SELECT student_id
FROM enrollment
WHERE final_score < 3 OR midterm_score < 3 OR ( midterm_score * (1 - percentage_final_exam / 100) + final_score * (percentage_final_exam / 100))< 4;





