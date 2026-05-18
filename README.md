##☀️E-Commerce-Profitability-Analysis
-------------------------------------

#🚀 Project Description
-------------------------
BrightCart is an online retailer that sells products across eight categories through its website, mobile app, third-party marketplaces, and social commerce platforms. The company did $1M+ in gross revenue over the past two years, but net margins have been shrinking.
The CEO wants to know which product categories and sales channels are truly profitable after accounting for all costs, which marketing platforms are delivering the best return on ad spend, and whether the return rate is eroding margins.

**Key challenges in this project**

1. Evaluate profitability across product categories to identify key drivers and underperforming segments.

2. Which sales channels generate the highest profit margin?

3. How return rate affect total revenue over the analysis period?

4. Which platform delivers the best ROAS (Return on Ad Spend)

5. If the CEO wants to cut 20% of the marketing budget. Which platforms would you recommend reducing spend on?

Three Datasets have been provided: `Order-level transactions`, `Product Catalog` with cost data, and `Monthly marketing spend by platform.`


------------------------------------------------------------------------------------------------------------------------------------------
## Data Preparation and SQL Analysis

 1. **Data Cleaning**
- Checked for any data quality issues (null, duplicate values)
  
- Verified that order-level costs add up correctly (product + shipping + fees = Total Costs)
  
 ✅ Result: *No data quality issues found*

2. **Business Metrics and KPI development**

- Run SQL aggregation functions (sum, AVG, Count, Case statement) to compute actionable insights that can help the BrightCard online retail store.

## Results


**1. BrightCard KPI over the past two years**

   
| total_orders | total_costs | total_revenue | total_net_revenue | total_profit | profit_margin | revenue_lost |
|--------------|-------------|---------------|-------------------|--------------|---------------|--------------|
| 2000         |$ 179984.54   |$ 277969.13     | $236318.37         | $56333.83     | 0.24          | $20582.45     |






Brightcart's overall financial performance reflects a relatively solid position with a profit margin of approximately 24%.
However, this top-line figure alone is insufficient to draw actionable conclusions.
The critical dimension of this analysis is how profitability is distributed across product categories and sales channels.
Aggregate margins can mask significant variance at the segment level. Identifying these dynamics is essential when value is being 
created and where margin leakage is occurring.















**2. BrightCard products cost drivers structure over the past two years.**

|Product_cost|Discount_amount|Shipping_Cost|Platform_fee|Transaction_fee|Refund_amount|
|------------|---------------|-------------|------------|---------------|-------------|
|$110,933.95 |$21068.31    |$51,105.86   |$9,894.62   |$8,050.11     |$20,582.45  |

 - Brightcarts product cost is the dominant expense with 110k, followed by shipping cost ($51k), the second largest expense with 
  46% of the product cost.  
- Discount amount  (21k) is non-negligible. While attracting customers, it can compress margins, particularly in lower 
  performing category product.
- Refund amount ($20k) is closely similar to discount spend, which is a reg flag. High refunds suggest a potential issue with the product
quality, mismatched customer expectations, or fulfillment errors.








  
3. Profitability by product category
 
| Primary_category    | Return_count | Return_rate | Revenue_lost | Avg_shipping_cost | Avg_discount | Profit_margin |
|---------------------|--------------|-------------|--------------|-------------------|---------------|---------------|
| Electronics         | 23           | 8.61%       | 4078.27      | $26.74            | $14.65        | $31.13        |
| Toys                | 18           | 7%          | 2469.81      | $26.23            | $11.73        | $26.15        |
| Home & Kitchen      | 12           | 6%          | 2340.1       | $24.94            | $10.90        | $25.37        |
| Food & Beverage     | 14           | 5.67%       | 3504.56      | $26.08            | $10.98        | $24.76        |
| Sports              | 21           | 7.19%       | 2008.44      | $23.68            | $10.67        | $23.50        |
| Clothing            | 24           | 8.19%       | 3209.21      | $25.41            | $9.98         | $19.99        |
| Beauty              | 12           | 5.85%       | 865.7        | $25.23            | $8.54         | $17.39        |
| Books               | 20           | 8.37%       | 2106.36      | $26.20            | $6.11         | $11.94        |

   
`High performing Categories`: Electronics  (31.13%), Toys (26,15%), Home & Kitchen (25.15%).

`Moderate`: Food & Beverage (24.76%), Sports (23.46%).

`Low Performance`: Clothing (19.99%), Beauty (17.39%), Books (11.94%)

- Across all product categories, Electronics emerges as the strongest performing segment, posting the highest net profit margin
	(31.13%) despite carrying the largest revenue loss due to returns ($4,078.27). The high ticket price of the electronic item is strong   enough to counter the issue observed.

- Toys and Home kitchen follow closely, delivering net profit margins of 26.15% and 25.37% respectively, with notably low return rates
	(7% and 6%) suggesting strong product-market fit and customer satisfaction in this category.

- Food and Beverage and Sports perform at a mid level with margins of 24,76% and 23.5%. 

- The most concerning segments are clothing, Beauty and Books. Clothes carry the second-highest revenue losses to returns ($3.209.21)
	directly suppressing its margin to 19.99%, Beauty, while showing a low return rate (5.85%), suffers from thin margins (17.39%), pointing
	to a cost efficiency issue rather than a returns problem.

- Books represent the weakest product category with 11.94% as a margin, suggesting a limited item price compared to high fulfillment costs.







