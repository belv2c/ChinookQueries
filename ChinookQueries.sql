USE [Chinook]
GO

-- 1. non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select c.FirstName, 
	   c.LastName,
	   c.CustomerId,
	   c.Country 
from Customer c
where c.Country != 'USA';
GO

-- 2. brazil_customers.sql: Provide a query only showing the Customers from Brazil.
select c.FirstName,
	   c.LastName,
	   c.CustomerId,
	   c.Country 
from Customer c
where c.Country = 'Brazil';
GO

-- 3. brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
select c.FirstName,
	   c.LastName, 
	   i.InvoiceId, 
	   i.InvoiceDate, 
	   i.BillingCountry 
from Invoice i
left join Customer c on c.CustomerId = i.CustomerId
where c.Country = 'Brazil';
GO

-- 4. sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
select * from Employee
where Title = 'Sales Support Agent';
GO

-- 5. unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
select distinct BillingCountry
from Invoice
where BillingCountry is not null;
GO

-- 6. sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
select i.InvoiceId, e.FirstName, e.LastName as SalesAgent from Invoice i, Employee e
where i.InvoiceId = e.EmployeeId
ORDER BY SalesAgent;
GO

-- 7. invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sales Agent name for all invoices and customers.
select i.Total, c.FirstName, c.LastName as CustomerName, c.Country, e.FirstName, e.LastName as SalesAgent from Invoice i
join Customer c on c.CustomerId = i.CustomerId
join Employee e on e.EmployeeId = c.SupportRepId
order by SalesAgent;

-- 8. total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
select * 
  from Invoice i
  where year(InvoiceDate) = 2009 
  or year(InvoiceDate) = 2011;
  GO

-- 9. total_sales_{year}.sql: What are the respective total sales for each of those years?
select sum from Invoice

SELECT SUM InvoiceTotal
FROM table_name
WHERE condition;

-- 10. invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.