1. List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.

SELECT DISTINCT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00
  AND b.table_no IN (
      SELECT rt.table_no
      FROM restRoom_management rm
      JOIN restRest_table rt ON rm.room_name = rt.room_name
      WHERE rm.headwaiter = (
          SELECT staff_no
          FROM restStaff
          WHERE first_name = 'Charles'
      )
      AND rm.room_date = b.bill_date
  );
  
2. A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter
    FROM restStaff
    WHERE staff_no = (
        SELECT waiter_no
        FROM restBill
        WHERE cust_name = 'Nerida Smith'
          AND bill_date = 160111
    )
);

3. What are the names of customers with the smallest bill?

SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

4. List the names of any waiters who have not taken any bills.

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT b.waiter_no
    FROM restBill b
);

5. Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.

SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rm.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE b.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);

