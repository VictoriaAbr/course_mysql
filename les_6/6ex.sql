USE vk2;

/*1. Пусть задан некоторый пользователь. 
 * Из всех пользователей соц. сети найдите человека, 
 * который больше всех общался с выбранным пользователем (написал ему сообщений).*/

/*Пусть у заданного пользователя id = 11*/

SELECT id, first_name, last_name,
		(SELECT (COUNT(*)) FROM messages
		WHERE to_user_id = 11 AND from_user_id = users.id
		GROUP BY from_user_id) AS count_messages
FROM users
WHERE id IN 
	(SELECT from_user_id
	FROM messages
	WHERE to_user_id = 11
	GROUP BY from_user_id)
ORDER BY count_messages DESC
LIMIT 1;


/*2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.*/

SELECT SUM(counts) FROM
	(SELECT (count(*)) AS counts FROM posts_likes
	WHERE like_type = 1 AND user_id IN 
			(SELECT profiles.user_id FROM profiles
			WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)
	GROUP BY user_id) AS A;

/*3. Определить кто больше поставил лайков (всего): мужчины или женщины.*/

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
            