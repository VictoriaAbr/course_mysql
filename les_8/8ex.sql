/*1. Пусть задан некоторый пользователь. 
 Из всех пользователей соц. сети найдите человека, 
 который больше всех общался с выбранным пользователем (написал ему сообщений).*/

/*Пусть у заданного пользователя id = 1*/

SELECT u.first_name, COUNT(*) FROM users u
JOIN messages m ON m.from_user_id = u.id
WHERE m.to_user_id = 1
GROUP BY u.first_name
LIMIT 1;

/*Проверка*/
SELECT id, first_name, last_name,
		(SELECT (COUNT(*)) FROM messages
		WHERE to_user_id = 1 AND from_user_id = users.id
		GROUP BY from_user_id) AS count_messages
FROM users
WHERE id IN 
	(SELECT from_user_id
	FROM messages
	WHERE to_user_id = 1
	GROUP BY from_user_id)
ORDER BY count_messages DESC
LIMIT 1;


/*2. Подсчитать общее количество лайков,
которые получили пользователи младше 10 лет.*/

SELECT SUM(counts) FROM 
(SELECT COUNT(*) counts FROM posts_likes pl
JOIN profiles p ON pl.user_id = p.user_id 
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < 10
GROUP BY pl.user_id) a;

/*Проверка*/
SELECT SUM(counts) AS all_likes FROM
	(SELECT (count(*)) AS counts FROM posts_likes
	WHERE like_type = 1 AND user_id IN 
			(SELECT profiles.user_id FROM profiles
			WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)
	GROUP BY user_id) AS A;


/*3. Определить кто больше поставил лайков (всего): мужчины или женщины.*/

SELECT 
		CASE (gender)
			WHEN 'f' THEN 'female'
		END gender, 
		COUNT(*) count_likes FROM posts_likes pl
JOIN profiles p ON pl.user_id = p.user_id 
	WHERE pl.like_type = 1
GROUP BY gender
HAVING gender != 'x'
LIMIT 1;

/*Проверка*/
SELECT (SELECT 
			CASE (gender)
				WHEN 'f' THEN 'female'
			END 
		FROM  profiles
		WHERE posts_likes.user_id = user_id) AS gender,
		COUNT(*) AS count_likes  
FROM posts_likes
WHERE like_type = 1
GROUP BY gender
HAVING gender != 'x'
LIMIT 1;



