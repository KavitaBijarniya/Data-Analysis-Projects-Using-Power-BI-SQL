# 📡 Telecom Customer Churn Analysis Dashboard
## 📌 Project Overview
This project analyzes customer churn behavior across a telecom company to identify the key factors driving customer attrition. The dashboard provides insights into churn rates by tenure, contract type, internet service, payment method, online security, and tech support usage.

The goal is to enable customer retention teams and business strategists to proactively identify at-risk customers and implement targeted interventions to reduce churn.

## 🎯 Business Objective

• Identify the overall churn rate and its financial impact on total charges

• Analyze how contract type influences customer retention and churn probability

• Evaluate the role of internet service type in churn behavior

• Understand how tenure affects the likelihood of a customer churning

• Assess whether value-added services like online security and tech support reduce churn


<img width="1334" height="789" alt="Screenshot 2026-03-06 111336" src="https://github.com/user-attachments/assets/3f3b9192-41f4-427b-b55a-71735a4980f9" />


## 📊 Key KPIs

• Total Customers → 20K

• Churned Customers → 7K

• Churn Rate → 34.22%

• Avg Tenure — Churned Customers → 34 months

• Avg Tenure — Retained Customers → 38 months

• Avg Monthly Charges — Churned → 80

• Avg Monthly Charges — Retained → 65

• Total Charges — Retained Customers → 32,289.19K

• Total Charges — Churned Customers → 18,590.39K

## 📈 Dashboard Insights
### 1️⃣ Overall Churn Overview

• 34.22% of the total 20K customers have churned — a critically high attrition rate for any telecom business

• Churned customers generated 18,590.39K in total charges vs 32,289.19K for retained customers

• Churned customers pay significantly higher monthly charges (80) compared to retained customers (65) — suggesting price sensitivity is a key churn driver

### 2️⃣ Churn Rate by Tenure

• Churn rate is highest in the very early months — exceeding 60% for customers with near-zero tenure

• The churn rate drops sharply and stabilizes between 20% and 30% after the first 20 months

• This indicates the first few months are the most critical window for customer retention interventions

• Customers who survive past 20 months show significantly stronger loyalty

### 3️⃣ Churn by Contract Type

• Month-to-month contracts have by far the highest churn rate at 43.18%

• One Year and Two Year contracts both show dramatically lower churn rates at 20.92% and 20.93% respectively

• This is a clear signal — longer contract commitments cut churn by more than half compared to flexible monthly plans

### 4️⃣ Churn by Internet Service Type

• Fiber internet customers have both the highest customer volume and the highest churn count

• DSL customers show a similar pattern but at a lower scale

• Customers with no internet service show the lowest churn — likely representing more basic, stable plan users

• Fiber customers churning at high rates despite paying premium prices suggests dissatisfaction with service quality or value

### 5️⃣ Online Security & Churn

• Customers without online security churn at a significantly higher rate than those with it

• The gap between churned (Yes) and retained (No) is clearly wider among customers lacking online security

• Bundling online security into standard plans could serve as both a value-add and a retention tool

### 6️⃣ Tech Support & Churn

• Customers who do not have tech support show much higher churn volumes compared to those who do

• Customers with tech support enabled are considerably more likely to be retained

• This strongly suggests that service support accessibility directly improves customer stickiness

### 7️⃣ Churn by Payment Method

• Churn rate is nearly identical across all payment methods — UPI (34.52%), Credit (34.18%), Debit (34.11%), Cash (34.05%)

• Payment method has virtually no influence on churn behavior

• This rules out payment friction as a churn driver and redirects focus to service quality and pricing

## 💡 Business Recommendations

• Launch an aggressive early-tenure onboarding program — with over 60% churn in the first months, the first 90 days must include proactive check-ins, tutorials, and loyalty incentives

• Incentivize month-to-month customers to upgrade to annual contracts — even a modest discount on one-year plans could cut churn from 43% down to ~21%

• Investigate Fiber service quality issues — Fiber customers are churning at the highest rate despite paying premium prices, indicating a service quality or value perception problem

• Bundle online security and tech support into base plans — both features show a strong correlation with higher retention and can be positioned as free upgrades during the critical early tenure window

• Target high monthly charge customers proactively — churned customers pay an average of 80/month vs 65 for retained ones, making them a high-value and high-risk segment worth dedicated retention campaigns

• Since payment method has no impact on churn, retention budgets should be redirected entirely toward contract upgrades, service quality improvements, and value-added features

## 🛠 Tools Used

• Power BI (Dashboard Development & Data Visualization)

• Power Query (Data Cleaning & Transformation)

• DAX — Data Analysis Expressions (Churn Rate Calculations, KPI Cards & Comparative Metrics)

• Excel / CSV (Source Data Preparation)
