# Hotel Booking Analytics — Exploratory Data Analysis (Python and Tableau)

![Python](https://img.shields.io/badge/Python-3.13-blue?logo=python)
![Pandas](https://img.shields.io/badge/Pandas-Data_Cleaning-lightblue)
![Seaborn](https://img.shields.io/badge/Seaborn-Visualisation-teal)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Tableau](https://img.shields.io/badge/Status-Dashboard-brightwhite)

## Overview
End-to-end EDA on 6,000 hotel bookings (2022–2024), uncovering cancellation
drivers, revenue concentration, and seasonal demand patterns to generate
actionable hospitality business recommendations.

## Key Findings
| Finding | Data Point |
|---------|-----------|
| Overall cancellation rate | 25.1% across 6,000 bookings |
| Highest-risk channel | Corporate — 26.8% cancellation rate |
| Lowest-risk channel | Offline Agent — 22.7% cancellation rate |
| Lead time vs cancellation | Identical median (90 days) — NOT a predictor |
| Revenue split | City Hotel 51.1% — volume-driven, not price-driven |
| ADR across hotel types | $204.78 (City) vs $204.96 (Resort) — near-identical |
| Average stay duration | 5.5 days (mode: 5 days) |
| Top source country | Australia |
| Seasonal pattern | Consistent across 2022, 2023, 2024 |

## Counterintuitive Finding
> The most common hospitality assumption — that longer lead time predicts
> cancellations — was **disproved** in this dataset. Median lead time was
> exactly 90 days for both canceled and checked-out guests.
> This prevented a flawed recommendation around lead-time-based policies.

## Business Recommendations
- Target Corporate channel with deposit-backed or non-refundable options
- Incentivise Offline Agent and Direct channels (lowest cancellation risk)
- Focus demand generation on Resort Hotel — not pricing (ADR is equal)
- Apply dynamic pricing in peak seasonal months (pattern validated YoY)
- Concentrate marketing on Australia and top 3 source countries

## Tech Stack
| Tool | Usage |
|------|-------|
| Python 3.13 | Core language |
| Pandas | Cleaning, feature engineering, aggregation |
| NumPy | Numerical operations, trend line fitting |
| Matplotlib | Chart formatting, tick formatters, fill-between |
| Seaborn | Statistical plots, heatmap, distribution charts |
| Jupyter Notebook | Analysis environment |


## Workflow
1. Data loading and shape/null audit
2. Cleaning — zero-imputation for counts, mode for categoricals
3. Feature engineering — Revenue, Stay Duration, is_canceled, YoY columns
4. Univariate analysis — hotel type, country, channel, room type
5. Bivariate analysis — ADR pivot, cancellation by channel, lead time test
6. Time series — weekly trend, monthly revenue, YoY comparison
7. Correlation heatmap
8. Business story with data-backed recommendations
