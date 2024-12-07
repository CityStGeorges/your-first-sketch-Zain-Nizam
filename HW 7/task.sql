1. Create a view with the name samsBills to allow the waiter Sam Pitt to see the bills he has taken. It should have columns in that order: first_name, surname, bill_date, cust_name, and bill_total.

CREATE VIEW samsBills AS
SELECT s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';

2. Suppose Sam knows a bit of SQL. Write a query using the samsBills view so he can see only bills over £400.

SELECT *
FROM samsBills
WHERE bill_total > 400;

3. Create a view with the name roomTotals to allow management to see how much each room has taken. The columns should be named: room_name and total_sum.

CREATE VIEW roomTotals AS
SELECT rt.room_name, SUM(b.bill_total) AS total_sum
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
GROUP BY rt.room_name;

4. Create a view with the name teamTotals to allow management to see how much each team has taken. Please concatenate the first name and the surname of the waiter with the space in between. The columns should be named: headwaiter_name and total_sum.

CREATE VIEW teamTotals AS
SELECT CONCAT(hw.first_name, ' ', hw.surname) AS headwaiter_name, SUM(b.bill_total) AS total_sum
FROM restStaff hw
JOIN restStaff w ON hw.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY hw.first_name, hw.surname;
