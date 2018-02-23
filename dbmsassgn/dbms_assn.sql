/*create table type
(id int(10),
 name varchar(50),
primary key(id));

create table users
(id int(10),
 name text,
 pwd varchar(50),
 email varchar(80),
 phone int(10),
 primary key(id),
 type_id int(10) REFERENCES type(id));

create table types
(id int(10),
 name varchar(50),
 primary key(id));*/

create table payments
(id int(30),
 status varchar(40),
primary key(id));





