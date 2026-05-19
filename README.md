☀️ E-Commerce-Profitability-Analysis
-------------------------------------

🚀 Project Description
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

**1. Data Cleaning**
- Checked for any data quality issues (null, duplicate values)
  
- Verified that order-level costs add up correctly (product + shipping + fees = Total Costs)
  
 ✅ Result: *No data quality issues found*

**2. Business Metrics and KPI development**

- Run SQL aggregation functions (sum, AVG, Count, Case statement) to compute actionable insights that can help the BrightCard online retail store.

## Results


**1. BrightCard KPI over the past two years**

   
| total_orders | total_costs | total_revenue | total_net_revenue | total_profit | profit_margin | revenue_lost |
|--------------|-------------|---------------|-------------------|--------------|---------------|--------------|
| 2000         |$179984.54   |$ 277969.13     | $236318.37         | $56333.83     | 0.24          | $20582.45     |






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








  
**3. Profitability by product category**
 
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

**4. Profit analysis by Channel**


| Channel         | Total_orders | Total_costs | Total_net_revenue | Total_profit | Profit_margin | Revenue_lost | Return_rate | Average_order_value | Platform_fee |
|-----------------|--------------|-------------|-------------------|--------------|---------------|--------------|-------------|---------------------|--------------|
| Mobile App      | 589          | $50,500.09  | $71,893.39        | $21,393.30   | 0.3           | $5,324.17    | 7.30%       | $140.45             | 0            |
| Website         | 795          | $67,872.09  | $92,990.55        | $25,118.46   | 0.27          | $9,383.68    | 7.04%       | $139.83             | 0            |
| Social Commerce | 197          | $18,558.83  | $21,929.37        | $3,370.54    | 0.15          | $2,381.65    | 9.14%       | $134.25             | $1,944.93    |
| Marketplace     | 419          | $43,053.53  | $49,505.06        | $6,451.53    | 0.13          | $3,492.95    | 6.44%       | $137.55             | $7,949.69    |

`Top performing channel `: Mobile App, Website

`low performing channel`: Social Commerce, Marketplace

- Mobile app has the highest net profit margin (30%) despite fewer orders than Website. This indicates loyal, high-intent users. A qualified candidate for increased investment in growth focus.

- Website showed the highest profit (25k) driven by volume (795 orders); however, it also records the largest revenue lost ($9.4k)
	suggesting exposure to high returns or discounted prices.

- Marketplace is the weakest margin channel (13%), suggesting that high platform fees can erode profitability.

- Social commerce is the smallest channel by orders (197) with lower profit ($3.4). The high return rate (9%), combined with the channel fee reduce the profit margin.


**5. Marketing ROAS Analysis**


| Platform        | Total_spend | Spend_pct | Total_revenue | Revenue_pct | Total_cost_perclick | Total_cost_per_acquisition | Avg_roas |
|-----------------|-------------|-----------|---------------|-------------|---------------------|----------------------------|----------|
| TikTok Ads      | $57,229.22  | 11.37%    | $1,374,627.17 | 16.87%      | 0.16                | 3.93                       | 24.44    |
| Influencer      | $97,663.12  | 19.40%    | $2,216,974.27 | 27.21%      | 0.19                | 4.80                       | 23.45    |
| Instagram Ads   | $65,154.02  | 12.94%    | $1,024,639.06 | 12.58%      | 0.23                | 5.55                       | 16.99    |
| Google Ads      | $152,546.48 | 30.30%    | $2,194,120.82 | 26.93%      | 0.29                | 6.48                       | 13.69    |
| Facebook Ads    | $106,451.93 | 21.14%    | $1,218,572.43 | 14.96%      | 0.36                | 8.38                       | 11.25    |
| Email Marketing | $24,461.37  | 4.86%     | $117,681.45   | 1.44%       | 1.09                | 26.01                      | 5.41     |


`Top performing platform`: TikTok Ads, Influencer

`Moderate performing platform`: Instagram, Google Ads, Facebook

`Underperforming Platform`: Email Marketing

- Across all platforms, TikTok Ads is the top performer with 24x as ROAS, while the budget allowed is 11.37%.
Growth potential exists in this segment to maximize the company's profitability

-Influencer follows with 23x, meaning $23 for $1 spent with 27% as revenue contribution, suggesting a potential candidate for increased investment and growth focus.

- Email marketing is struggling with only 5.4x as ROAS due to the high total cost per acquisition ($26), which directly reduces profitability. Requires a cost audit to determine if the platform is viable long-term.

**6. Profitability analysis over the years**

- 2024

| Platform        | Year | avg_roas | avg_cpc | avg_cpa |
|-----------------|------|----------|---------|---------|                 
| Influencer      | 2024 | 22.50    | 0.17    | 4.36    |
| TikTok Ads      | 2024 | 22.28    | 0.17    | 4.57    |
| Instagram Ads   | 2024 | 19.19    | 0.20    | 4.65    |
| Google Ads      | 2024 | 15.49    | 0.30    | 5.43    |
| Facebook Ads    | 2024 | 12.57    | 0.34    | 6.95    |
| Email Marketing | 2024 | 6.05     | 0.92    | 17.94   |   

- 2025

| Platform        | Year | Avg_roas | Avg_cpc | Avg_cpa |
|-----------------|------|----------|---------|---------|
| TikTok Ads      | 2025 | 26.59    | 0.15    | 3.29    |
| Influencer      | 2025 | 24.40    | 0.20    | 5.23    |
| Instagram Ads   | 2025 | 14.79    | 0.25    | 6.44    |
| Google Ads      | 2025 | 11.89    | 0.27    | 7.53    |
| Facebook Ads    | 2025 | 9.94     | 0.38    | 9.82    |
| Email Marketing | 2025 | 4.76     | 1.27    | 34.09   |


- TikTok Ads showed the strongest growth, jumping from 22.3X ROAS in 2024 to 26.6X ROAS in 2025, signaling improved ad efficiency and audience engagement.

- Influencer marketing remained consistently strong (22.5X->24.4X), confirming it as a reliable channel.

- Facebook Ads declined from 12.6X to 9.9X due to the raise of cost per acquisition(6.9->9.8) 
highlighting inefficiency in new customer tagging.

- Email Marketing is the outlier, it ROAS dropped dramatically from 6.1 to 4.8, raising questions about list quality 
or campaign relevance.

**7. 20% cut Budget analysis**

Total Marketing spend is $503,506. A 20% cut ($100,701) will target the underperforming platforms (Email Marketing, Facebook Ads, and Google Ads) without touching TikTok, Influencer, and Instagram. The strategy focuses investment on the three highest-performing platforms while trimming spending from channels where returns are demonstrably weaker.

- Plan without budget cut
  
| platform        | Total_spend | Spend_pct | Avg_roas | Total_revenue   |
|-----------------|-------------|-----------|----------|-----------------|
| TikTok Ads      | $57,229.22  | 11.37%    | 24.44    |  $1,374,627.17  |
| Influencer      | $97,663.12  | 19.40%    | 23.45    |  $2,216,974.27  |
| Instagram Ads   | $65,154.02  | 12.94%    | 16.99    |  $1,024,639.06  |
| Google Ads      | $152,546.48 | 30.30%    | 13.69    |  $2,194,120.82  |
| Facebook Ads    | $106,451.93 | 21.14%    | 11.25    |  $1,218,572.43  |
| Email Marketing | $24,461.37  | 4.86%     | 5.41     |  $117,681.45    |
| Total           | $503,506.14 |  100%     |          |  $8,146,615.20  |


- Recommended Plan

| Platform        | Total spend | Spend pct | ROAS  | Revenue generated |
|-----------------|-------------|-----------|-------|-------------------|
| TikTok Ads      | $84,065.31  | 16.69%    | 24.44 | $2,054,170.78     |
| Influencer      | $115,403.54 | 22.92%    | 23.45 | $2,705,828.26     |
| Instagram Ads   | $77,298.22  | 15.35%    | 16.99 | $1,313,296.71     |
| Google Ads      | $122,049.92 | 24.24%    | 13.69 | $1,670,710.77     |
| Facebook Ads    | $85,152.98  | 16.91%    | 11.25 | $958,361.25       |
| Email Marketing | $19,576.32  | 3.89%     | 5.41  | $105,818.17       |
| Total           | $503,546.28 | 100%      |       | $8,808,185.94     |

- BrighCard should increase TikTok Ads spend by 5.32%, Influencer by 3.52%, and Instagram by 2.41% while 
reducing Google Ads by 6.06%, Facebook Ads by 4.32%, and Email Marketing by 0.87% to increase his revenue by 8%.

# RECOMMENDATION

- Mobile App and Website are the highest margin channels with strong conversion. Prioritise user acquisition and retention here.
  
- Audit return rates, discount policies to minimize impact on profit ( ex: Negociate shipping rate discounts with logistics partners)

- TikTok, influencers are the most profitable platforms with high ROAS. Reallocate budget from Email Marketing, Google Ads, Facebook Ads
  toward TikTok and Influencer campaigns where returns are strongest.
