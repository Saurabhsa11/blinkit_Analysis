SELECT * FROM blinkit_data
SELECT COUNT(*) FROM blinkit_data
UPDATE blinkit_data
SET Item_Fat_Content =
	CASE 
		WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
		WHEN Item_Fat_Content = 'reg' THEN 'Regular'
		ELSE Item_Fat_Content
			END;
SELECT DISTINCT(Item_Fat_Content) FROM blinkit_data

SELECT COUNT(*) AS No_Of_Items_In_Low_Fat FROM blinkit_data
WHERE Item_Fat_Content = 'Low Fat'

SELECT COUNT(*) AS No_Of_Items_of_5_Rating FROM blinkit_data
WHERE Rating = 5

SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), ' Millions') AS Total_Sales_in_Millions
FROM blinkit_data

SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), ' Millions') AS Total_Sales_in_Millions
FROM blinkit_data
WHERE Item_Fat_Content = 'Low Fat'

SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), ' Millions') AS Total_Sales_in_Millions
FROM blinkit_data
WHERE Item_Fat_Content = 'Regular'

SELECT CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), ' Millions') AS Total_Sales_in_Millions
FROM blinkit_data
WHERE Outlet_Establishment_Year = 2017

SELECT CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales
FROM blinkit_data

SELECT Item_Fat_Content, 
	CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), ' Millions') As Total_sales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Fat_Content
ORDER BY Total_sales DESC

SELECT Item_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_sales DESC

SELECT TOP 5 Item_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_sales ASC

SELECT Outlet_Location_Type, Item_Fat_Content,
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_sales ASC

SELECT Outlet_Location_Type,
	ISNULL([Low Fat], 0) AS Low_Fat,
	ISNULL([Regular], 0) AS Regular
FROM 
(
	SELECT Outlet_Location_Type, Item_Fat_Content,
		CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
	FROM blinkit_data
	GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT
(
	SUM(Total_Sales)
	FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


SELECT Outlet_Establishment_Year,
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC

SELECT Outlet_Size,
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
	CAST((SUM(Sales)* 100.0 /SUM(SUM(Sales))OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type,
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST((SUM(Sales)* 100.0 /SUM(SUM(Sales))OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_sales DESC;

SELECT Outlet_Type,
	CAST(SUM(Sales) AS DECIMAL(10,2)) As Total_sales,
	CAST((SUM(Sales)* 100.0 /SUM(SUM(Sales))OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	CAST(AVG(Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_sales DESC;