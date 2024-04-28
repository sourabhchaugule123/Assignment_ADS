use sourabh; 


create table s_dim (
s_id int primary key ,
s_name varchar(225),
loc varchar(225),
m_name varchar(225),
o_date date
); 



insert into s_dim (s_id , s_name , loc , m_name , o_date) values 
(1,"A","Kolhapur","Abc" , "2023-01-01"),
(2,"B","Kolhapur","Efg" , "2023-02-02") ;



create table product_dim ( 
p_id INT primary key , 
p_name varchar(225) ,
cate varchar(225) ,
brand varchar(225) , 
unit_price Decimal(10,2) , 
weight Decimal(10,2) 
); 
INSERT INTO product_dim (p_id, p_name, cate, brand, unit_price, weight) 
VALUES 
(1, 'Product1', 'X', 'B1', 10.99, 0.5),
(2, 'Product2', 'Y', 'B2', 20.50, 1.2),
(3, 'Product3', 'Z', 'B3', 15.75, 0.8);


create table date_dim ( 
date_id int primary key , 
date Date , 
day_w int , 
d_name varchar(25) ,
mon int , m_name varchar(25) , 
quat int , 
year int 
);      





INSERT INTO date_dim (date_id, date, day_w, d_name, mon, m_name, quat, year)
VALUES 
(1, '2024-01-01', 5, 'Friday', 1, 'January', 1, 2024),
(2, '2024-01-02', 6, 'Saturday', 1, 'January', 1, 2024),
(3, '2024-01-03', 7, 'Sunday', 1, 'January', 1, 2024);
 
 
 create table sales ( 
 t_id int primary key , 
 s_id int ,
 p_id int , 
 date_id int,
 quantity int , 
 amo Decimal(10,2) , 
 foreign key (s_id) references s_dim(s_id) , 
 foreign key (p_id) references product_dim(p_id) , 
 foreign key (date_id) references date_dim(date_id) 
 ) ; 
 
 
INSERT INTO sales (t_id, s_id, p_id, date_id, quantity, amo)
VALUES 
(1, 1, 1, 1, 5, 54.75),
(2, 2, 2, 2, 3, 61.50);

SELECT p.cate, SUM(sf.quantity) AS total
FROM sales sf
JOIN product_dim p ON sf.p_id = p.p_id
GROUP BY p.cate; 

SELECT d.m_name , SUM(sf.amo) as total_A 
FROM sales sf 
Join date_dim d 
on sf.date_id = d.date_id 
Where d.year = 2024 
Group BY d.m_name ; 
