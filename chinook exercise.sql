/*
The Chinook database contains details of an online music store.
Here are some example answers to the question
*/

-- List all customers
SELECT * FROM Customer c 

-- List all customers. Show only the CustomerId, FirstName and LastName columns
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName 
FROM
    Customer c 

-- List customers in the United Kingdom  
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName,
    c.Country
FROM
    Customer c 
WHERE
    c.Country = 'United Kingdom'

-- List customers whose first names begins with an A.
-- Hint: use LIKE and the % wildcard
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName,
    c.Country
FROM
    Customer c 
WHERE
    c.FirstName LIKE 'A%'

-- List Customers with an apple email address
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName,
    c.Country,
    c.Email
FROM
    Customer c 
WHERE
    c.Email LIKE '%@apple.%'

-- Which customers have the initials LK?
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName,
    c.Country,
    c.Email
FROM
    Customer c 
WHERE
    c.FirstName LIKE 'L%'
    AND c.LastName LIKE 'K%'

-- Which are the corporate customers i.e. those with a value, not NULL, in the Company column?
SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName,
    c.Company
FROM
    Customer c
WHERE
    c.Company IS NOT NULL

-- How many customers are in each country.  Order by the most popular country first.
SELECT
    c.Country,
    COUNT (*) AS Number_Customers
FROM Customer c
GROUP BY c.Country
ORDER BY Number_Customers DESC

-- When was the oldest employee born?  Who is that?
SELECT TOP 1 e.BirthDate FROM Employee e
ORDER BY e.BirthDate

SELECT MIN (e.BirthDate) FROM Employee e

-- List the 10 latest invoices. Include the InvoiceId, InvoiceDate and Total
SELECT TOP 10
    i.InvoiceId, 
    i.InvoiceDate, 
    i.Total
FROM 
    Invoice i
ORDER BY 
    i.InvoiceDate DESC

-- Then  also include the customer full name (first and last name together)
SELECT TOP 10
    i.InvoiceId, 
    i.InvoiceDate, 
    i.Total,
    CONCAT(c.FirstName,' ',c.LastName) AS Customer_FullName,
    c.SupportRepId,
    CONCAT(e.FirstName,' ',e.LastName) AS Employee_FullName
FROM 
    Invoice i
INNER JOIN Customer c ON i.CustomerId = c.CustomerId
    LEFT JOIN Employee e on c.SupportRepId = e.EmployeeId
ORDER BY 
    i.InvoiceDate DESC

-- List the customers who have spent more than £45

-- List the City, CustomerId and LastName of all customers in Paris and London, 
-- and the Total of their invoices
	
-- Show all details about customer Michelle Brooks.  List salient details of her invoices.

/*
Which employees were born in the 1960s?  Show only the EmployeeId, FirstName, LastName and BirthDate columns
Note: Define a date value as with the region independent format 'yyyy-mm-dd' e.g. '1969-12-31'
*/


-- List countries, and the number of customers and the total invoiced amount
-- Order  high to low in terms of the number of customers

-- What are the top 10 most popular artists in terms of number of tracks bought by customers?

-- List the albums in alphabetical order of Title

-- List 10 albums and their artist.  Order by album title.