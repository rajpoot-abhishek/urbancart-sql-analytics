# UrbanCart SQL Analytics Portfolio

A comprehensive SQL portfolio project demonstrating advanced data analysis techniques through an e-commerce analytics lens. Features 40+ queries across window functions, CTEs, cohort analysis, and business metrics.

## 📊 Project Overview

**Dataset:** E-commerce platform with deliberate data quality issues (realistic scenarios)
- 408 unique customers
- 1,505 orders
- ~4,492 order items
- Messy real-world data: duplicate customers, invalid payment amounts, orphaned references

**Goal:** Build a structured SQL curriculum that progresses from basic queries to expert-level analysis

---

## ✅ Current Status

**Complete:** Parts 1-7 (40+ queries)  
**In Progress:** Parts 8-9 (Business metrics & expert stretch)  
**Last Updated:** September 2026

---

## 📚 Curriculum Breakdown

### Part 1: SQL Basics
- Schema exploration
- Basic SELECT statements
- WHERE filtering

### Part 2: Aggregation & Grouping
- COUNT, SUM, AVG aggregate functions
- GROUP BY clauses
- HAVING filters

### Part 3: JOIN Mastery
- INNER JOINs
- LEFT JOINs
- Multi-table joins

### Part 4: Data Quality & Cleaning
- Identifying duplicates
- Handling NULL values
- Standardizing messy data

### Part 5: Subqueries & CTEs
- Correlated subqueries
- Common Table Expressions (WITH clause)
- Multi-level CTEs

### Part 6: Window Functions
- **6.1** RANK — Top spenders by country
- **6.2** SUM OVER — Running totals
- **6.3** ROW_NUMBER — Order sequence
- **6.4** LAG — Month-over-month growth
- **6.5** RANK PARTITION — Top 3 products per category

### Part 7: Cohort Analysis & Retention
- **7.1** (Coming soon)
- **7.2** (Coming soon)
- **7.3** Customer retention cohort — Monthly retention %
- **7.4** Repeat purchase cycle — Avg days between 1st & 2nd order (259.70 days)

### Part 8: Business Metrics (In Progress)
- 8.1 Customer Lifetime Value (LTV), top 20
- 8.2 Average Order Value (AOV) by month, trend direction
- 8.3 Churned customers (no order in last 6 months)
- 8.4 Revenue concentration: % from top 10% of customers (Pareto)
- 8.5 Gross margin by product category

### Part 9: Expert Stretch Goals (Coming Soon)
- 9.1 Flag "at risk of churn" customers
- 9.2 Rolling 3-month average revenue
- 9.3 Payment method with highest failure rate
- 9.4 One query genuinely useful to a marketing manager

---

## 🛠 Tech Stack

- **Database:** MySQL
- **Tools:** MySQL Workbench / Command Line
- **Concepts:** Window Functions, CTEs, Cohort Analysis, Data Quality

---

## 📂 How to Use

1. **Load the schema:**
   ```bash
   mysql -u [user] -p < sql/schema.sql
   ```

2. **Explore each part:**
   Navigate to `sql/part-{N}-{topic}/` and run queries in order

3. **Study the progression:**
   Each task builds on previous concepts; reading comments explains the "why"

---

## 🎯 Key Learnings

This project covers:
- ✅ Real-world data quality issues (not sanitized data)
- ✅ Progressive difficulty (beginner → advanced)
- ✅ Business context (retention, LTV, churn)
- ✅ Query optimization thinking
- ✅ Clear, readable SQL with comments

---

## 📈 Portfolio Differentiation

Most SQL portfolios show basic queries. **UrbanCart goes deeper:**
- Cohort retention analysis (advanced thinking)
- Window function mastery (not just simple GROUP BY)
- Data quality problem-solving (real analyst work)
- Business metric calculations (what managers need)

---

## 🚀 Next Steps

- Complete Part 8 (business metrics)
- Add Part 9 (expert queries + marketing-focused insight)
- Build visualizations in Power BI (coming soon)

---

## 📝 Notes

Each SQL file includes:
- Clear comments explaining the problem
- Step-by-step CTE breakdown
- Expected output examples
- Real business context

---

## 📬 Contact

Built by **Moony** | [Instagram](https://instagram.com/moony) | [Portfolio](#)

---

**Status:** This is a living portfolio. Updates are made regularly as new parts are completed.