/*create table user
(user_id int(10),
 name  varchar(20) not null,
 email varchar(20) not null ,
 pwd varchar(20) not null,
 type text not null,
 primary key(user_id),
 unique(email));

create trigger trigger_name_check before insert on user
for each row
begin
if name like '^[a-zA-Z]+$' then
   insert into user(name)values('&name');
else
   set message='enter valid data';
end if;
end;

alter table user
modify column email varchar(80);

insert into user(user_id,name,email,pwd,type)values(1,'Rakesh kumar','rakeshkumar@gmail.com',12345,'buyer');

insert into user(user_id,name,email,pwd,type)values(2,'Rohit Kumar','rohitkumar@gmail.com','abcdef','invertory manager');*/

insert into user(user_id,name,email,pwd,type)values(3,'Rohan Jain','rohit.jain@outlook.com',445566,'buyer');

insert into user(user_id,name,email,pwd,type)values(4,'Monika Sharma','monikasharma@gmail.com','monika','invertory manager');

insert into user(user_id,name,email,pwd,type)values(5,'Swati Gupta','swatigupta12@gmail.com','swatigupta','buyer');
