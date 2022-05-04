/*6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные
таблицы);
* 7. представления (минимум 2);
* 8. хранимые процедуры / триггеры;*/
USE med_clinic_db;

/*Кто чаще всего обращался в клинику, в каком городе, сколько заплатил*/

SELECT p.name 'имя', count(*) 'обращений', c.city_name 'город', 
(SELECT SUM(apt.price) FROM appointment_types apt
	JOIN appointment a ON a.appointment_types_id  = apt.id 
	JOIN patients p ON a.patient_id = p.id
	WHERE a.patient_id = (SELECT a.patient_id FROM appointment a GROUP BY a.patient_id LIMIT 1)
) AS 'всего заплатил'
FROM appointment a
	JOIN patients p ON a.patient_id = p.id
	JOIN address ad ON p.address_id = ad.id
	JOIN cities c ON ad.city_id = c.id
group by patient_id 
LIMIT 1;

/*Добавим нового пользователя через процедуру и транзакцию*/

DROP PROCEDURE IF EXISTS sp_add_appointment;

DELIMITER //

CREATE PROCEDURE sp_add_appointment(patient_id INT, employee_id INT, 
									at_time DATETIME, finished BOOLEAN, appointment_types_id BIGINT UNSIGNED, 
									OUT tran_result VARCHAR(200))
BEGIN
	DECLARE tran_rollback BOOL DEFAULT 0;
	DECLARE code VARCHAR(100);
	DECLARE error_string VARCHAR(100);


	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	-- обработка ошибок
	BEGIN
		SET tran_rollback = 1;
	
		GET STACKED DIAGNOSTICS CONDITION 1
			code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
		SET tran_result = CONCAT(code, ': ', error_string);
	END;
	
	-- запускаем транзакцию добавления записи
	START TRANSACTION; 

	INSERT INTO appointment (patient_id, employee_id, at_time, finished, appointment_types_id)
	VALUES (patient_id, employee_id, at_time, finished, appointment_types_id);
		
	-- если была получена ошибка откатываем изменения
	IF tran_rollback 
	THEN 
		ROLLBACK;
	ELSE
	-- если запись добавлен, выводим ок
		SET tran_result = 'ok';
	-- успешно завершаем транзакцию
		COMMIT;
	END IF;	
END//

DELIMITER ;

-- вызываем процедуру 
CALL sp_add_appointment(1, 3, '2013-11-23 13:30:00', 0, 2, @tran_result);

SELECT * FROM appointment a ;

/*Создадим представление, в котором просматриваем, какие документы в базе лежат*/

DROP VIEW patients_docs;
CREATE VIEW patients_docs AS 
	SELECT dt.name as docs, COUNT(*) as counts FROM doc_types dt 
		JOIN docs d ON d.doc_types_id = dt.id
		GROUP BY dt.name
	ORDER BY COUNT(*) DESC;

SELECT docs FROM patients_docs;

/*Создадим представление, в котором просматриваем сотрудников*/

DROP VIEW employees_positions;
CREATE VIEW employees_positions AS 
	SELECT e.name name, p.name position_ FROM employees e 
	JOIN positions p ON e.position_id = p.id;

SELECT name, position_ FROM employees_positions;

/*Триггер с телефоном*/

DROP TRIGGER IF EXISTS check_phone_before_insert;
DELIMITER //
CREATE TRIGGER check_phone_before_insert BEFORE INSERT ON offices
FOR EACH ROW
BEGIN
	IF LENGTH(new.phone) > 6  THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Phone must be 6 numbers!';
	END IF;
END//

INSERT INTO offices (phone, address_id)
VALUES (111116, 1);

INSERT INTO offices (phone, address_id)
VALUES (1112223, 2);











