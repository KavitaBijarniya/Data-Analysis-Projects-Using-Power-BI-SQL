# 📊 Customer Shopping Behavior Analysis
 
## 🔍 Project Overview
 
This project analyzes customer shopping behavior using transactional data to uncover insights that drive revenue growth, customer retention, and strategic decision-making.
 
The analysis combines Python (data processing), SQL (business queries), and Power BI (visualization) to deliver a complete end-to-end data analytics solution.
 
---
 
## 🎯 Business Problem
 
A retail company wants to understand how different factors influence customer purchasing behavior, including:
 
- Demographics (age, gender)
- Product categories
- Discounts and reviews
- Subscription behavior
- Payment and shipping preferences
The goal is to identify key drivers of sales and repeat purchases.
 
---
 
## 📁 Dataset Summary
 
- **Total Records:** 3,900
- **Features:** 18 columns
- **Categories:** 4 product categories
**Key Features:**
 
| Group | Columns |
|-------|---------|
| Customer | Age, Gender, Location, Subscription Status |
| Purchase | Item, Category, Amount, Season |
| Behavior | Discount Applied, Review Rating, Shipping Type |
| Engineered | Age Group, Purchase Frequency |
 
**Data Quality:**
- 37 missing values in `review_rating` handled using median imputation
---
 
## ⚙️ Tech Stack
 
| Tool | Purpose |
|------|---------|
| **Python** | Data cleaning & preprocessing |
| **SQL (PostgreSQL)** | Business analysis |
| **Power BI** | Dashboard & visualization |
 
---
 
## 🧹 Data Preparation (Python)
 
- Data loading using `pandas`
- Missing value treatment (median imputation)
- Column standardization (`snake_case`)
- Feature engineering:
  - `age_group`
  - `purchase_frequency_days`
- Removed redundant fields (`promo_code_used`)
- Exported cleaned dataset to SQL database
---
 
## 🧠 SQL Business Analysis
 
**Key Questions Answered:**
 
1. Revenue comparison by gender
2. High-spending customers using discounts
3. Top 5 products by average rating
4. Purchase behavior by shipping type
5. Subscriber vs non-subscriber analysis
6. Discount-heavy products
7. Customer segmentation (New, Returning, Loyal)
8. Top products per category
9. Repeat buyers vs subscription trend
10. Revenue contribution by age group
---
 
## 📊 Key Insights
 
- 👥 **Male customers** generate ~2× more revenue than female customers
- 💰 **Young Adults** are the highest revenue contributors (~$62K)
- 🧾 **73% customers are non-subscribers** → strong growth opportunity
- 🏷️ **Discounts do not reduce spending** — many high spenders use them
- 🛍️ **Clothing** is the top-performing category (~$104K revenue)
- 🚚 **Express shipping users** show higher purchase behavior
- ⭐ **Top-rated products:** Gloves, Sandals, Boots
---
 
## 📈 Dashboard (Power BI)

<img width="1368" height="800" alt="image" src="https://github.com/user-attachments/assets/b6765bfa-0352-4245-b795-ffc810753175" />


The interactive dashboard provides insights on:
 
- Customer distribution
- Revenue trends by season
- Payment method preferences
- Geographic sales distribution
- Customer segments
- Category performance
**📌 Key Metrics:**
 
| Metric | Value |
|--------|-------|
| Total Customers | 3.9K |
| Avg Purchase | $59.76 |
| Avg Rating | 3.75 |
 
---
 
## 💡 Business Recommendations
 
| # | Recommendation | Action |
|---|---------------|--------|
| 🚀 | **Increase Subscriptions** | Convert non-subscribers with exclusive benefits |
| 🎯 | **Strengthen Loyalty Programs** | Reward returning customers to improve retention |
| 💸 | **Optimize Discount Strategy** | Focus on high-impact products |
| 📦 | **Promote Top Products** | Highlight high-rated & high-selling items |
| 👤 | **Target High-Value Segments** | Focus on Young Adults and repeat buyers |
 
---
 
## 📌 Key Takeaways
 
- Revenue is driven by specific customer segments
- Discounts can increase conversions without hurting revenue
- Customer retention is as important as acquisition
- Data-driven decisions can significantly improve business outcomes
