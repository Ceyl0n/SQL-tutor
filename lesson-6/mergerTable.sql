/*
  Простое объединение двух таблиц с условием
*/
SELECT topics.topic_name, users.name FROM topics, users WHERE topics.id_author=users.id_user;

/*
  Объединение трех таблиц по условию
*/
SELECT posts.message, topics.topic_name, users.name
FROM posts, topics, users
WHERE posts.id_author=users.id_user AND posts.id_topic=topics.id_topic;
