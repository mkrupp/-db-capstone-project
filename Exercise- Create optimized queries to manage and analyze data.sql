/*
Task 1:  Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 
*/
CREATE PROCEDURE GetMaxQuantity()  
SELECT max(quantity) as GetMaxQuantity 
From orders;

Call GetMaxQuantity();

/*
Task 2 Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
The prepared statement should accept one input argument, the CustomerID value, from a variable. 
The statement should return the order id, the quantity and the order cost from the Orders table. 
Once you create the prepared statement, you can create a variable called id and assign it value of 1. 
*/

PREPARE GetOrderDetailStmt
FROM 'SELECT order_id, quantity, total_cost FROM orders WHERE customer_id =?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

/*
Task 3  create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
*/

DELIMITER //

CREATE PROCEDURE CancelOrder(IN inputorder_id INT)
BEGIN
DELETE FROM orders WHERE order_id = inputorder_id;
SELECT 'Order canceled successfully.' AS Message;
END //

DELIMITER ;

CALL CancelOrder(5);