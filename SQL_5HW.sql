INSERT INTO [Departments] 
([Name])
VALUES
('Human Resources'),
('Marketing'),
('Finance'),
('Research and Development'),
('Information Technology'),
('Customer Service'),
('Operations'),
('Sales'),
('Quality Assurance'),
('Administration')


INSERT INTO [EmploeeDepartment]
(
[EmployeeId],
DepartmentId
)
VALUES
(1,2),
(1,5),
(2,6),
(2,4),
(3,10),
(4,7),
(4,1),
(5,6),
(6,8),
(6,2)


SELECT * FROM Departments
SELECT * FROM EmploeeDepartment

--������� �� ������� ���������� � ��� �-�� ����� �������

SELECT 
    e.FirstName + ' ' + e.LastName as Name,
    COUNT(ep.DepartmentId) as DepartmentCount
FROM Employees e
JOIN EmploeeDepartment ep ON (e.Id = ep.EmployeeId)
GROUP BY e.FirstName, e.LastName

--������� �� ������� ����� ������ ��� �����������

SELECT
	d.Name as Name,
	COUNT(ep.EmployeeId) as EmployeeCount
FROM Departments d
LEFT OUTER JOIN EmploeeDepartment ep ON (d.Id = ep.DepartmentId)
GROUP BY d.Name

--������� �� ����������� ������������ ��� ������������(������ 1)

SELECT
	d.Name as Name,
	e.FirstName+ ' ' + e.LastName as Employee
FROM Departments d
LEFT OUTER JOIN EmploeeDepartment ep ON (d.Id = ep.DepartmentId)
LEFT OUTER JOIN Employees as e ON(ep.EmployeeId=e.Id)
GROUP BY d.Name,e.FirstName, e.LastName

--������� �� ����������� ������������ ��� ������������(������ 2)

SELECT
	d.Name as Name,
	e.FirstName+ ' ' + e.LastName as Employee
FROM Departments d
JOIN EmploeeDepartment ep ON (d.Id = ep.DepartmentId)
JOIN Employees as e ON(ep.EmployeeId=e.Id)
WHERE d.Id=2
GROUP BY d.Name,e.FirstName, e.LastName