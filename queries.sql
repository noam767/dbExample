-- שאילתות מערכת
SELECT ProductID, DecreaseAmount FROM servprodhelper where serviceID = 11;

SELECT * 
FROM orders 
WHERE OrderID IN (SELECT OrderID FROM orderprocess WHERE ServiceAmount > 400);

SELECT customers.CustomerID, COUNT(orders.OrderID) as NumOrders 
FROM customers 
JOIN orders ON customers.CustomerID = orders.CustomerID 
GROUP BY customers.CustomerID 
HAVING COUNT(orders.OrderID) > 5;

-- הצהרה זו תשלוף את CustomerID ואת מספר ההזמנות שבוצעו על ידי כל לקוח מטבלאות "לקוחות" ו"הזמנות" במסד הנתונים של . סעיף GROUP BY מקבץ את הנתונים לפי זיהוי הלקוח והפונקציה COUNT סופרת את מספר ההזמנות שבוצעו על ידי כל לקוח. סעיף HAVING מסנן את התוצאות כך שיציג רק לקוחות שביצעו יותר מ-10 הזמנות.

SELECT e1.FirstName as EmployeeFirstName, e1.LastName as EmployeeLastName, 
       e2.FirstName as ManagerFirstName, e2.LastName as ManagerLastName 
FROM employees e1 
JOIN employees e2 ON e1.ReportsTo = e2.EmployeeID;
-- עובדים ומנהליהם




SELECT SupplierID, SupplierName, GetTotalFreight(SupplierID) as TotalFreight
FROM suppliers
ORDER BY TotalFreight DESC;

-- חישוב עלויות הובלה של כל ספק בנפרד מסודר בסדר יורד


SELECT AVG(PricePerUnit) as AvgPrice
FROM products
WHERE ProductName LIKE '%paper%'
LIMIT 10;
-- שאילתה זו תאחזר את מחיר היחידה הממוצע של כל המוצרים בטבלת "מוצרים" בעלי שם מוצר המכיל את המחרוזת "נייר", ותציג את התוצאה כשורה בודדת עם הכינוי "AvgPrice". ערכת התוצאות תהיה מוגבלת ל-10 שורות לכל היותר.



SELECT YEAR(OrderDate) as Year, 
       MONTH(OrderDate) as MONTH,
       COUNT(*) as OrdersCount
FROM orders
GROUP BY Year, MONTH;

SELECT 
    (SELECT SUM(SellingPrice * ServiceAmount) FROM orderprocess) AS TotalIncome, 
    (SELECT SUM(BuyingPrice * Quantity) FROM storageorderdetails) AS TotalSpent, 
    (SELECT SUM(SellingPrice * ServiceAmount) FROM orderprocess) - 
    (SELECT SUM(BuyingPrice * Quantity) FROM storageorderdetails) AS Profit;

(SELECT CONCAT(FirstName," ", LastName) as EmpName, CityID as CityCode  from employees); 

SELECT cities.CityName, COUNT(*) as NumEmployees
FROM cities
INNER JOIN employees ON cities.cityID = employees.CityID
GROUP BY cities.CityName;

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS FullName, COUNT(*) AS NumOrders
FROM orders o
INNER JOIN employees e ON o.EmployeeID = e.EmployeeID
GROUP BY o.EmployeeID
ORDER BY NumOrders DESC LIMIT 1; 
-- מצא את העובד המצטיין של בית הדפוס
-- עובד מצטיין הוא העובד שטיפל בכמה שיותר הזמנות


SELECT s.CompanyName, COUNT(*) AS NumOrders
FROM orders o
INNER JOIN shippers s ON o.ShipperID = s.ShipperID
GROUP BY o.ShipperID
ORDER BY NumOrders DESC
LIMIT 1;
-- באופן דומה נמצא שליח מצטיין


SELECT s.ServiceName, SUM(op.SellingPrice) AS TotalRevenue
FROM orderprocess op
INNER JOIN services s ON op.ServiceID = s.ServiceID
GROUP BY s.ServiceName
ORDER BY TotalRevenue DESC
LIMIT 5;

-- חמשת השיורתים הנמכרים ביותר

SELECT p.ProductName, SUM(sod.BuyingPrice) AS TotalRevenue
FROM storageorderdetails sod
INNER JOIN products p ON sod.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;

-- חמשת המוצרים שהיה בהם הכי הרבה צורך , כלומר נקנו הכי הרבה בשביל המחסן

SELECT p.ProductName, (s.UnitsInStock) AS TotalUnitsInStock
FROM stock s
INNER JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName 
ORDER BY TotalUnitsInStock ASC;
-- כמות חומרי גלם במחסן בעבור כל חומר גלם 



SELECT MONTH(orders.OrderDate) AS OrderMonth,
COUNT(orders.OrderID) AS numOfOrders,
SUM(orderprocess.SellingPrice * orderprocess.ServiceAmount) AS Total,
COUNT(customers.CustomerName) AS NumOfCompanies
FROM orders
INNER JOIN orderprocess ON orders.OrderID = orderprocess.OrderID
INNER JOIN customers ON customers.CustomerID = orders.CustomerID
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- השאילתה הזאת מחשבת את מספר ההזמנות, הסכום הכולל של כל ההזמנות, ומספר החברות השונות שהזמינו בכל חודש. היא 
-- משתמשת בטבלאות: הזמנות, פרטי הזמנה ולקוחות, ומצרפת אותן לפי מזה הזמנה ומזהה לקוח. השאילתה תקבץ את התוצאות לפי חודש הזמנת המוצרים ומחזירה אותן בסדר עולה לפי החודש

SELECT part1.ServiceName ,
 SUM(part1.ServiceAmount) AS count FROM 
 (SELECT services.ServiceName,
 services.ServiceID,
 orderprocess.ServiceAmount FROM services INNER JOIN orderprocess ON orderprocess.ServiceID =  services.ServiceID) AS part1
 GROUP BY ServiceName ORDER BY count desc limit 10 ;
 -- עשרת השירותים השכיחים ביותר בטבלת
 -- orderprocess
 
 SELECT part1.ServiceName, SUM(part1.ServiceAmount) as TotatlServiceAmount, COUNT(part1.CustomerName) as CountOFCustomers , part1.delivery from
(SELECT 
    orders.OrderId, services.ServiceName, orderprocess.ServiceID,
orderprocess.ServiceAmount ,orders.CustomerID,  customers.CustomerName,
    shippers.ShipperID, shippers.CompanyName as delivery
    FROM  orders
    INNER JOIN customers on orders.CustomerID =  customers.CustomerID
    INNER JOIN shippers on shippers.ShipperID = orders.ShipperID
    INNER JOIN orderprocess on orders.OrderID = orderprocess.OrderID
    INNER JOIN services on services.ServiceID = orderprocess.ServiceID
    WHERE orders.ShippedDate BETWEEN '2022-01-01' AND '2023-01-01') as part1
    GROUP BY ServiceName, delivery;
    
    -- כמה לקוחות הזמינו כל שירות ושירות כולל כמות השירותים שהוזמנו בעבור כל שירות  וכולל חברת השליחות
    -- בשנת 2022/2023
    
    SELECT avg(DATEDIFF(ShippedDate, OrderDate)) AS AVERAGE FROM orders;
    -- כמה ימים בממוצע עברו בין יום הזמנת הזמנה לבין הגעת ההזמנה ללקוח
    
    
    
    
DROP function IF EXISTS `SumOfEmp`;

DELIMITER $$
USE `dfussympatia`$$
CREATE FUNCTION `SumOfEmp` (d date, emId INT)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	declare S INT;
	SELECT SUM(op.ServiceAmount*op.SellingPrice) INTO S 
FROM orders o 
INNER JOIN orderprocess op on o.OrderId = op.OrderID
Inner Join employees e on o.EmployeeID = e.EmployeeID Where o.OrderDate = d and e.EmployeeID= emId;
RETURN S;
END$$

DELIMITER ;

DROP function IF EXISTS `SumOfDate`;
DELIMITER $$
USE `dfussympatia`$$
CREATE FUNCTION `SumOfDate` (d date)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	declare S INT;
	SELECT SUM(op.ServiceAmount*op.SellingPrice) INTO S
FROM orders o 
INNER JOIN orderprocess op on o.OrderId = op.OrderID Where d= o.OrderDate
;
RETURN S;
END$$

DELIMITER ;


-- using the above functions
    
 SELECT  CONCAT(e.FirstName, ' ', e.LastName) AS FULLNAME, o.OrderDate ,
 ( SumOfEmp(o.OrderDate, e.EmployeeID) / SumOfDate(o.OrderDate)) As ratio
FROM orders o INNER JOIN
 employees e ON o.EmployeeID = e.EmployeeID GROUP BY o.OrderDate;
 



SELECT o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, o.ShippedDate,
o.DeliveredDate, o.ShipperID, o.ShipPostalCode ,(DATEDIFF( o.DeliveredDate, o.OrderDate)) as diffInDays ,
c.CityID as CustCityID, emp.CityID as EmpCityID
FROM orders o 
INNER JOIN employees emp on o.EmployeeID = emp.EmployeeID 
INNER JOIN customers c on c.CustomerID = o.CustomerID and c.CityID = emp.CityID
order by diffInDays asc limit 3;

    