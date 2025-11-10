CREATE DATABASE pizzahut;
select * from pizzahut.orders_details;
create table orders (
order_id int not null,
order_date date not null,
order_time time not null,
primary key (order_id) );

create table orders_details (
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key (order_details_id) );
select * from pizzahut.orders_details;
select * from pizzahut.pizza_types;
select * from pizzahut.orders;
select * from pizzahut.pizzas;

-- questions and answer-- 
-- 1. Retrieve the total number of orders placed.ans=21350
select count(order_id) as total_orders from orders;

-- 2.Calculate the total revenue generated from pizza sales.ans=817860.05, (round,2) is use for 2 decimal place only
SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_revenue
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id;

-- 3.Identify the highest-priced pizza.ans= |The Greek Pizza|35.95|
select pizza_types.name,pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- 4. Identify the most common pizza size ordered.
select pizzas.size,count(orders_details.quantity) as trending_size
from pizzas join orders_details
on pizzas.pizza_id=orders_details.pizza_id
group by pizzas.size order by trending_size desc limit 1;


-- 5.List the top 5 most ordered pizza types 
-- along with their quantities.
 SELECT pizza_types.name, SUM(orders_details.quantity) AS total_quantity
FROM orders_details JOIN pizzas
ON orders_details.pizza_id = pizzas.pizza_id
JOIN pizza_types 
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name ORDER BY total_quantity DESC
LIMIT 5;


-- 6.Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category,sum(orders_details.quantity )as total_quantity
from orders_details join pizzas
on pizzas.pizza_id= orders_details.pizza_id
join pizza_types
on pizza_types.pizza_type_id= pizzas.pizza_type_id
group by pizza_types.category order by total_quantity desc ;


-- 7.Determine the distribution of orders by hour of the day.
select hour (order_time), count(order_id) from orders
group by hour(order_time) ;

-- 8.Join relevant tables to find the total quantity of each pizza  categories ordered.
select sum(orders_details.quantity) as quantity_1 ,pizza_types.category
from pizzas join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details
on  orders_details.pizza_id=pizzas.pizza_id
group by pizza_types.category order by quantity_1 desc;


-- 9.Group the orders by date and calculate the average number of pizzas ordered per day.

select orders.order_date, sum(orders_details.quantity) as total_quantity
from orders join orders_details
on orders.order_id = orders_details.order_id
group by orders.order_date ;



-- Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name,SUM(orders_details.quantity * pizzas.price) AS revenue
FROM orders_details
JOIN pizzas
ON orders_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
 

-- 10. Calculate the averagev percentage contribution of each pizza type to total revenue.


WITH total_revenue_cte AS (
    SELECT SUM(pizzas.price * orders_details.quantity) AS total_revenue
    FROM orders_details
    JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
)
SELECT 
    pizza_types.name,
    SUM(pizzas.price * orders_details.quantity) AS pizza_revenue,
    (SUM(pizzas.price * orders_details.quantity) / (SELECT total_revenue FROM total_revenue_cte)) * 100 AS percentage_contribution
FROM orders_details
JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY percentage_contribution DESC;







 

