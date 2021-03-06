Шпаргалка по SQL
================

### Операторы
- `WHERE` фильтрует строки
- `HAVING` фильтрует группы
- `show databases;` показать все базы данных
- `show tables;` показать таблицы в выбраной базе данных
- `use имя_базы данных;` выбираем базу данных для использования

### Создание базы данных

После создания БД ее надо выбрать командой `use имя_базы_данных;` для дальнейшей работы с ней

```sql
create database forum;
```


### Создание таблицы обычной и с внешним ключом

```sql
create table users (
  id_user INT(10) AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(15) NOT NULL,
  PRIMARY KEY(id_user)
);

-- таблица с внешним ключом
create table topics (
  id_topic INT(10) AUTO_INCREMENT,
  topic_name VARCHAR(100) NOT NULL,
  id_author INT(10) NOT NULL,
  PRIMARY KEY(id_topic),
  FOREIGN KEY(id_author) REFERENCES users(id_user)
);
```


### Заполнение таблицы данными

```sql
-- во все поля таблицы
INSERT INTO users VALUES('1', 'sergey', 'sergey@mail.ru', 'pas1');

-- с указанием полей таблицы
INSERT INTO users(name, email, password) VALUES
  ('valera', 'valera@mail.ru', 'pas2'),
  ('katy', 'katy@mail.ru', 'pas3'),
  ('sveta', 'sveta@mail.ru', 'pas4'),
  ('oleg', 'oleg@mail.ru', 'pas5')
;
```

### Выборка данных из таблицы

```sql
-- выборка всех данных из таблицы
SELECT * FROM users;

-- выборка с указанием полей данных в таблице
SELECT id_user, name FROM users;

-- выборка всех данных отсортированных по возрастанию
SELECT * FROM topics ORDER BY topic_name;

-- выборка всех данных отсортированных по убыванию
SELECT * FROM topics ORDER BY topic_name DESC;

-- выборка данных с условием
SELECT * FROM topics WHERE id_author=4;
```

**Ключевое слово `WHERE` имеет следующие условия:**
- `=` (равно) id_author=4
- `>` / `<` (больше / меньше) id_author>2
- `>=` / `<=`  (больше или равно / меньше или равно) id_author>=2
- `!=` (не равно) id_author!=1
- `IS NOT NULL` (поле не пустое) id_author IS NOT NULL
- `IS NULL` (пустое поле) id_author IS NULL
- `BETWEEN` (значения между указанными) id_author BETWEEN 1 AND 3
- `IN` (соответствуют указаным) id_author IN (1, 4)
- `NOT IN` (кроме указаных) id_author NOT IN (1, 4)
- `LIKE` (соответствие образцу) topic_name LIKE '_ рыб%' (% - любое кол-во символов, _ - 1 символ)
- `NOT LIKE` (не соответствие образцу) topic_name NOT LIKE 'вел%';


### Вложенные запросы

Подзапросы могут выбирать только один столбец, значение которого они будут возвращать внешнему запросу

```sql
SELECT message FROM posts WHERE id_author IN
  (SELECT id_author FROM topics WHERE topic_name='велосипеды');

SELECT topic_name FROM topics WHERE id_topic IN
  (SELECT id_topic FROM posts WHERE id_author IN
  (SELECT id_author FROM topics WHERE topic_name='велосипеды'));
```


### Внутренне объединение

Позволяют получить данные из нескольких таблиц и объединить их в одну. Получаем строки которые имеют связ друг с другом

```sql
SELECT topics.topic_name, users.name
FROM topics, users
WHERE topics.id_author=users.id_user;

SELECT posts.message, topics.topic_name, users.name
FROM posts, topics, users
WHERE posts.id_author=users.id_user AND posts.id_topic=topics.id_topic;
```


### Внешнее объединение

Позволяют получить данные из нескольких таблиц и объединить их в одну. Получаем все строки из одной таблицы и имеющиеся связанные  с ними из другой таблицы. Обратить внимание, что условие для объединения указывается через ключевое слово `ON`, в не `WHERE`.

```sql
SELECT users.name, topics.topic_name
FROM users LEFT OUTER JOIN topics
ON users.id_user=topics.id_author;
```

**Ключевые слова для внешнего объединения таблиц:**
- `LEFT OUTER JOIN` выбираем все строки из таблицы слева
- `RIGHT OUTER JOIN` выбираем все строки из таблицы справа
- `FULL OUTER JOIN` полное внешнее объединение


### Группировка записей и функция `COUNT()`

Обратить внимание, что условие для группировка указывается через ключевое слово `HAVING`, в не `WHERE`.

```sql
-- кол-во пользователей в таблице
SELECT count(id_user) FROM users;

SELECT id_topic, count(id_topic)
FROM posts
GROUP BY id_topic
HAVING count(id_topic)>2;
```