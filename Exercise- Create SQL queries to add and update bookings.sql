/*
Task 1 create a new procedure called AddBooking to add a new table booking record.
The procedure should include four input parameters in the form of the following bookings parameters:
booking id, customer id, booking date,and table number.
*/
USE little_lemon_db;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN inputbooking_id INT,
    IN inputcustomer_id INT,
    IN inputbooking_date DATE,
    IN inputtable_number INT
)
BEGIN
    INSERT INTO little_lemon_db.bookings (booking_id, customer_id, booking_date, table_number)
    VALUES (inputbooking_id, inputcustomer_id, inputbooking_date, inputtable_number);
    
    SELECT 'New booking added.' AS Message;
END //

DELIMITER ;

CALL AddBooking(9, 3, '2022-12-30', 4);

/*
Task 2  Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN inputbooking_id INT,
    IN inputbooking_date DATE
)
BEGIN
    UPDATE bookings
    SET booking_date = inputbooking_date
    WHERE booking_id = inputbooking_id;
    
    SELECT 'Booking updated.' AS Message;
END //

DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');

/*
Task 3  Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN inputbooking_id INT
)
BEGIN
    DELETE FROM bookings
    WHERE booking_id = inputbooking_id;

    SELECT 'Booking canceled.' AS Message;
END //

DELIMITER ;

CALL CancelBook(9);
