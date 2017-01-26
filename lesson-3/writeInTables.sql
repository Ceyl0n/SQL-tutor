/*
  Заполнение таблицы пользователей ( users ) во все поля таблицы
*/
INSERT INTO users VALUES('1', 'sergey', 'sergey@mail.ru', 'pas1');


/*
  Заполнение таблицы пользователей ( users ) с указания полей таблицы
*/
INSERT INTO users(name, email, password) VALUES
  ('valera', 'valera@mail.ru', 'pas2'),
  ('katy', 'katy@mail.ru', 'pas3'),
  ('sveta', 'sveta@mail.ru', 'pas4'),
  ('oleg', 'oleg@mail.ru', 'pas5')
;


/*
  Заполнение таблицы тем ( topics ) с указания полей таблицы
*/
INSERT INTO topics(topic_name, id_author) VALUES
  ('О рыбалке', '1'),
  ('Велосипеды', '2'),
  ('Ночные клубы', '1'),
  ('О рыбалке', '4')
;


/*
  Заполнение таблицы сообщений ( posts ) с указания полей таблицы
*/
INSERT INTO posts(message, id_author, id_topic) VALUES
  ('думаю, надо сделать так', '1', '1'),
  ('согласен', '2', '4'),
  ('а еще можно сделать так', '3', '1'),
  ('согласен', '2', '1')
;