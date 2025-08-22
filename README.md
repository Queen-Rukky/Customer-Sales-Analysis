# 📊Customer-Sales-Analysis


## Overview

The **Customer Sales Analysis Dashboard** is a data visualization project designed using **Power BI** to provide in-depth insights into customer demographics and behavior. The dashboard highlights key variables such as age, gender, annual income, family size, profession, and work experience. By visualizing these metrics, stakeholders can better understand customer patterns, segment profiles, and make data-driven decisions for targeted marketing and business strategy.

This project demonstrates skills in **data wrangling, visualization, storytelling with data**, and **dashboard design**—all crucial for data analytics roles.

---

## 📸 Dashboard Preview

![Customer Sales Dashboard](https://github.com/user-attachments/assets/2e52c1be-2fec-4662-84f5-813d33dfeb95)


---

## 🧠 Key Business Insights

- **Average Age of Customers**: 48.96 years  
- **Average Annual Income**: $110,842.66  
- **Average Family Size**: 3.77  
- **Gender Distribution**: Male customers dominate the dataset, with over 4,000 records compared to 3,000+ female records.
- **Top 3 Professions by Customer Count**:
  1. Artist
  2. Healthcare
  3. Entertainment
- **Profession with Highest Average Income**: Artists, followed by Healthcare professionals.
- **Work Experience Trends**:
  - The 10–14 year experience range shows the highest age group average.
  - 0–4 year experience group has the youngest customers.

These insights provide valuable information for targeting customer segments and allocating marketing resources effectively.

---

## 🛠️ Tools and Technologies Used

| Tool        | Purpose                          |
|-------------|----------------------------------|
| Power BI    | Data visualization and dashboard design |
| Excel / CSV | Data preprocessing and structuring |
| DAX         | Data modeling and calculated fields (if applied) |
| GitHub      | Version control and project hosting |

---

## 📂 Project Files

| File Name                                 | Description                                    |
|------------------------------------------|------------------------------------------------|
| `Screenshot 2025-05-31 235549.png`       | Snapshot of the full dashboard in Power BI    |
| *(To be added)* `.pbix` file             | Power BI project file containing visuals and data model |
| *(Optional)* `raw_data.csv`              | Sample anonymized dataset (if shareable)       |

---

## 📊 Dashboard Components

### ✅ Filters (Slicers)
- Profession
- Gender
- Work Experience (Years)

### ✅ Visual Elements
- **Pie Chart**: Gender distribution
- **Bar Chart**: Profession vs. Family Size
- **Bar Chart**: Profession vs. Annual Income
- **Line Chart**: Work Experience vs. Age
- **Bar Chart**: Profession vs. Work Experience

These visuals allow users to interactively explore and compare how different customer attributes influence sales behavior.

---

## 💡 Purpose of the Project

This dashboard was created as part of a professional development effort to:

- Demonstrate business intelligence and data storytelling capabilities
- Help non-technical stakeholders make informed decisions
- Build an interactive, exploratory tool for understanding customer segmentation

---

---

## 📌 Future Improvements

- [ ] Upload the Power BI `.pbix` file for better transparency
- [ ] Add a sample dataset or dummy version (if data is confidential)
- [ ] Include a YouTube walkthrough or GIF showing dashboard interaction
- [ ] Provide a blog post with deep dive insights and business recommendations
- [ ] Add performance measures (e.g., sales conversion rate if applicable)

---

## 💼 Use Case

This dashboard is ideal for:

- Marketing teams to identify high-value customer segments
- Executives seeking quick demographic summaries
- Data analysts looking to demonstrate Power BI skills in a portfolio

---

# 👥 Customer Analysis SQL Project
 
Welcome to the **Customer Analysis SQL Project**!

This project showcases how to clean, transform, and analyze customer behavior data using SQL. It includes practical data preparation steps such as renaming columns, removing nulls and duplicates, and uncovering insights about customer income, age, gender, and spending patterns.

## 📂 Dataset

**Main Table Used:** `data.customers`

### View All Data
```sql
SELECT * FROM data.customers;
```

## 🧹 Data Cleaning Tasks
```sql
ALTER TABLE data.customers
DROP COLUMN MyUnknownColumn_[0],
DROP COLUMN MyUnknownColumn_[1],
DROP COLUMN MyUnknownColumn_[2],
DROP COLUMN MyUnknownColumn_[3],
DROP COLUMN MyUnknownColumn_[4],
DROP COLUMN MyUnknownColumn_[5],
DROP COLUMN MyUnknownColumn_[6];

ALTER TABLE data.customers 
RENAME COLUMN `Annual Income ($)` TO Annual_Income;

ALTER TABLE data.customers 
RENAME COLUMN `Spending Score (1-100)` TO Spending_Score;

DELETE FROM data.customers WHERE Profession IS NULL;
DELETE FROM data.customers WHERE Age IS NULL OR Gender IS NULL OR Annual_Income IS NULL;

DELETE t1 FROM data.customers t1
JOIN data.customers t2 
ON t1.CustomerID > t2.CustomerID 
AND t1.Gender = t2.Gender 
AND t1.Age = t2.Age 
AND t1.Annual_Income = t2.Annual_Income 
AND t1.Spending_Score = t2.Spending_Score;
```

## 📊 Insightful SQL Analysis
```sql
SELECT CustomerID, Annual_Income, Spending_Score,
       (Annual_Income * Spending_Score) AS customer_value_index
FROM data.customers
ORDER BY customer_value_index DESC
LIMIT 5;

SELECT 
  CASE 
    WHEN Age BETWEEN 0 AND 16 THEN '0-16'
    WHEN Age BETWEEN 17 AND 25 THEN '17-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    WHEN Age BETWEEN 56 AND 65 THEN '56-65'
    WHEN Age BETWEEN 66 AND 75 THEN '66-75'
    WHEN Age BETWEEN 76 AND 85 THEN '76-85'
    ELSE '90+'
  END AS age_tier,
  AVG(Spending_Score) AS avg_spending_score
FROM data.customers
GROUP BY age_tier
ORDER BY age_tier DESC;

SELECT CustomerID, Annual_Income, Spending_Score,
       CASE 
         WHEN Annual_Income > (SELECT AVG(Annual_Income) FROM data.customers)
         AND Spending_Score < (SELECT AVG(Spending_Score) FROM data.customers)
         THEN 'High Income / Low Spending'
         ELSE 'Other'
       END AS customer_type
FROM data.customers;

SELECT Gender, AVG(Spending_Score) AS avg_spending_score 
FROM data.customers 
GROUP BY Gender;

SELECT Gender, Age, Annual_Income, Spending_Score
FROM data.customers
ORDER BY Spending_Score DESC
LIMIT 10;

SELECT CustomerID, Annual_Income, Spending_Score, Age
FROM data.customers
WHERE Age < (SELECT AVG(Age) FROM data.customers)
  AND Spending_Score > (SELECT AVG(Spending_Score) FROM data.customers)
ORDER BY Age;

SELECT CustomerID, Annual_Income, Spending_Score, Age
FROM data.customers
WHERE Age > (SELECT AVG(Age) FROM data.customers)
  AND Spending_Score > (SELECT AVG(Spending_Score) FROM data.customers)
ORDER BY Age DESC
LIMIT 10;

SELECT CustomerID, Annual_Income, Spending_Score
FROM data.customers
ORDER BY Annual_Income DESC;
```

## 👩‍💻 Author

**Rukayat Adebisi Obanor**  
Junior Data Analyst | SQL Enthusiast | Instructor  

📧 Email: bisiobanor@gmail.com  
🔗 LinkedIn: [linkedin.com/in/rukayatobanor](https://www.linkedin.com/in/rukayatobanor)  
📁 Portfolio: [datascienceportfol.io/RukayatAdebisiObanor](https://www.datascienceportfol.io/RukayatAdebisiObanor)

## 📜 License

This project is open for learning, practice, and educational use. Feel free to fork, share, or contribute.

## 📎 How to Use

1. **Clone this repository** to your local machine:
   ```bash
   git clone https://github.com/yourusername/customer-sales-dashboard.git
