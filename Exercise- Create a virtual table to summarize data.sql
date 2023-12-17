/*
Task 1 create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
*/

CREATE VIEW OrdersView AS 
SELECT 
order_id, 
quantity, 
total_cost
FROM Orders
WHERE Quantity > 2;

SELECT * From OrdersView;

/*
Task 2 For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
Customers table: The customer id and full name.
Orders table: The order id and cost.
Menus table: The menus name.
MenusItems table: course name and starter name.
The result set should be sorted by the lowest cost amount. 
*/

Select
c.customer_id,
c.customer_name,
o.order_id,
o.total_cost,
m.menu_name,
mi.course_name,
mi.start_name
FROM
customer_details c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN menu m ON o.menu_id = m.menu_id
JOIN menu m ON mi.menu_items_id = m.menu_items_id
WHERE o.total_cost > 150
ORDER BY o.total_cost;

/*
Task 3 Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
Here’s some guidance around completing this task: 
Use the ANY operator in a subquery
The outer query should be used to select the menu name from the menus table.
The inner query should check if any item quantity in the order table is more than 2. 
*/

SELECT 
menu_name
FROM menu
WHERE menu_id = ANY (
	SELECT menu_id
    FROM orders
    GROUP BY menu_id
    HAVING COUNT(*) > 2
);