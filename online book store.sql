use newschema;
select * from books;
select * from customers;
select * from orders;
-- Retrieve all books in the "Fiction" genre:
select * from books 
where Genre='Fiction';
-- Find books published after the year 1950:
select * from books 
where Published_Year > 1950;
-- List all customers from the Canada:
select * from customers 
where Country='Canada';
-- Show orders placed in November 2023:
select * from orders where
 Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
 -- Retrieve the total stock of books available:
 select Sum(Stock) as Total_stocl from books;
 -- Find the details of the most expensive book:
 select * from books
 order by price desc
 limit 1;
 -- Show all customers who ordered more than 1 quantity of a book:
 select * from orders where  quantity>1;
 --  Retrieve all orders where the total amount exceeds $20:
 select * from orders where Total_Amount>20;
 -- List all genres available in the Books table:
 select distinct Genre from books;
 -- Find the book with the lowest stock:
 select * from books 
 order by Stock asc
 limit 1;
 -- Calculate the total revenue generated from all orders:
 select sum(Total_Amount) as total_revenue from orders;
 --  Retrieve the total number of books sold for each genre:
 select b.Genre, SUM(o.Quantity) AS Total_Books_sold
from Orders o
join  Books b ON o.book_id = b.book_id
group by b.Genre;
-- Find the average price of books in the "Fantasy" genre:
select avg(Price) as average from books where Genre='Fantasy';
-- List customers who have placed at least 2 orders:

select o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
from  orders o
join customers c ON o.customer_id=c.customer_id
group by o.customer_id, c.name
having COUNT(Order_id) >=2;
-- Find the most frequently ordered book:
select o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
from orders o
join books b ON o.book_id=b.book_id
group by o.book_id, b.title
order by ORDER_COUNT DESC LIMIT 1;
--  Show the top 3 most expensive books of 'Fantasy' Genre 
select * from books where genre ='Fantasy'
order by  price DESC LIMIT 3;
-- Retrieve the total quantity of books sold by each author:
select sum(o.Quantity) as Quantities ,b.Author 
from books b
join orders o on b.Book_ID= o.Book_ID
group by b.Author
-- List the cities where customers who spent over $30 are located:
select distinct c.city, total_amount
from  orders o
join customers c ON o.customer_id=c.customer_id
where  o.total_amount > 30;
-- Find the customer who spent the most on orders:
select c.Customer_ID,c.Name ,sum(o.Total_Amount) as Total
from customers c
join orders o 
on c.Customer_ID =o.Customer_ID 
group by c.Customer_ID,c.Name
order by Total desc limit 1;
