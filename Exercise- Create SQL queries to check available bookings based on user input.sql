/*
Task 1 
Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 
*/
INSERT INTO Bookings (booking_id, booking_date, table_number, customer_id)
VALUES 
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

/*
Task 2 Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.
The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.
*/

DELIMITER //

CREATE PROCEDURE CheckBooking(IN inputbooking_date DATE, IN inputtable_number INT)
BEGIN
    DECLARE BookedTable VARCHAR(255);
  
    SELECT 
        CASE 
            WHEN COUNT(*) > 0 THEN 'Table is already booked.'
            ELSE 'Table is available for booking.'
        END INTO BookedTable
    FROM bookings
    WHERE booking_date = inputbooking_date AND table_number = inputtable_number;

       SELECT BookedTable AS Status;
END //

DELIMITER ;

CALL CheckBooking(2022-11-12, 3);

/*
Task 3: Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  
*/

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN inputbooking_date DATE, IN inputtable_umber INT)
BEGIN
    DECLARE BookedTable VARCHAR(255);

    START TRANSACTION;

     IF BookedTable > 1 THEN
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked.' AS Message;
    ELSE
		INSERT INTO bookings (booking_date, table_number, customer_id)
        VALUES(inputbooking_date, inputtable_number, inputcustomer_id);
        
		COMMIT;
	END IF;
END //

DELIMITER ;


