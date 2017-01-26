Шпаргалка по SQL
================

Создание баз данных и таблиц
----------------------------

### create database

Создание базы данных
После создания БД ее надо выбрать командой "use имя_базы_данных;" для дальнейшей работы с ней

```sql
create database forum;
```

### create table

Создание таблицы в базе данных

```sql
create table users (
  id_user INT(10) AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(15) NOT NULL,
  PRIMARY KEY(id_user)
);
```