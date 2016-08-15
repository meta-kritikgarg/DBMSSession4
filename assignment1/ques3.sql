/* 3. Write a SELECT command to display information on the books
that have been returned after their due dates. The information
should include book issue date, title, member name and due
date.
Note: Use Correlated Subquery.
*/


SELECT r.issue_dt, T.title_nm, M.member_nm ,i.due_dt
FROM book_return r 
INNER JOIN book_issue i   
 ON i.accession_no = r.accession_no AND
 i.member_id = r.member_id AND
 DATE(i.issue_dt) = DATE(r.issue_dt)  
LEFT JOIN members M 
 ON M.members_id = r.member_id
LEFT JOIN books B 
 ON B.accession_no = r.accession_no
LEFT JOIN titles T
 ON T.title_id = B.title_id
 WHERE r.return_dt>i.issue_dt;


