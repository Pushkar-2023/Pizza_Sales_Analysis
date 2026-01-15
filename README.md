# Pizza Sales Analysis In SQL
This project analyzes pizza sales data using SQL to derive key business insights. The dataset contains details of customer orders, pizza types, sizes, quantities, and prices. The goal is to help the business understand sales performance, customer preferences, and revenue drivers.

---

## 🗂️ Database Schema

### 1️⃣ orders
| Column Name | Data Type |
|------------|-----------|
| order_id | INT (PK) |
| order_date | DATE |
| order_time | TIME |

---

### 2️⃣ orders_details
| Column Name | Data Type |
|------------|-----------|
| order_details_id | INT (PK) |
| order_id | INT (FK) |
| pizza_id | TEXT |
| quantity | INT |

---

### 3️⃣ pizzas
| Column Name | Data Type |
|------------|-----------|
| pizza_id | TEXT (PK) |
| pizza_type_id | TEXT |
| size | TEXT |
| price | DECIMAL |

---

### 4️⃣ pizza_types
| Column Name | Data Type |
|------------|-----------|
| pizza_type_id | TEXT (PK) |
| name | TEXT |
| category | TEXT |

---

## 🔍 Key Business Questions 
- 1.Retrieve the total number of orders placed.
- 2.Calculate the total revenue generated from pizza sales.
- 3.Identify the highest-priced pizza.
- 4.Identify the most common pizza size ordered.
- 5.List the top 5 most ordered pizza types along with their quantities.
- 6.Join the necessary tables to find the total quantity of each pizza category ordered.
- 7.Determine the distribution of orders by hour of the day.
- 8.Join relevant tables to find the category-wise distribution of pizzas.
- 9.Group the orders by date and calculate the average number of pizzas ordered per day.
- 10.Determine the top 3 most ordered pizza types based on revenue.
- 11.Calculate the percentage contribution of each pizza type to total revenue.
  

---

## 🧠 SQL Concepts Used

- `JOIN` (INNER JOIN)
- `GROUP BY`
- Aggregate functions (`SUM`, `COUNT`, `AVG`)
- Subqueries
- Common Table Expressions (CTE)
- Sorting & filtering (`ORDER BY`, `LIMIT`)
- Date & time functions

---

## 📊 Sample Insights

- **Total Orders:** 21,350  
- **Total Revenue:** ₹817,860.05  
- **Highest Priced Pizza:** The Greek Pizza  
- **Most Popular Size:** Large  
- **Top Revenue Pizza Types:** Classic category dominates sales  

---

## 🛠️ Tools & Technologies

- **Database:** MySQL  
- **Language:** SQL  
- **IDE:** MySQL Workbench  
- **Version Control:** Git & GitHub  

---



