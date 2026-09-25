USE URBANCART_DB;
#1.1
select * FROM CUSTOMERS WHERE COUNTRY IN ("IN","INDIA");
#1.2
SELECT * FROM orders WHERE YEAR(ORDER_DATE)=2024;
#1.3
SELECT *FROM PRODUCTS 
ORDER BY UNIT_PRICE DESC LIMIT 10;
#1.4
select*from customers where year(signup_date)=(select max(year(signup_date)) from customers);
#1.5
select*from orders where order_status="cancelled" or order_status = "refunded";
#2.1
-- 2.1: Standardize country names
UPDATE customers
SET country = CASE
    WHEN country IN ('usa','U.S.A','United states','Unitide states') THEN 'United States'
    WHEN country IN ('IN','india') THEN 'India'
    WHEN country IN ('Uk') THEN 'United Kingdom'
    WHEN country IN ('CA','canada') THEN 'Canada'
    ELSE country
END;
select country,count(*) as customer_counts from customers
group by country;
#2.2
select p.category,round(sum(oi.quantity*oi.unit_price_at_purchase*(1-oi.discount_pct/100)),2) as total_revenue from order_items oi
inner join products p on p.product_id=oi.Product_id
group by category;
#2.3
select round(avg(order_total),2)as order_avg_value
from(select sum(quantity*unit_price_at_purchase*(1-discount_pct/100))as order_total from order_items
group by order_id) as order_total;
#2.4
select c.customer_segment ,count(o.order_id)as total_order from orders o 
inner join customers c on c.customer_id=o.customer_id
group by customer_segment
order by total_order desc limit 1;
#2.5
select p.product_name,count(oi.product_id) as total_orders from order_items oi
inner join products p on oi.product_id=p.product_id 
group by product_name
having total_orders > 50
order by total_orders asc;
#3.1
select concat(c.first_name," ",c.last_name) as customer_name , c.email,o.* from orders o
left join customers c on o.customer_id=c.customer_id;
#3.2
select o.* ,p.payment_id from orders o
left join payments p on o.order_id=p.order_id
where p.payment_id is null;
#3.3
select oi.*,p.product_name from order_items oi
left join products p on oi.product_id=p.product_id
where p.product_id is null;
#3.4
select c.customer_id , concat(c.first_name," ",c.last_name) as customer_name,sum(p.amount) as total_spent
from customers c 
join orders o on c.customer_id=o.customer_id
join payments p on o.order_id=p.order_id
where p.payment_status = "success"
group by c.customer_id,customer_name
order by total_spent desc limit 10;
#3.5
select p.category, sum(oi.quantity) as total_quantity_sold
from order_items oi 
join products p on oi.product_id=p.product_id
group by p.category
order by total_quantity_sold desc limit 1;
#4.1(already completed in 2.1)
#4.2
select email,count(*) as counts from customers
where email is not null
group by email
having counts>1;
#4.3
select * from order_items
where quantity<0;
#4.4
select o.*,oi.order_item_id from orders o
left join order_items oi on o.order_id=oi.order_id
where order_item_id is null;
#4.5
select p.*,o.order_status from payments p  join orders o on p.order_id=o.order_id join (select oi.order_id, 
(sum(oi.quantity*oi.unit_price_at_purchase*(1-oi.discount_pct/100))+o.shipping_cost) 
as order_total
from order_items oi join orders o on oi.order_id=o.order_id
group by o.order_id) as ot on p.order_id=ot.order_id
where round(ot.order_total,2)!=round(p.amount,2)
and p.payment_status="success";
#5.1
with customer_total as(select c.customer_id,concat(c.first_name," ",c.last_name)as customer_name,
round(sum(oi.quantity*oi.unit_price_at_purchase*(1-oi.discount_pct/100)),2) as total_spent
from customers c join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id group by c.customer_id,customer_name)
select customer_id, customer_name,total_spent from customer_total
where round(total_spent,2)>(select round(avg(total_spent),2) as revenue from customer_total);
#5.2
with total_sold as (select p.product_name,sum(oi.quantity) as total_qty from products p
join order_items oi on p.product_id=oi.product_id
group by p.product_id,p.product_name),
max_quantity as(select max(total_qty)as max_sold from total_sold),
second_max as(select max(total_qty) as second_max_value from total_sold
where total_qty<(select max_sold from max_quantity))
select product_name,total_qty from total_sold
where total_qty=(select second_max_value from second_max);
#5.3
with customer_order_date as (select customer_id, min(order_date) as first_order_date,
max(order_date) as last_order_date from orders
group by customer_id)
select concat(c.first_name," ",c.last_name) as customer_name, cod.first_order_date
,cod.last_order_date from customers c join customer_order_date cod on c.customer_id=cod.customer_id;
#5.4
select c.customer_id,concat(c.first_name," ",c.last_name) as customer_name ,c.email,c.city,c.state,
c.state,c.country,c.signup_date,c.customer_segment,o.order_id from customers c left join orders o on c.customer_id=o.customer_id
where order_id is null;
#5.5
with category_avg as (select category,avg(unit_price) as avg_price from products group by category)
select p.product_id,p.product_name,p.category,p.unit_price from products p
join category_avg ca on p.category=ca.category
where p.unit_price > ca.avg_price;
#6.1
with customer_total as (select c.customer_id,c.country, concat(c.first_name," ",c.last_name) as customer_name, sum(p.amount) as total_spent
from customers c 
join orders o on c.customer_id=o.customer_id 
join payments p on o.order_id=p.order_id
where p.payment_status="success"
and o.order_status="completed"
group by c.customer_id,customer_name,c.country
order by total_spent )
select customer_id,customer_name,country,total_spent,rank() over(partition by country
order by total_spent desc) as ranks from customer_total;
#6.2
select c.customer_id, concat(c.first_name," ",c.last_name) as customer_name,p.payment_id,
sum(p.amount) over(partition by  c.customer_id order by p.payment_id) as running_total_spent
from customers c join orders o on c.customer_id=o.customer_id
join payments p on o.order_id=p.order_id
where o.order_status="completed"and p.payment_status="success"
order by c.customer_id,p.payment_id;
#6.3
select o.*,concat(c.first_name," ",c.last_name)as customer_name,
row_number () over(partition by customer_id order by o.order_date) as order_rank from orders o
join customers c on o.customer_id=c.customer_id
order by c.customer_id;
#6.4
with monthly_revenue as(select year(o.order_date)as years,
month(o.order_date) as months
,round(sum(oi.quantity*oi.unit_price_at_purchase*(1-oi.discount_pct/100)),2) as revenue
from orders o join order_items oi on o.order_id=oi.order_id
where o.order_status="completed"
group by year(o.order_date) , month(o.order_date)),
prev_month_revenue as
(select years, months,revenue,
round(lag(revenue) over(order by years,months),2) as previous_month_revenue from monthly_revenue)
select years, months,revenue,previous_month_revenue,
round((revenue-previous_month_revenue),2) as revenue_difference, 
round(((revenue-previous_month_revenue)/previous_month_revenue)*100,2) as growth_percentage
from prev_month_revenue
order by years,months;
#6.5
with revenue as
(select p.product_id,p.product_name,p.category,
round(sum(oi.quantity*oi.unit_price_at_purchase*(1-discount_pct/100)),2) as total_revenue
from products p 
join order_items oi on p.product_id=oi.product_id
group by p.product_id,p.product_name,p.category),
ranked_product as
(select product_id,product_name,category,total_revenue,
round(rank()over(partition by category order by total_revenue desc),2) as revenue_rank
from revenue)
select product_id,product_name,category,total_revenue,revenue_rank
from ranked_product
where revenue_rank<=3
order by category,revenue_rank;
#7.1
with customer_cohort as (select customer_id,min(order_date) as signup_date,
date_format(min(order_date),'%y-%m') as cohort_month
from orders
where order_status="completed"
group by customer_id),
order_in_window as ( select cc.customer_id,cc.signup_date,cc.cohort_month,count(o.order_id) as order_in_90days
from customer_cohort cc
join orders o on cc.customer_id=o.customer_id
where o.order_date between cc.signup_date and date_add(cc.signup_date,interval 90 day)
and o.order_status="completed"
group by cc.customer_id,cc.cohort_month,cc.signup_date)
select cohort_month,count(customer_id) as customer_in_cohort,
sum(order_in_90days) as total_order_in_90days,
round(avg(order_in_90days),2)as avg_order_per_customer,
min(order_in_90days) as min_order_by_any_customer,
max(order_in_90days) as max_order_by_any_customer
from order_in_window
group by cohort_month
order by cohort_month;
#7.2
select date_format(order_date,'%y-%m') as months ,count(distinct customer_id) as active_customer
from orders
where order_status="completed"
group by date_format(order_date,'%y-%m')
order by months ;
#7.3
with monthly_customer as
(select distinct date_format(order_date,'%Y-%m') as months,customer_id
from orders
where order_status="completed"),
monthly_ranked as 
(select months, customer_id,lag(months) over(partition by customer_id order by months) as prev_month
from monthly_customer),
retention_pair as
( select prev_month as month1,
months as month2, count(distinct customer_id) as retained_customer
from monthly_ranked 
where prev_month is not null
group by prev_month,months
),
month_total as 
(select months,count(distinct customer_id) as total_customer 
from monthly_customer
group by months)
select rp.month1,rp.month2,round((rp.retained_customer/mt.total_customer)*100,2) as retention_pct
from retention_pair rp join month_total mt on rp.month1=mt.months
order by month1,month2;
#7.4
with customer_orders as(select customer_id,order_date,
row_number() over(partition by customer_id order by order_date) as order_num
from orders
where order_status="completed"),
first_second_order as (select customer_id,
max(case when order_num=1 then order_date end) as first_order,
max(case when order_num=2 then order_date end) as second_order
from customer_orders
group by customer_id
having count(*)>1)
select round(avg(datediff(second_order,first_order)),2) as avg_days_between_orders
from first_second_order
where second_order is not null;