

create table types
(id int(10) auto_increment,
 name varchar(50) not null,
 primary key(id));

create table users
(id int(10),
 name text not null,
 pwd varchar(50) not null,
 email varchar(80) not null,
 phone int(10) not null,
 type_id int(10),
 primary key(id),
 unique(email),
 foreign key(type_id) REFERENCES types(id));


create table payment_statuses
	(id int(10) ,
	 name varchar(50) not null,
	 primary key(id)
		);

create table payment_modes
(id int(10) ,
 name varchar(30) not null, 
primary key(id));

create table shipping_statuses
	(id int(10) ,
	 name varchar(50) not null,
	 primary key(id)
		);

	create table coupons
(id int(10) unsigned ,
	name varchar(50) not null,
	discount_per int(10) not null,
	primary key(id)
 );


create table orders
(id int(10) ,
customer_id int(10) ,
 order_unique_id varchar(255),
 payment_mode_id int(10),
 payment_status_id int(10),
 order_date date not null,
 has_coupon tinyint(1) default 0,
 coupon_id int(10) unsigned, 
 shipping_statuses_id int(10),
 primary key(id),
 foreign key(payment_mode_id) references payment_modes(id),
 foreign key(payment_status_id) references payment_statuses(id),
 foreign key(customer_id) references users(id),
 foreign key(coupon_id)  references coupons(id),
 foreign key(shipping_statuses_id) references shipping_statuses(id));


create table colors
(id int(10),
 name varchar(30) not null,
 primary key(id));


create table products
(id int(10) ,
 supplier_id int(10),
 name varchar(20) not null,
 price int(20) not null,
 color_id int(10),
 primary key(id),
 foreign key(color_id) references colors(id),
 foreign key(supplier_id) references users(id));

create table order_product_map
(order_id int(10),
	product_id int(10),
	quantity int(5) not null,
foreign key(order_id) references orders(id),
  foreign key(product_id) references products(id));
 


create table cart(
user_id int(10) not null,
product_id int(10) not null,
foreign key(user_id)  references users(id),
foreign key(product_id) references products(id)
);

--insert


insert into types(id,name)
values(1,'buyer');

insert into types(id,name)
values(2,'inventory manager');

insert into users(id,name,phone,email,pwd,type_id)
	values(1,'Ramesh',9677543288,'ramesh@gmail.com',password('1234'),2),
	(2,'Suresh',9897543288,'suresh@gmail.com',password('4567'),1),
    (3,'Anish',96654321,'hirlekar@gmail.com',password('123456'),2),
    (4,'Niketa',12356789,'niketajain@gmail.com',password('334455'),1),
    (5,'Mona',11223344,'mona@outlook.com',password('mona'),1);

    insert into payment_statuses(id,name)values(1,'in-process');
    insert into payment_statuses(id,name)values(2,'complete');

    insert into payment_modes(id,name)values(1,'Cash'),(2,'Credit'),(3,'Debit');

    insert into shipping_statuses(id,name)values(1,'Packaging'),(2,'Dispatching'),
    	(3,'Shipping'),(4,'Arriving'),(5,'Delivered');

    	insert into coupons(id,name,discount_per)values(1,'coupon1',10),
    	(2,'coupon2',50),(3,'coupon3',35),(4,'coupon4',70),(5,'coupon5',80),(0,'no-coupon',0);

    insert into orders(id,customer_id,order_unique_id,payment_mode_id,order_date,has_coupon,coupon_id,shipping_statuses_id,payment_status_id)
    		values(1,1,111,1,'2017-01-1',0,0,1,1),(2,2,222,2,'2017-02-1',1,1,2,2),(3,3,333,3,'2016-01-11',1,5,5,1),
    		(4,4,334,1,'2018-08-11',1,5,5,2);

    	insert into colors(id,name)values(1,'RED'),(2,'BLUE'),(3,'PINK'),(4,'ORANGE'),(5,'YELLOW');



    	insert into products(id,name,supplier_id,price,color_id)
    	values(1,'jeans',1,1000,1),(2,'pyjamas',3,300,2),(3,'shirts',3,500,3),(4,'pen',3,10,1),(5,'rope',1,5,1);

insert into order_product_map
(order_id,product_id,quantity)values(1,1,10),(1,2,20),(2,2,2),(4,1,10),(4,3,1);

insert into cart
(user_id,product_id)values(1,1),(2,1),(2,2);


--view

create view product_sold 
	as
select orders.id as `orderID`,sum(products.price*order_product_map.quantity) as `total cost`,
	orders.order_date `	OrderDate`, coupons.discount_per as `Discount`,
	 payment_modes.name  as `payment method`,payment_statuses.name as `payment status`
		from orders
		left join order_product_map on orders.id = order_product_map.order_id
		left join products on order_product_map.product_id = products.id
		inner join payment_modes on orders.payment_mode_id = payment_modes.id 
		left join coupons on orders.coupon_id = coupons.id 
		inner join payment_statuses on (orders.payment_status_id = payment_statuses.id and payment_statuses.name = 'complete' )
		group by orders.id;
		
		
--generated monthly report

create view monthly_report
	as
select orders.id as `Order ID`,orders.order_date as `Order Date`,
group_concat(products.name separator ',') as `Product Name` ,
group_concat(products.price separator ',') as `cost of each product`,
sum(products.price*order_product_map.quantity) as `total cost of order`,
users.name,users.email
from orders
		left join order_product_map on orders.id = order_product_map.order_id
		left join products on order_product_map.product_id = products.id
		left join users on orders.customer_id = users.id 
		group by orders.id;

--created payments table
create table payments
(id int(10) auto_increment,
 order_id int(10),
 amount_paid int(10) not null,
 primary key(id),
 foreign key(order_id) references orders(id));

--created stored procedure
DELIMITER $$ 
CREATE PROCEDURE `order_payments_record`(IN order_id int,IN amount_paid int)
BEGIN
	insert into payments(`order_id`,`amount_paid`)values(order_id,amount_paid);
	
END$$

DELIMITER ;




START TRANSACTION;

	call order_payments_record(1,1000);
	call order_payments_record(2,2000);
	call order_payments_record(3,3000);

COMMIT;


