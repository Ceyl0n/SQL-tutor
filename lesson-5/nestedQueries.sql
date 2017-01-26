/*
  выборка имени из таблицы users по идентификатору автора темы
*/
SELECT name FROM users WHERE id_user IN
  (SELECT id_author FROM topics WHERE topic_name='велосипеды');


/*
  то же самое, что и в запросе выше
*/
SELECT name FROM users WHERE id_user=
  (SELECT id_author FROM topics WHERE topic_name='велосипеды');


/*
  выборка всех сообщений автора темы "вылосипеды"
*/
SELECT message FROM posts WHERE id_author IN
  (SELECT id_author FROM topics WHERE topic_name='велосипеды');


/*
  в каких темах оставлял сообщения автор темы "велосипеды"
*/
SELECT topic_name FROM topics WHERE id_topic IN
  (SELECT id_topic FROM posts WHERE id_author IN
  (SELECT id_author FROM topics WHERE topic_name='велосипеды'));