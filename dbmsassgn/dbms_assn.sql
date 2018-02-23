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
alter table cart add constarint fk_prod_id foreign key(product_id) references products(id);*/

alter table products add constraint fk_sup_id foreign key(supplier_id) references suppliers(id);
alter table products add constraint fk_color_pr_id foreign key(color_id) references colors(id);
alter table products add constraint fk_discount_pr_id foreign key(discount_id) references discounts(id);









