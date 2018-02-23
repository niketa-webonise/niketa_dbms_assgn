/*

create table types
(id int(10),
 name varchar(50) not null,
 primary key(id));

create table users
(id int(10),
 name text not null,
 pwd varchar(50) not null,
 email varchar(80) not null,
 phone int(10) not null,
 primary key(id),
 unique(email),
 type_id int(10) REFERENCES type(id));

create table payments
(id int(30),
 status varchar(40) not null,
primary key(id));

create table orders
(id int(10),
 order_number varchar(80),
 payment_id int(10) references payments(id),
 price int(10) not null,
 order_date date,
 primary key(id),
 user_id int(10) references users(id));




create table colors
(id int(10),
 name varchar(30) not null,
 primary key(id));

create table discounts
(id int(10),
 type varchar(30) not null,
 primary key(id));

create table suppliers
(id int(10),
 name varchar(50) not null,
 primary key(id));

create table products
(id int(10),
 supplier_id int(10) references suppliers(id),
 price int(20) not null,
 discount_id int(10) references discounts(id),
 color_id int(10) references colors(id),
 quantity int(5) not null,
 primary key(id),
 amount int(10) not null);

create table order_details
(order_id int(10) references orders(id),
 product_id int(10) references products(id),
 price int(10),
 quantity int(5),
 total int(8),
 discount_id int(10) references discounts(id));


create table cart(
id int(10),
phone int(10) not null,
email varchar(50) not null,
user_id int(10) references users(id),
color_id int(10) references colors(id),
product_id int(10) references products(id),
primary key(id),
unique(email));

alter table users add constraint fk_type_id foreign key(type_id) references types(id);
alter table orders add constraint fk_pay_id foreign key(payment_id) references payments(id);

alter table products add constraint fk_supplier_id foreign key(supplier_id) references suppliers(id);
alter table products add constraint fk_discount_id foreign key(discount_id) references discountss(id);
alter table products add constraint fk_color_id foreign key(color_id) references colors(id);


insert into types(id,name)
values(1,'buyer');

insert into types(id,name)
values(2,'inventory manager');

alter table orders add constraint fk_user_id foreign key(user_id) references users(id);

alter table order_details add constraint fk_o_id foreign key(order_id) references orders(id);
alter table order_details add constraint fk_p_id foreign key(product_id) references products(id);
alter table order_details add constraint fk_dis_id foreign key(discount_id) references discounts(id);

alter table cart add constraint fk_us_id foreign key(user_id) references users(id);
alter table cart add constraint fk_col_id foreign key(color_id) references colors(id);
alter table cart add constarint fk_prod_id foreign key(product_id) references products(id);

alter table products add constraint fk_sup_id foreign key(supplier_id) references suppliers(id);
alter table products add constraint fk_color_pr_id foreign key(color_id) references colors(id);
alter table products add constraint fk_discount_pr_id foreign key(discount_id) references discounts(id);

alter table orders
add column quantity int(10) not null;

update users
set type_id=1 where id=1;

update users
set type_id=2 where id=2;

update users
set type_id=1 where id=3;

update users
set type_id=1 where id=4;

update users
set type_id=1 where id=5;

update users
set type_id=2 where id=6;

insert into discounts
(id,type)values(1,0.8);

insert into discounts
(id,type)values(2,0.50);

insert into discounts
(id,type)values(3,0.30);

insert into discounts
(id,type)values(4,0.40);

insert into payments(id,status)values(1,'complete');
insert into payments(id,status)values(2,'in progress');
insert into payments(id,status)values(3,'complete');
insert into payments(id,status)values(4,'complete');

insert into colors(id,name)values(1,'RED');
insert into colors(id,name)values(2,'BLUE');
insert into colors(id,name)values(3,'RED');
insert into colors(id,name)values(4,'ORANGE');

insert into suppliers(id,name)values(1,'Rakesh');
insert into suppliers(id,name)values(2,'Rahu');
insert into suppliers(id,name)values(3,'Rahul');
insert into suppliers(id,name)values(4,'Rajni');
insert into suppliers(id,name)values(5,'Anmol');

insert into cart(id,phone,email,user_id,color_id,product_id)
values(1,123456789,'j@gmail.com',1,1,1);

insert into cart(id,phone,email,user_id,color_id,product_id)
values(2,123456744,'jaw@gmail.com',2,1,1);

insert into cart(id,phone,email,user_id,color_id,product_id)
values(3,123456789,'jrg@gmail.com',1,2,2);

insert into cart(id,phone,email,user_id,color_id,product_id)
values(4,123456789,'jth@gmail.com',3,2,1);

insert into cart(id,phone,email,user_id,color_id,product_id)
values(5,123456789,'jqw@gmail.com',1,3,2);

insert into orders(id,order_number,payment_id,price,order_date,user_id,quantity)
values(1,1234,1,5000,'2017-09-1',2,30);

insert into orders(id,order_number,payment_id,price,order_date,user_id,quantity)
values(2,12122,1,15000,'2015-02-15',2,4);

insert into orders(id,order_number,payment_id,price,order_date,user_id,quantity)
values(3,111,2,6000,'2018-04-18',1,4);

insert into orders(id,order_number,payment_id,price,order_date,user_id,quantity)
values(4,1234,4,5000,'2018-01-21',4,8);

insert into orders(id,order_number,payment_id,price,order_date,user_id,quantity)
values(5,1234,1,5000,'2013-05-16',2,12);

alter table products
drop column amount;

insert into products(id,supplier_id,price,discount_id,color_id,quantity)
values(1,1,12000,1,1,20);

insert into products(id,supplier_id,price,discount_id,color_id,quantity)
values(2,2,12000,1,2,2);

insert into products(id,supplier_id,price,discount_id,color_id,quantity)
values(3,1,12000,1,3,3);

insert into products(id,supplier_id,price,discount_id,color_id,quantity)
values(4,3,12000,1,1,6);

insert into products(id,supplier_id,price,discount_id,color_id,quantity)
values(5,2,12000,1,4,40);



alter table order_details
drop column price,drop column quantity,drop column total;
*/

insert into order_details(order_id,product_id,discount_id)
values(1,2,1);

insert into order_details(order_id,product_id,discount_id)
values(2,2,1);

insert into order_details(order_id,product_id,discount_id)
values(2,1,1);


insert into order_details(order_id,product_id,discount_id)
values(3,2,1);


insert into order_details(order_id,product_id,discount_id)
values(1,4,1);



