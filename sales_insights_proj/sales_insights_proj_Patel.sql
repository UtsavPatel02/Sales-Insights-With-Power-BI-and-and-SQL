#How many transactions
select count(*) from sales.transactions ;

#Analyzing database and all tables
#How many customers
select count(*) from sales.customers ;

#All Recorded Dates
select count(*) from sales.date ;

#How many transactions
select count(*) from sales.transactions ;

#How many different markets
select count(*) from sales.markets;

#How many different product codes
select count(*) from sales.transactions ;



-- 2020 metrics
##All sales in 2020
select sales.transactions.*, sales.date.* from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date where year = 2020;


##total Revenue in 2020 (interested in most current year in dataset)
select sum(sales.transactions.sales_amount) from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date where year = 2020;

##total transactions in 2020
select sum(sales.transactions.sales_qty) from sales.transactions inner join sales.date on sales.transactions.order_date = sales.date.date where year = 2020;


#Total sales by market_code region 
SELECT sales.transactions.market_code, SUM(sales.transactions.sales_amount) AS total_sales_amount
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = 2020
GROUP BY sales.transactions.market_code 
ORDER BY market_code ASC;  


-- Calculating totals and averages in different time frames

##Monthly
SELECT
    EXTRACT(YEAR FROM sales.date.date) AS sales_year,
    EXTRACT(MONTH FROM sales.date.date) AS sales_month,
    SUM(sales.transactions.sales_amount) AS total_sales,
    AVG(sales.transactions.sales_amount) AS average_sales
FROM
    sales.transactions
INNER JOIN
    sales.date ON sales.transactions.order_date = sales.date.date
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year,
    sales_month;
    
    



## Quarterly by year(2017 - 2020, only two quarters recorded for 2020)
    SELECT
    EXTRACT(YEAR FROM sales.date.date) AS sales_year,
    CONCAT('Q', EXTRACT(QUARTER FROM sales.date.date)) AS sales_quarter,
    SUM(sales.transactions.sales_amount) AS total_sales,
    AVG(sales.transactions.sales_amount) AS average_sales
FROM
    sales.transactions
INNER JOIN
    sales.date ON sales.transactions.order_date = sales.date.date
WHERE
    EXTRACT(YEAR FROM sales.date.date) = 2020
GROUP BY
    sales_year, sales_quarter
ORDER BY
    sales_year, sales_quarter;
## Annually 
-- Annual Sales Trends
SELECT
    EXTRACT(YEAR FROM sales.date.date) AS sales_year,
    SUM(sales.transactions.sales_amount) AS total_sales,
    AVG(sales.transactions.sales_amount) AS average_sales
FROM
    sales.transactions
INNER JOIN
    sales.date ON sales.transactions.order_date = sales.date.date
GROUP BY
    sales_year
ORDER BY
    sales_year;
    


