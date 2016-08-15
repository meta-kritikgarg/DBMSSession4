-- 5. Write a SELECT command to display the second maximum price of a book.
SELECT MAX(price) FROM books WHERE price <> (SELECT MAX(price) FROM books );