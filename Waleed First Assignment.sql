-- ============================================================
--  ASSIGNMENT 01 — Querying, Sorting & Filtering (Review + New)
--  Database : BikeStores
--  Topics   : SELECT, WHERE, ORDER BY, TOP/OFFSET-FETCH, DISTINCT,
--             AND / OR, IN / NOT IN, BETWEEN, IS NULL, Aliases, LIKE
-- ============================================================


-- ============================================================
--  Question 1 — SELECT, WHERE & AND
--  The operations team wants a roster of active staff members
--  working at store_id = 1.
--  Retrieve the staff_id, first_name, last_name, and email of
--  every staff member where store_id = 1 AND active = 1.
-- ============================================================

-- Write your query below:

Select staff_id, first_name, last_name, email
From sales.staffs
Where staff_id = 1 and active = 1


-- ============================================================
--  Question 2 — ORDER BY (Multiple Columns)
--  Retrieve product_id, product_name, category_id, and list_price
--  for all products.
--  Sort the results by category_id ascending, and within the
--  same category sort by list_price descending.
-- ============================================================

-- Write your query below:

Select product_id, Product_Name, Category_id, list_price
From production.products
Order by category_id ASC, list_price DESC


-- ============================================================
--  Question 3 — TOP N & TOP PERCENT
--  a) The logistics team wants to see the 3 most recently placed
--     orders. Return order_id, customer_id, and order_date for
--     the top 3 orders, most recent first.
--  b) Return the top 10 percent of products by list_price
--     (all columns). How many rows does that return? Add the
--     row count as a comment in your answer.
-- ============================================================

-- Part a:

Select Top 3 order_id, Customer_id, Order_id
From sales.orders


-- Part b:

Select Top 10 Percent*
From production.products
Order by list_price DESC

Total 33 Rows

-- ============================================================
--  Question 4 — OFFSET & FETCH (Pagination)
--  Customer support is browsing the customer list alphabetically
--  by last name, 10 customers per page.
--  Write a single query that returns ONLY page 2 (rows 11-20).
-- ============================================================

-- Write your query below:

Select *
From production.products
Order by list_price DESC
Offset 10 Rows
Fetch next 10 Rows only


-- ============================================================
--  Question 5 — DISTINCT
--  a) The purchasing team wants to know which brands currently
--     have at least one product priced above $1,000.
--     List the distinct brand_id values that qualify.
--  b) List every distinct combination of category_id and
--     model_year that appears in production.products, sorted
--     by category_id then model_year.
-- ============================================================

-- Part a:

Select DISTINCT*
From production.products
Where list_price > $1000

-- Part b:

Select DISTINCT*
From production.products
Order by category_id, model_year


-- ============================================================
--  Question 6 — IN / NOT IN
--  a) Store managers for store_id 1 and 3 want a combined list
--     of every order placed at either store. Show order_id,
--     store_id, and order_date for orders where store_id IN (1, 3).
--  b) A different team wants every order that was NOT placed at
--     store_id 2. Show the same three columns.
-- ============================================================

-- Part a:

Select Order_ID, Store_id, order_date
From sales.orders
Where store_id in (1,3)


-- Part b:

Select Order_ID, Store_id, order_date
From sales.orders
Where store_id in ( 2 )
 


-- ============================================================
--  Question 7 — BETWEEN combined with AND / OR
--  Find every product that meets ALL of the following:
--    - list_price is between $300 and $1,200 (inclusive)
--    - model_year is 2017 OR 2018
--  Show product_name, model_year, and list_price, sorted by
--  list_price ascending.
--  Hint: use parentheses to control the order of evaluation.
-- ============================================================

-- Write your query below:

Select Product_Name, Model_Year, List_Price
From production.products
Where list_price Between $300 and $1200 or model_year in (2017, 2018)
Order by list_price ASC

-- ============================================================
--  Question 8 — IS NULL / IS NOT NULL
--  HR is reviewing the staff reporting structure.
--  a) List every staff member who has NO manager (the top of
--     the org chart). Show staff_id, first_name, and last_name.
--  b) List every staff member who DOES have a manager on record.
--     Show staff_id, first_name, last_name, and manager_id.
-- ============================================================

-- Part a:

Select staff_id, First_name, Last_name, Manager_id 
From sales.staffs
Where manager_id is null

-- Part b:

Select staff_id, First_name, Last_name, Manager_id 
From sales.staffs
Where manager_id is not null


-- ============================================================
--  Question 9 — Aliases & LIKE
--  Marketing wants a mailing list of every customer whose email
--  address is hosted on gmail.com.
--  Show the customer's full name as full_name (built from
--  first_name + last_name) and their email, using a table alias
--  for sales.customers. Sort by full_name ascending.
-- ============================================================

-- Write your query below:

SELECT  first_name +' '+ last_name as full_name, email
from sales.customers
where email like  '%gmail.com'
order by FULL_name asc

-- ============================================================
--  END OF ASSIGNMENT 01
-- ============================================================
