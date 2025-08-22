SELECT * FROM data.customers;
#to drop a column
alter table data.customers drop  column MyUnknownColumn;
#to delete multiple columns
SHOW COLUMNS FROM data.customers;

ALTER TABLE data.customers
DROP COLUMN `MyUnknownColumn_[0]`,
DROP COLUMN `MyUnknownColumn_[1]`,
DROP COLUMN `MyUnknownColumn_[2]`,
DROP COLUMN `MyUnknownColumn_[3]`,
DROP COLUMN `MyUnknownColumn_[4]`,
DROP COLUMN `MyUnknownColumn_[5]`,
DROP COLUMN `MyUnknownColumn_[6]`;

show columns from data.customers;
select * from data.customers;
alter table data.customers 
#rename column  Spending (1-100) to spendingscore
ALTER table data.customers 
RENAME COLUMN `Annual Income ($)` TO Annual_Income;
ALTER TABLE data.customers
RENAME COLUMN `Spending Score (1-100)` TO spending_score;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM data.customers
WHERE Profession IS NULL;
SET SQL_SAFE_UPDATES = 1;
DELETE FROM data.customers
WHERE Age IS NULL
   OR Gender IS NULL
   OR Annual_Income IS NULL;
   
 #to handle duplicates
 DELETE t1 FROM data.customers t1
JOIN data.customers t2 
ON t1.CustomerID  > t2.CustomerID 
   AND t1.Gender = t2.Gender
   AND t1.Age = t2.Age
   AND t1.Annual_Income = t2.Annual_Income
   AND t1.Spending_Score = t2.Spending_Score;
   #to check dup
   SELECT Gender, Age, Annual_Income, Spending_Score, COUNT(*) AS count
FROM data.customers
GROUP BY Gender, Age, Annual_Income, Spending_Score
HAVING COUNT(*) > 1;
   
   select * from data.customers;
   show columns from data.customers;
   
   #analysis
  #age by gender
select age,Gender from data.customers ;
select Work Experience from data.customers ;

#Who are our most valuable customers?
select CustomerID, Annual_Income, Spending_Score ,(Annual_Income *Spending_Score )
 as customer_value_index
 from data.customers order by customer_value_index
 desc limit 5 ;
 
 #What age group spends the most?
 select 
     case 
       when Age  between  0 and 16 then"0-16"
       when Age  between 17 and 25 then "17-25"
        when Age  between  26 and 35 then"26-35"
         when Age  between  36 and 45 then"36-45"
         when Age  between  46 and 55 then"46-55"
         when Age  between  56 and 65 then"56-65"
        when Age  between  66 and 75 then"66-75"
        when Age  between  76 and 85 then"76-85"
        ELSE"90+"
   end as age_tier,
  avg(Spending_Score) as avg_spending_score
    from data.customers 
     group by age_tier
     order by age_tier desc limit 20;
     
#Where should we focus our marketing campaigns :(customer with high income and low spending)

 SELECT 
  CustomerID,
  annual_income,
  spending_score,
  CASE 
    WHEN annual_income = (SELECT AVG(annual_income) FROM data.customers)
     AND spending_score < (SELECT AVG(spending_score) FROM data.customers)
    THEN 'High Income / Low Spending'
    ELSE 'Other'
  END AS customer_type
FROM data.customers;
     
# How does gender influence spending habits?
select Gender, avg(Spending_Score) as avg_spending_score 
from data.customers group by Gender ;  

 #How can we predict customer spending behavior? 
 SELECT 
    gender,
    age,
    annual_income,
    spending_score
FROM data.customers order by spending_score desc limit 10;

#Who are the under-age high-income customers?
SELECT 
    CustomerID,
    annual_income,
    spending_score,Age
FROM data.customers
WHERE Age < (SELECT AVG(Age) FROM data.customers) 
  AND spending_score > (SELECT AVG(spending_score)
  FROM data.customers) order by Age ;

#Who are the old age high-income customers?
SELECT 
    CustomerID,
    annual_income,
    spending_score,Age
FROM data.customers
WHERE Age > (SELECT AVG(Age) FROM data.customers) 
  AND spending_score > (SELECT AVG(spending_score)
  FROM data.customers) order by Age  desc limit 10;
#What is the income distribution, and how does it relate to spending?
SELECT 
    CustomerID,
    annual_income,
    spending_score
FROM data.customers
ORDER BY annual_income DESC;


