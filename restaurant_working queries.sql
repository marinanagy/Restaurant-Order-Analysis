USE restaurant_db;
select * from menu_items;
select * from order_details;
select count(distinct(item_name)) from menu_items;
select item_name,price, category  from menu_items
order by price  and category;
select count(category ) from menu_items
where category = 'Italian';
select category ,count(category ) ,avg(price) from menu_items
group by category;
select count(distinct(order_id))as number_of_orders from order_details ;
select count(distinct(item_id))as number_of_Ordereditems from order_details ;

SELECT 
    me.item_name,
    me.category,
    COUNT(ord.item_id) AS order_count
FROM order_details AS ord
JOIN menu_items AS me 
    ON me.menu_item_id = ord.item_id
GROUP BY me.item_name, me.category
ORDER BY order_count DESC;

select order_id ,count(item_id )  from order_details
group by order_id 
HAVING COUNT(item_id) > 12
order by count(item_id ) desc;

select count(*) from 
(select order_id ,count(item_id )  from order_details
group by order_id 
HAVING COUNT(item_id) > 12) as orders;

select * from order_details
left join  menu_items on menu_items.menu_item_id=order_details.item_id;

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

select * from order_details
left join  menu_items on menu_items.menu_item_id=order_details.item_id;

SELECT 
   distinct( ord.order_id),
   count(ord.order_id),
   count(order_details_id) AS total_amount_ber_order
FROM order_details AS ord
JOIN menu_items AS me 
    ON me.menu_item_id = ord.item_id
GROUP BY  ord.order_id , me.price
ORDER BY total_amount_ber_order DESC;

select ord.order_id,ord.item_id,ord.order_details_id
, me.price from order_details as ord  join menu_items as me
    ON me.menu_item_id = ord.item_id
;