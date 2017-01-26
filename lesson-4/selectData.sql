/*
  Выборка всех данных из таблицы пользователей (users)
*/
SELECT * FROM users;


/*
  Выборка определенных столбцов из таблицы пользователей (users)
*/
SELECT id_user, name FROM users;


/*
  Выборка из таблицы тем (topics) отсортированных по возрастанию
*/
SELECT * FROM topics ORDER BY topic_name;


/*
  Выборка из таблицы тем (topics) отсортированных по убыванию
*/
SELECT * FROM topics ORDER BY topic_name DESC;


/*
  Выборка из таблицы тем (topics) отсортированных по убыванию по нескольким столбцам
*/
SELECT * FROM topics ORDER BY topic_name DESC, id_author DESC;


/*
  Выборка из таблицы тем (topics) данных с условием
*/
SELECT * FROM topics WHERE id_author=4;
SELECT * FROM topics WHERE topic_name='Велосипеды';

/*
  Выборка из таблицы тем (topics) данных по образцу
*/
SELECT * FROM topics WHERE topic_name LIKE '%клуб%';
SELECT * FROM topics WHERE topic_name NOT LIKE '%клуб%';
SELECT * FROM topics WHERE topic_name LIKE '_ рыб%';