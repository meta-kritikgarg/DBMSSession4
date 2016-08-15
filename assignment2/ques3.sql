-- 3. Create a View which contains the information – subject name,
-- title, member name, category, issue date, due date and return
-- date. If the books have not been returned, NULL should be
-- displayed instead of return date.


CREATE OR REPLACE VIEW books_issued AS 

SELECT
	S.subject_nm, T.title_nm, M.member_nm, M.category, I.issue_dt, I.due_dt, R.return_dt 
FROM 
	book_issue I 
    LEFT JOIN book_return R ON 
			I.accession_no = R.accession_no AND
			I.member_id = R.member_id AND
			DATE(I.issue_dt) = DATE(R.issue_dt)  
	LEFT JOIN books B 
			ON B.accession_no = I.accession_no
	LEFT JOIN titles T
			ON T.title_id = B.title_id 
	LEFT JOIN subjects S 
			ON S.subjects_id = T.subjects_id
	LEFT JOIN members M 
			ON M.members_id = I.member_id;
            
SELECT * FROM books_issued;