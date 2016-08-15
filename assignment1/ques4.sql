-- 4. Write a SELECT command to display information of those books
-- whose price is equal to the most expensive book purchase so far.

SELECT accession_no, title_id, purchase_dt, price FROM books WHERE price = (SELECT MAX(price) FROM books );