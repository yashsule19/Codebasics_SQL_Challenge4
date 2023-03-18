# Codebasics_SQL_Challenge4
The following project was created for the SQL Challenge # 4 conducted by Codebasics.
- **Title**: Providing Insights to Top Level Management at Atliq Hardwares in Consumer Goods Domain.

# Introduction
## Company Background
- Atliq Hardwares (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too.

## Problem
- The management in AtliQ hardware noticed that they do not get enough insights to make quick and smart data-informed decisions

## Agenda
- AtliQ Hardware want to expand their data analytics team by adding several junior data analysts. Tony Sharma, their data analytics director wanted to hire someone who is good at both tech and soft skills.

## Decision
- Decided to conduct a SQL challenge which will help data analytics director understand both the skills.

## Challenge given
- To run SQL queries to answer 10 Ad-hoc requests for which AtliQ Hardware needs business insights. For more information click on the [Link](https://codebasics.io/challenge/codebasics-resume-project-challenge).
- Need to create a audio / video presentation to show the insights.

# About Data Tables
- 6 Tables (2 dimension tables and 4 fact tables):

| Table name and Size | Description |
| :------------------- | :------------------- |
| dim_customer - **(209 rows, 7 columns)** | Customer information |
| dim_product - **(397 rows, 6 columns)** | Product information |
| fact_pre_invoice_deductions - **(418 rows, 3 columns)** | Pre invoice deductions information for each customer |
| fact_gross_price - **(579 rows, 3 columns)** | Gross price information for each product |
| fact_manufacturing_cost - **(579 rows, 3 columns)** | Manufacturing cost information for each product |
| fact_sales_monthly - **(971631 rows, 5 columns)** | Monthly sales information |

# Tools
* **MySQL** : To perform data analysis for 10 Ad-Hoc requests by exceuting the query statements. 
* **PowerBI** : To create visualizations for the outputs obtained for 10 Ad-Hoc requests. 
* **PowerPoint** : To prepare presentation for the Top - level management to present the insights obtained by exceuting 10 Ad-Hoc requests.

# Things I Learnt
- **Consumer domain terms**: fiscal year, gross price, manufacturing cost, pre - invoice discount, gross sales, sold quantity. 
- **MySQL concepts** 
  - **Clauses**:SELECT, FROM, WHERE, ORDER BY, GROUP BY.
  - **Operators**: =, >=, <=, AND.
  - **Functions**: DISTINCT, COUNT, ROUND, RANK, OVER, PARTITION, LIMIT, DESC.
  - **Aggregate Functions**: MAX, MIN, SUM, AVG.
  - **Joins**, **CTE's (Common Table Expression)**.
- Building Visualizations and formatting them using PowerBI.
- Adding animations and video recording in PowerPoint presentation.

# Key Insights
- There are over 74 customers across there 24 markets.
- AtliQ Hardware uses 2 platforms as a source of marketing such as "Brick & Mortar" and "E–Commerce" to offer their company services or sell their products.
- AtliQ Hardware has 3 channels like "Retailers" , "Direct" and "Distributors" from which customers can buy various available AtliQ hardware products.
- Products classification: 3 divisons, 6 segments and 17 categories.
- A total of 26 Variants are available among the different products.
- **Request 1**: In Asia Pacific region, Indian market generates gross sales of 59.87 millions for Atliq Exclusive customer.
- **Request 2**: A total of 89 new products were introducted in FY 2021 which shows significant increase of 36.33% compared to FY 2020.
- **Request 3**: Among the 6 segments, Notebook has the highest number of unique products which is around 129 while Networking has only 9 products which is the lowest among all.
- **Request 4**: Among all the segments, Accessories is leading with an increase of 34 products while the least number of increased occurred in Networking. Desktop segment had a massive increase of products from 7 to 22 which is almost 3 times the number of products in fiscal year 2020.
- **Request 5**: Products with highest & lowest manufacturing cost:

| Product Code | Product Name | Segment | Variant | Manufacturing Cost |
| :----------- | :----------- | :------ | :------ | :----------------- |
| A6120110206 | AQ HOME Allin1 Gen 2 | Desktop | Plus 3 | $ 240. 53 |
| A2118150101 | AQ Master wired x1 Ms | Accessories | Standard 1 | $ 0.892 |

- **Request 6**: In FY 2021, Flipkart got a maximum average discount that was nearly 31% while Amazon got an average discount that was around 29%.
- **Request 7**: 

| Fiscal Years | Highest Gross Sale Month | Lowest Gross Sale Month |
| :----------- | :----------------------- | :---------------------- |
| 2021 | Nov - (~ 32 Million) | Aug - (~ 11 Million) |
| 2020 | Nov - (~ 15 Million) | Mar - (~ 7.7 Lakh) |

- **Request 8**: In FY 2020, out of the 4 quarters, company achieved highest sold quantities in Q1 that was around 7 million while Q3 recorded the least sold quantities which was around 2.1 million. But despite of this the company sold 5 million products in Q4.
- **Request 9**: For the fiscal year 2021, the maximum gross sales was given by Retailer channel which was as high as 1924 million that contributes almost 73% of the total gross sales.
- **Request 10**: For FY 2021, according to total sold quantities, the top 3 products in each division are as follows:
    - N & S – AQ Pen Drive 2 in 1: A Premium variant USB flash drives belonging to Storage segment with more than 7 lakh sold.
    - P & A – AQ Gamers Ms: A Standard variant mouse belonging to Accessories segment with more than 4 lakh sold.
    - PC - AQ Digit: A Standard Blue variant personal laptop belonging to Notebook segment with more than 17,000 sold.

# Credits
 - For images: 
    - [Title Slide](https://us.123rf.com/450wm/mikalaimanyshau/mikalaimanyshau1601/mikalaimanyshau160100090/50304087-modern-flat-icons-set-pc-components-computer-store-assembling-a-desktop-computer.jpg)
    - Slide 4: 
      - [Amazon](https://www.freepnglogos.com/uploads/amazon-png-logo-vector/amazon-png-logo-vector-1.png)
      - [Walmart](https://cdn.mos.cms.futurecdn.net/5StAbRHLA4ZdyzQZVivm2c.jpg)
      - [Argos](https://www.retailgazette.co.uk/wp-content/uploads/Sainsburys-launches-200-new-click-and-collect-points.png)
      - [Croma](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIS22t7_h-cgQTGEJ15X_MxLxZxwkG2hlF5fqgcLefrA&s)
      - [Ebay](https://ir.ebaystatic.com/cr/v/c1/ebay-logo-1-1200x630-margin.png)
      - [Flipkart](https://1000logos.net/wp-content/uploads/2021/02/Flipkart-logo.png)
      - [Vijay Sales](https://mir-s3-cdn-cf.behance.net/projects/404/d38d7938081961.Y3JvcCwxNDk0LDExNjksMCwxNjc.jpg)
      - [Viveks](https://media.viveks.com/media/logo/stores/1/Viveks_Logo_live.png)
    - Slide 9: [India Flag](https://www.worldometers.info/img/flags/in-flag.gif)
 - For Icons on Slide 18: https://www.flaticon.com/
 - GitHub and LinkedIn Icon: https://simpleicons.org/

# Thank You
 - I would like to thank Dhaval Patel, Hemanand Vadivel and to the entire team of Codebasics for creating such challenge that give me hands-on practice on real-life projects. Also, would like to thank them for this unique opportunity that is leading me to build my resume projects.
