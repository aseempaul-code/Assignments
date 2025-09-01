Authors
+----------+--------------------+----------------+-----------+
| AuthorID | Name               | Country        | BirthYear |
+----------+--------------------+----------------+-----------+
|        1 | J.K. Rowling       | United Kingdom |      1965 |
|        2 | George R.R. Martin | United States  |      1948 |
|        3 | Haruki Murakami    | Japan          |      1949 |
+----------+--------------------+----------------+-----------+

Books
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+

Customers
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+

Orders
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
|       2 |          2 |      2 | 2023-03-15 |        1 |      24.99 |
|       3 |          3 |      3 | 2023-03-20 |        3 |      44.97 |
+---------+------------+--------+------------+----------+------------+

1.Write a query to display all the authors in the database.
select Name as AuthorNames
from Authors;

2. Retrieve the names and emails of all customers who joined after February 1, 2023
select Name,Email
from customers
where JoinDate>2023-02-01

3.Find all books in the 'Fantasy' genre.
select * from Books 
where Genre='Fantasy'

4. Display the total number of books available in stock.
select sum(stock) as totalbooks
from Books

5.Show the total revenue generated from all orders
select sum(TotalPrice) as TotalRevenue
from Orders;

6.List the details of orders placed by the customer named 'Alice Johnson.'
select O.OrderID,O.CustomerID,O.BookID,O.OrderDate,O.Quantity,O.TotalPrice
from Orders as O
join Customers as C on C.CustomerID=O.CustomerID
where C.Name='Alice Johnson'

7.Identify the book with the highest price.

select Title ,Price 
from Books
order by price desc
limit 1

8.Retrieve the details of books that have less than 50 units in stock.
select * 
from Books
where stock<50;

9. Write a query to list all books along with their author's name.
select b.Name
from Books as b
left join Authors as a on a.AuthorID=b.AuthorID

10. Display all orders with the customer name and book title included.
select o.orderID,o.CustomerID,o.BookID,o.OrderDate,o.Quantity,o.TotalPrice,c.Name,b.Title
from Orders as o
join Customers as c on c.CustomerID=o.CustomerID
join Books as b on b.BookID=o.BookID

11. Calculate the total number of orders placed by each customer.

select CustomerID ,sum(Quantity) as TotalOrders 
from Orders
group by CustomerID;

12.Find the average price of books in the 'Fiction' genre.
select Genre,avg(Price) as AveragePrice
from Books
where Genre='Fiction'
group by Genre

13. Determine the author whose books have the highest combined stock.
select a.AuthorID,a.Name,sum(b.stock) as TotalStock
from Authors as a
join Books as b on b.AuthorID=a.AuthorID
group by a.AuthorID 
order by TotalStock desc
limit 1;

14. Retrieve the names of authors born before 1950.

Select Name
from Authors
where BirthYear<1950;

15. Find all customers from the 'United Kingdom.'
Select * from Customers
where Country='United Kingdom'

16. Write a query to list all books that have been ordered more than once.
select Books.Title,Books.BookID,sum(Orders.Quantity) as MultipleOrderedBook
from Orders
join Books on Books.BookID=Orders.BookID
group by Books.BookID
having  MultipleOrderedBook>1

17. Identify the top-selling book based on the quantity sold
select b.Title,b.BookID,sum(o.Quantity) as QuantitySold
from Orders as o
join Books as b on b.BookID=o.BookID
group by o.BookID
order by QuantitySold desc
limit 1;

18.Calculate the total stock value for each book (price * stock).

select b.BookID, b.Title,sum(price*stock) as TotalStockValue
from Books
group by BooKID
order by TotalStockValue desc;

19.Write a query to find the name of the customer who placed the most expensive order.


select c.CustomerID, c.Name
from Customers as c
join Orders as o on c.CustomerID = o.CustomerID
where o.TotalPrice = (
    select max(TotalPrice)
    from Orders
);


20. Retrieve all books that have not been ordered yet
select b.bookID,b.Title
from Books as b
where 
b.BookId Not In
(select o.bookID from Orders as o);



mysqldump -u root -p my_database > ~/Desktop/my_database.sql




