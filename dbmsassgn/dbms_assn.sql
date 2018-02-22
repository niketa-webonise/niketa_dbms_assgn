create table user
(user_id int(10),
 name  varchar(20) not null,
 emial not null unique,
 pwd varchar(20) not null,
 CONSTRAINT name check(name not in like '%[^A-Z]%'),
 CONSTRAINT password(DATALENGTH(pwd)>=8),
 type enum('buyer','invertory manager'),
 primary key(user_id));
