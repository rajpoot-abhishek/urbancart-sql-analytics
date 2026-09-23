# UrbanCart SQL Curriculum

Complete task-by-task breakdown of all 40+ SQL queries.

---

## Part 1: SQL Basics

| Task | Description | Status |
|------|-------------|--------|
| 1.1 | Explore database schema (DESCRIBE tables, record counts) | ✅ |
| 1.2 | Write basic SELECT (all customers, all orders) | ✅ |
| 1.3 | WHERE filtering (orders from specific date range) | ✅ |

---

## Part 2: Aggregation & Grouping

| Task | Description | Status |
|------|-------------|--------|
| 2.1 | COUNT, SUM functions (total orders, total revenue) | ✅ |
| 2.2 | GROUP BY customers (orders per customer) | ✅ |
| 2.3 | HAVING clause (customers with 5+ orders) | ✅ |

---

## Part 3: JOIN Operations

| Task | Description | Status |
|------|-------------|--------|
| 3.1 | INNER JOIN (customers with their orders) | ✅ |
| 3.2 | LEFT JOIN (all customers, including those without orders) | ✅ |
| 3.3 | Multiple JOINs (orders + items + products) | ✅ |

---

## Part 4: Data Quality & Cleaning

| Task | Description | Status |
|------|-------------|--------|
| 4.1 | Identify duplicate customers | ✅ |
| 4.2 | Find NULL values in critical columns | ✅ |
| 4.3 | Standardize country names (messy data) | ✅ |

---

## Part 5: Subqueries & CTEs

| Task | Description | Status |
|------|-------------|--------|
| 5.1 | Subqueries (orders above average value) | ✅ |
| 5.2 | Common Table Expressions (WITH clause basics) | ✅ |
| 5.3 | Multiple CTEs (complex multi-step analysis) | ✅ |

---

## Part 6: Window Functions

| Task | Description | Status |
|------|-------------|--------|
| 6.1 | RANK (top spenders by country) | ✅ |
| 6.2 | SUM OVER (running totals per customer) | ✅ |
| 6.3 | ROW_NUMBER (order sequence per customer) | ✅ |
| 6.4 | LAG (month-over-month growth comparison) | ✅ |
| 6.5 | RANK PARTITION (top 3 products per category) | ✅ |

---

## Part 7: Cohort Analysis & Retention

| Task | Description | Status | Result |
|------|-------------|--------|--------|
| 7.1 | Cohort retention by signup month | 🚧 | — |
| 7.2 | Retention heatmap (months vs % retained) | 🚧 | — |
| 7.3 | Monthly retention percentage | ✅ | — |
| 7.4 | Days between 1st & 2nd order | ✅ | 259.70 days |

---

## Part 8: Business Metrics (In Progress)

| Task | Description | Status |
|------|-------------|--------|
| 8.1 | Customer Lifetime Value (LTV), top 20 customers | 🚧 |
| 8.2 | Average Order Value (AOV) by month, trend direction | 🚧 |
| 8.3 | Churned customers (no order in last 6 months) | 🚧 |
| 8.4 | Revenue concentration: % from top 10% (Pareto) | 🚧 |
| 8.5 | Gross margin by product category | 🚧 |

---

## Part 9: Expert Stretch Goals (Coming Soon)

| Task | Description | Status |
|------|-------------|--------|
| 9.1 | Flag at-risk-of-churn customers (behavioral signals) | ⏳ |
| 9.2 | Rolling 3-month average revenue (smoothing trends) | ⏳ |
| 9.3 | Payment method with highest failure rate | ⏳ |
| 9.4 | Marketing manager query (actionable insight) | ⏳ |

---

## Key Techniques Covered

- ✅ **Basic SQL:** SELECT, WHERE, ORDER BY, LIMIT
- ✅ **Aggregation:** COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
- ✅ **Joins:** INNER, LEFT, CROSS (multiple table analysis)
- ✅ **Subqueries:** Correlated, non-correlated, nested
- ✅ **CTEs:** Single and multi-level WITH clauses
- ✅ **Window Functions:** RANK, ROW_NUMBER, SUM OVER, LAG, LEAD
- ✅ **Cohort Analysis:** Customer segments by signup/activity period
- ✅ **Data Quality:** Deduplication, standardization, NULL handling
- 🚧 **Business Metrics:** LTV, AOV, churn, Pareto analysis
- ⏳ **Advanced:** At-risk detection, rolling averages, failure rates

---

## Legend

- ✅ Completed
- 🚧 In Progress
- ⏳ Coming Soon

---

**Last Updated:** September 2026