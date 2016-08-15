-- 2. Create a View which contains three columns, member name,
-- member id and full description of category, i.e., Faculty, Students
-- and Others instead of F,S and O.

CREATE OR REPLACE VIEW members_detail AS 

SELECT 
  member_nm AS member_name, members_id, 
case category 
	WHEN 'F' THEN 'Faculty'
	WHEN 'S' THEN 'Student'
    ELSE 'Other' END
AS category

FROM members;

SELECT * FROM members_detail;