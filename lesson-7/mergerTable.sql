/*
  Внешнее объединение двух таблиц с условием, выводим всех пользователей и темы которые они создавали
*/
SELECT users.name, topics.topic_name
FROM users LEFT OUTER JOIN topics
ON users.id_user=topics.id_author;

/*
  Внешнее объединение двух таблиц с условием, выводим всех пользователей и темы которые они создавали
*/
SELECT users.name, topics.topic_name
FROM users RIGHT OUTER JOIN topics
ON users.id_user=topics.id_author;