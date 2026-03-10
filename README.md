# 🍽️ Restaurant Order Analysis | SQL Project

## 📌 Project Overview
This project analyzes restaurant order data using SQL to understand customer ordering patterns and menu characteristics.

The analysis answers key business questions such as:
- What items exist on the menu?
- How many orders were made?
- Which dishes are ordered the most?
- Which orders contain many items?
- Which dishes generate the highest revenue?

---

# 📂 Dataset

The database contains two tables.

## 1️⃣ order_details

| Column | Description |
|------|-------------|
| order_details_id | Unique identifier |
| order_id | Order number |
| order_date | Date of order |
| order_time | Time of order |
| item_id | Ordered menu item |

---

## 2️⃣ menu_items

| Column | Description |
|------|-------------|
| menu_item_id | Menu item ID |
| item_name | Dish name |
| category | Food category |
| price | Dish price |

---

# 🧾 SQL Queries

## Select Database
```sql
USE restaurant_db;
```

---

## View Tables
```sql
select * from menu_items;
select * from order_details;
```

---

## Number of Items on the Menu
```sql
select count(distinct(item_name)) from menu_items;
```

---

## View Menu Items with Prices
```sql
select item_name,price, category  
from menu_items
order by price and category;
```

---

## Number of Italian Dishes
```sql
select count(category) 
from menu_items
where category = 'Italian';
```

---

## Number of Dishes and Average Price per Category
```sql
select category ,count(category), avg(price) 
from menu_items
group by category;
```

---

## Total Number of Orders
```sql
select count(distinct(order_id)) as number_of_orders 
from order_details;
```

---

## Total Ordered Items
```sql
select count(distinct(item_id)) as number_of_Ordereditems 
from order_details;
```

---

## Most Ordered Menu Items
```sql
SELECT 
    me.item_name,
    me.category,
    COUNT(ord.item_id) AS order_count
FROM order_details AS ord
JOIN menu_items AS me 
    ON me.menu_item_id = ord.item_id
GROUP BY me.item_name, me.category
ORDER BY order_count DESC;
```

---

## Orders with More Than 12 Items
```sql
select order_id ,count(item_id)  
from order_details
group by order_id 
HAVING COUNT(item_id) > 12
order by count(item_id) desc;
```

---

## Number of Orders with More Than 12 Items
```sql
select count(*) from 
(
select order_id ,count(item_id)  
from order_details
group by order_id 
HAVING COUNT(item_id) > 12
) as orders;
```

---

## Join Orders with Menu Items
```sql
select * 
from order_details
left join menu_items 
on menu_items.menu_item_id = order_details.item_id;
```

---

## Top 5 Dishes by Revenue
```sql
SELECT 
    me.item_name,
    me.category,
    COUNT(ord.item_id) AS order_count,
    COUNT(ord.item_id) * me.price AS total_amount
FROM order_details AS ord
JOIN menu_items AS me 
    ON me.menu_item_id = ord.item_id
GROUP BY me.item_name, me.category, me.price
ORDER BY total_amount DESC
limit 5;
```

---

## Orders with Highest Number of Items
```sql
SELECT 
   distinct(ord.order_id),
   count(ord.order_id),
   count(order_details_id) AS total_amount_ber_order
FROM order_details AS ord
JOIN menu_items AS me 
    ON me.menu_item_id = ord.item_id
GROUP BY ord.order_id , me.price
ORDER BY total_amount_ber_order DESC;
```

---

## Order Details with Price
```sql
select ord.order_id,
       ord.item_id,
       ord.order_details_id,
       me.price
from order_details as ord  
join menu_items as me
on me.menu_item_id = ord.item_id;
```

---

# 🛠 Skills Demonstrated

- SQL Data Exploration
- Joins
- Aggregation Functions (`COUNT`, `AVG`)
- `GROUP BY`
- `HAVING`
- Revenue Analysis
- Order Behavior Analysis

---

# 💻 Tools Used

- SQL (MySQL)
- GitHub

---

⭐ This project is part of my **Data Analyst Portfolio**, demonstrating SQL-based restaurant sales analysis.
