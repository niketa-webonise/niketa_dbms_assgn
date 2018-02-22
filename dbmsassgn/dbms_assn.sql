create table user
(user_id int(10),
 name  varchar(20) not null,
 email varchar(20) not null ,
 pwd varchar(20) not null,
 type text not null,
 primary key(user_id),
 unique(email));
