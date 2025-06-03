📊 BlinkIt Sales Analysis – Power BI & SQL Project
📝 Overview
This project presents a comprehensive sales analysis of BlinkIt, combining SQL for data preprocessing and exploration, and Power BI for interactive visual dashboards. The analysis highlights performance trends across item categories, outlet types, fat content, and geography, enabling data-driven decision-making.

🛠️ Tools & Technologies
SQL (Data Cleaning, Analysis)

Power BI Desktop (Visualization)

DAX, Power Query (M Language)

Excel / CSV Data Source

🔍 Business Objectives
Analyze Total Sales by Fat Content

Track Total Sales by Item Type

Compare Fat Content Sales by Outlet Location

Review Total Sales by Outlet Establishment Year

Analyze Sales by Outlet Location

Evaluate All Key Metrics by Outlet Type

🧹 SQL Data Cleaning
Cleaned inconsistent Item_Fat_Content entries like LF, low fat, and reg into standard values (Low Fat, Regular) using UPDATE and CASE.

sql
Copy
Edit
UPDATE blinkit_data
SET Item_Fat_Content = CASE 
    WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN Item_Fat_Content = 'reg' THEN 'Regular'
    ELSE Item_Fat_Content
END;
📊 SQL Analysis Highlights
Total and Average Sales

Item Count & Ratings by:

Fat Content

Item Type

Outlet Type, Location, and Size

Establishment Year

Best & Worst Performing Item Categories

Percentage of Sales by Outlet Characteristics

Pivot Table for Fat Content vs Outlet Location

Example query for item-wise sales summary:

sql
Copy
Edit
SELECT Item_Type, 
       SUM(Sales) AS Total_Sales,
       AVG(Sales) AS Avg_Sales,
       COUNT(*) AS No_Of_Items,
       AVG(Rating) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;
📈 Power BI Dashboard Features
Visualizations of:

Sales by Fat Content & Item Type

Sales by Outlet Type, Year, and Location

Interactive KPI cards and slicers

Drill-down and filter capabilities

Export-ready dashboards for presentation

📂 File Structure
bash
Copy
Edit
BlinkIt_Analysis/
├── BlinkIt_Analysis.pbix           # Power BI Dashboard
├── Blink_It_Query_data.docx        # SQL Queries & Logic
└── README.md                       # Project Documentation
🚀 How to Run
Power BI:
Open BlinkIt_Analysis.pbix in Power BI Desktop.

Use slicers to filter data by category, outlet type, etc.

SQL:
Import dataset to your SQL environment.

Run queries from Blink_It_Query_data.docx in sequence for insights.

👨‍💻 Author
Name: Saurabh Kumar
Email: 2025UG@gmail.com
