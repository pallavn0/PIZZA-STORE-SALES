create database pizzahut;
desc orders
select * from orders
select count(*) from pizzas
select count(*) from order_details
alter table orders
modify column date date
select count(*) from orders
alter table orders
modify column time time
alter table orders
add primary key(order_id)
select count(order_id) from orders;
select * from order_details
select sum(order_details.quantity*pizzas.price) from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id;

select max(price) from pizzas

select pizza_types.category,pizzas.price from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id order by 
pizzas.price desc limit 1;

select pizza_types.name,pizzas.size,sum(order_details.quantity) as quantity from order_details join pizzas on order_details.pizza_id=
pizzas.pizza_id join pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id group by pizza_types.name, pizzas.size order by quantity desc limit 1;
desc order_details

alter table order_details
add primary key(order_details_id)

select count(*) from order_details

select count(orders.order_id),hour(orders.time) from orders group by hour(orders.time)

select avg(order_executed) from (select count(orders.order_id) as order_executed,orders.date from orders group by orders.date) as avgorders;

select pizza_types.category,round(sum(order_details.quantity*pizzas.price)/(select round(sum(order_details.quantity*pizzas.price)) as
total_sales from order_details join pizzas on pizzas.pizza_id=order_details.pizza_id)*100,2) as revenue from pizza_types join pizzas on
pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.category
order by revenue desc

select count(*) from orders

select date,sum(revenue) over(order by date) as cum_revenue from (select orders.date,sum(order_details.quantity*pizzas.price) as revenue 
from orders join order_details on orders.order_id=order_details.order_id join  pizzas on pizzas.pizza_id=order_details.pizza_id group by 
orders.date) as sales

select name,revenue from(select category,name, revenue,rank() over(partition by category order by revenue desc) as rn from
(select pizza_types.category,pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue from pizza_types join pizzas on 
pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.category,
pizza_types.name) as a) as b where rn<=3

select hour(orders.time) as hours,count(orders.order_id) as orders_executed from orders group by hours
 




desc pizzas
desc pizza_types
select count(*) from pizzas
select count(*) from pizza_types
select * from pizzas
desc pizza_types
select * from pizza_types
select * from order_details
select * from orders
select count(order_id) as total_orders  from orders
select count(*) from orders
select * from orders
select * from order_details
select * from pizzas
SELECT * FROM pizza_types

select  pizza_types.name,pizzas.price from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id order by pizzas.price
desc limit 1;

select round(sum(order_details.quantity*pizzas.price),2) as total_sales from order_details join pizzas on pizzas.pizza_id=order_details.pizza_id;

select pizzas.size , count(order_details.order_details_id) as order_count from pizzas join order_details on pizzas.pizza_id = order_details
.pizza_id group by pizzas.size order by order_count desc;

select * from order_details
select * from pizza_types
select * from pizzas

select pizza_types.name,sum(order_details.quantity) as quantity from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;

select * from pizza_types

select pizza_types.category,sum(order_details.quantity) as quantity from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.category

select count(*) from orders

select hour(time) as hour,count(order_id) as order_count from orders group by hour(time);

select category,count(name) from pizza_types group by category;

select count(*) from orders;

select round(avg(quantity),0) from 
(select orders.date,sum(order_details.quantity) as quantity from orders join order_details on orders.order_id=order_details.order_id group by orders.date)
as order_quantity;

select pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue from pizza_types join pizzas on pizza_types.pizza_type_id
=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.name order by revenue desc limit 3;

select pizza_types.category, round(sum(order_details.quantity*pizzas.price)/(select round(sum(order_details.quantity*pizzas.price),2) as total_sales
 from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id)*100,2) as revenue from pizza_types join pizzas on 
pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category order by revenue desc;

select date,sum(revenue) over(order by date) as cumulative_revenue from(select orders.date,sum(order_details.quantity*pizzas.price) as 
revenue from order_details join pizzas on order_details.pizza_id=pizzas.pizza_id join orders on orders.order_id = order_details.order_id
group by orders.date) as sales;

select name,revenue from
(select category,name,revenue,rank() over(partition by category order by revenue) as rn from
(select pizza_types.category,pizza_types.name,sum(order_details.quantity*pizzas.price) as revenue from pizza_types join pizzas on 
pizza_types.pizza_type_id=pizzas.pizza_type_id join order_details on pizzas.pizza_id=order_details.pizza_id group by pizza_types.category,
pizza_types.name) as a) as b where rn<=3;


select pizza_types.category, sum(order_details.quantity*pizzas.price) as revenue from pizza_types join pizzas on pizza_types.pizza_type_id=
pizzas.pizza_type_id join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.category order by revenue desc

select pizza_types.category as cat, count(pizza_types.category)  from pizza_types group by cat

select pizza_types.name,pizza_types.category,sum(order_details.quantity*pizzas.price) as revenue from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on pizzas.pizza_id=order_details.pizza_id group by pizza_types.name,pizza_types.category order by revenue desc limit 3

select hour(orders.time)as times,count(orders.order_id) as bills from orders group by times order by bills desc

select pizza_types.name,pizza_types.category,sum(order_details.quantity) as quant from pizza_types join pizzas on pizzas.pizza_type_id=pizza_types.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id group by pizza_types.name,pizza_types.category order by quant desc limit 5;















































































































































































































































































































































































































































































































































































































































































































































































































select * from pizzas
select * from pizza_types

select pizza_types.name , sum(order_details.quantity) as quantity from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name order by quantity desc limit 5;









