SELECT member_nm,category FROM members 
WHERE category = (SELECT category FROM members WHERE member_nm = 'Jon Snow') ;