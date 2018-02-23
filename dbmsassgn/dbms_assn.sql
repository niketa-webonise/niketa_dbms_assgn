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
unique(email));*/









