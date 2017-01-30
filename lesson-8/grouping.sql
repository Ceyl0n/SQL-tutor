/*
  Количество пользователей через функцию count
*/
SELECT count(id_user) FROM users;

/*
  Группировка данных по столбцу, кол-во сообщений в каждой теме
*/
SELECT id_topic, count(id_topic)
FROM posts
GROUP BY id_topic;

/*
  Группировка данных по столбцу, кол-во сообщений в каждой теме с условием
*/
SELECT id_topic, count(id_topic)
FROM posts
GROUP BY id_topic
HAVING count(id_topic)>2;