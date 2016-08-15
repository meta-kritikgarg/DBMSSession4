-- 1. Create a View which can be used to display member name and
-- all issue details of the member using a simple SELECT command.

CREATE OR REPLACE VIEW member_issue_book AS 

SELECT M.members_id, M.member_nm, I.issue_dt, I.due_dt ,I.accession_no FROM
members M LEFT JOIN  book_issue I ON M.members_id = I.member_id
ORDER BY M.members_id;

SELECT * FROM member_issue_book;