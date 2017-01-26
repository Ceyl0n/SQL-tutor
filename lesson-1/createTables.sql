/*
  Создание таблицы пользователей ( users )
*/
create table users (
  id_user INT(10) AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(15) NOT NULL,
  PRIMARY KEY(id_user)
);


/*
  Создание таблицы тем ( topics )
*/
create table topics (
  id_topic INT(10) AUTO_INCREMENT,
  topic_name VARCHAR(100) NOT NULL,
  id_author INT(10) NOT NULL,
  PRIMARY KEY(id_topic),
  FOREIGN KEY(id_author) REFERENCES users(id_user)
);


/*
  Создание таблицы сообщений ( posts )
*/
create table posts (
  id_post INT(10) AUTO_INCREMENT,
  message TEXT NOT NULL,
  id_author INT(10) NOT NULL,
  id_topic INT(10) NOT NULL,
  PRIMARY KEY(id_post),
  FOREIGN KEY(id_author) REFERENCES users(id_user),
  FOREIGN KEY(id_topic) REFERENCES topics(id_topic)
);

