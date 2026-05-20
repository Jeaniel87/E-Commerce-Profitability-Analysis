

Use [E-Commerce]
select* from orders

-- check for null value in orders table

select* from orders 
where 
	 order_id is null 
	or customer_id	is null 
	or order_date	is null 
	or channel	  is null 
	or payment_method	is null 
	or region	is null 
	or items_ordered is null 
	or primary_category is null 	
	or gross_revenue is null 
	or discount_pct	is null 
	or discount_amount	is null 
	or shipping_cost	is null 
	or product_cost	is null
	or platform_fee	is null 
	or transaction_fee is null	
	or returned	is null
	or refund_amount is null
	or net_revenue	is null
	or total_costs	is null
	or profit is null

	-- check null values in marketing_spend Table

select 
	count(*) - count([month]) as null_month,
	count(*) - count ([platform]) as null_platform,
	count(*) - count (spend) as null_spend,
	count(*) - count(impressions) as null_impressions,
	count(*) - count(clicks) as null_clicks,
	count(*) - count(conversions) as null_conversions,
	count(*) - count(revenue_attributed) as null_revenue,
	count(*) - count(cpc) as null_cpc,
	count(*) - count (cpa) as null_cpa,
	count(*) - count (roas) as null_roas
from marketing_spend


--- check nulls values in Product table

select 
	count(*) - count(product_id) as product_null,
	count(*) - count(product_name) as name_null,
	count(*) - count(category) as category_null,
	count(*) - count(sub_category) as sub_null,
	count(*) - count (unit_cost) as unit_cost,
	count (*) - count (selling_price) as sell_null,
	count (*) - count (shipping_cost_per_unit) as ship_null,
	count (*) - count(weight_lbs) as lbs_null,
	count(*) - count (supplier)
from products

-- check for any duplicate value

SELECT
    order_id,
    COUNT(*) AS occurrence_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;


SELECT
    product_id,
    COUNT(*) AS occurrence_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;


select 
count(*),
[month], 
[platform], 
spend , 
impressions, 
clicks, 
conversions, 
revenue_attributed,
cpc,
cpa,
roas
from marketing_spend
group by [month], [platform], spend , impressions, clicks, conversions, revenue_attributed,cpc,cpa,roas
having count(*)>1


-- check for null value in orders table

select* from orders 
where 
	 order_id is null 
	or customer_id	is null 
	or order_date	is null 
	or channel	  is null 
	or payment_method	is null 
	or region	is null 
	or items_ordered is null 
	or primary_category is null 	
	or gross_revenue is null 
	or discount_pct	is null 
	or discount_amount	is null 
	or shipping_cost	is null 
	or product_cost	is null
	or platform_fee	is null 
	or transaction_fee is null	
	or returned	is null
	or refund_amount is null
	or net_revenue	is null
	or total_costs	is null
	or profit is null

	-- check null values in marketing_spend Table

select 
	count(*) - count([month]) as null_month,
	count(*) - count ([platform]) as null_platform,
	count(*) - count (spend) as null_spend,
	count(*) - count(impressions) as null_impressions,
	count(*) - count(clicks) as null_clicks,
	count(*) - count(conversions) as null_conversions,
	count(*) - count(revenue_attributed) as null_revenue,
	count(*) - count(cpc) as null_cpc,
	count(*) - count (cpa) as null_cpa,
	count(*) - count (roas) as null_roas
from marketing_spend


--- check nulls values in Product table

select 
	count(*) - count(product_id) as product_null,
	count(*) - count(product_name) as name_null,
	count(*) - count(category) as category_null,
	count(*) - count(sub_category) as sub_null,
	count(*) - count (unit_cost) as unit_cost,
	count (*) - count (selling_price) as sell_null,
	count (*) - count (shipping_cost_per_unit) as ship_null,
	count (*) - count(weight_lbs) as lbs_null,
	count(*) - count (supplier)
from products

-- check for any duplicate value

SELECT
    order_id,
    COUNT(*) AS occurrence_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;


SELECT
    product_id,
    COUNT(*) AS occurrence_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;


select 
count(*),
[month], 
[platform], 
spend , 
impressions, 
clicks, 
conversions, 
revenue_attributed,
cpc,
cpa,
roas
from marketing_spend
group by [month], [platform], spend , impressions, clicks, conversions, revenue_attributed,cpc,cpa,roas
having count(*)>1

--- Verify order level costs add up correctly
select 
*,
round (total_costs,2) - round(( shipping_cost+ product_cost+ platform_fee+transaction_fee),2) as diffcalc
from orders
where round (total_costs,2) - round(( shipping_cost+ product_cost+ platform_fee+transaction_fee),2) <> 0

/** BrightCard KPI over the past two years */

select 
	count(order_id) as total_orders,
	sum (total_costs) as total_costs,
	sum (gross_revenue) as total_revenue,
	sum (net_revenue) as total_net_revenue,
	sum (profit) as total_profit,
	round (cast (sum (profit) /sum (nullif (net_revenue,0)) as float),2) as profit_margin,
	sum(case when returned ='Yes' then 1 else 0 end) as return_count, 
	sum (refund_amount) as revenue_lost	
from orders

/* BrightCard products cost drivers structure analysis */

select 
sum(product_cost) as Product_cost,
sum(discount_amount) as Discount_amount,
sum(shipping_cost) as Shipping_cost,
sum(platform_fee) as Platform_fee,
sum(transaction_fee) as Transaction_fee,
sum(refund_amount) as Refund_amount
from orders

/*** Performance by product category ***/

select
	primary_category,
	sum (gross_revenue) as total_gross_revenue,
	sum (total_costs)  as total_cost,
	sum (net_revenue) as total_net_revenue,
	sum (profit) as total_profit,
	round(cast(sum (profit)*100 /sum (nullif (net_revenue,0)) as float),2) as profit_margin
from orders
group by primary_category 
order by profit_margin desc

select 
    primary_category, 
	sum(case when returned ='Yes' then 1 else 0 end) as return_count,
    concat(round(cast(sum(case when returned ='Yes' then 1 else 0 end) * 100.0 / count(*) as float),2),'%') as return_rate,
	sum (refund_amount) as revenue_lost,
	avg(shipping_cost) as avg_shipping_cost,
	avg(discount_amount) as avg_discounts,
	round(cast(sum (profit)*100 /sum (nullif (net_revenue,0)) as float),2) as profit_margin
	from orders
	group by primary_category
	order by profit_margin desc

 /*** Channel analysis ***/

 select 
	channel,
	count(order_id) as total_orders,
	sum (total_costs) as total_costs,
	sum (net_revenue) as total_net_revenue,
	sum (profit) as total_profit,
	round (cast(sum (profit) /sum (nullif (net_revenue,0)) as float),2) as profit_margin,
	sum (refund_amount) as revenue_lost,
	concat(round(cast(sum(case when returned ='Yes' then 1 else 0 end) * 100.0 / count(*) as float),2),'%') as return_rate,
	round (cast(sum(gross_revenue)/ count(*) as float),2) as average_order_value,
	sum(platform_fee) as platform_fee
    from orders
	group by channel
	order by profit_margin desc

/** Marketing ROAS analysis **/
/* ROAS analysis by platform */

select 
[platform],
sum(spend) as Total_spend,
concat(round(cast(sum(spend)*100 as float)/sum(sum(spend)) over(),2), '%') as Spend_pct,
sum(revenue_attributed) as Total_revenue,
concat(round(cast(sum(revenue_attributed)*100 as float)/sum(sum(revenue_attributed)) over(),2), '%') as Revenue_pct,
avg(cpc) as Total_cost_perclick,
avg(cpa) as Total_cost_peracquisition,
avg(roas) as Avg_roas
from Marketing_spend
group by [platform]
order by avg_roas desc

/* ROAS analysis over the past two years*/

select 
[platform],
year(convert(Date , [month] + '-01' , 23)) as [Year],
avg(roas) as avg_roas,
avg(cpc) as avg_cpc,
avg(cpa) as avg_cpa
from marketing_spend
group by [platform] , year(convert(Date , [month] + '-01' , 23))
order by year(convert(Date , [month] + '-01' , 23)) asc, avg_roas desc

