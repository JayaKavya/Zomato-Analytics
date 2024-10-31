USE zomato;

-- Find the Numbers of Resturants based on City and Country.

SELECT 
    Country.CountryName, City, COUNT(*) AS Restaurant_Count
FROM
    Restaurants
        JOIN
    Country ON Restaurants.CountryCode = Country.CountryID
GROUP BY Country.CountryName , City;

-- Numbers of Resturants opening based on Year

SELECT 
    Year_Opening AS Year, COUNT(*) AS Restaurant_Openings
FROM
    Restaurants
GROUP BY Year_Opening
ORDER BY Year_Opening;

-- Numbers of Resturants opening based on Quarter

SELECT 
    Year_Opening AS Year,
    CASE
        WHEN Month_Opening BETWEEN 1 AND 3 THEN 'Q1'
        WHEN Month_Opening BETWEEN 4 AND 6 THEN 'Q2'
        WHEN Month_Opening BETWEEN 7 AND 9 THEN 'Q3'
        WHEN Month_Opening BETWEEN 10 AND 12 THEN 'Q4'
    END AS Quarter,
    COUNT(*) AS Restaurant_Openings
FROM
    Restaurants
GROUP BY Year_Opening , Quarter
ORDER BY Year_Opening , Quarter;

-- Numbers of Resturants opening based on Month

SELECT 
    Year_Opening AS Year,
    Month_Opening AS Month,
    COUNT(*) AS Restaurant_Openings
FROM
    Restaurants
GROUP BY Year_Opening , Month_Opening
ORDER BY Year_Opening , Month_Opening;

-- Count of Resturants based on Average Ratings

SELECT 
    Rating, COUNT(*) AS Restaurant_Count
FROM
    Restaurants
GROUP BY Rating;

-- Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

SELECT 
    CASE
        WHEN Average_Cost_for_two BETWEEN 0 AND 100 THEN 'Low'
        WHEN Average_Cost_for_two BETWEEN 101 AND 300 THEN 'Medium'
        WHEN Average_Cost_for_two > 300 THEN 'High'
    END AS Price_Bucket,
    COUNT(*) AS Restaurant_Count
FROM
    Restaurants
GROUP BY Price_Bucket;

-- Percentage of Resturants based on "Has_Table_booking"
SELECT 
    (SUM(CASE
        WHEN Has_Table_booking = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS Table_Booking_Percentage
FROM
    Restaurants;

-- Percentage of Resturants based on "Has_Online_delivery"

SELECT 
    (SUM(CASE
        WHEN Has_Online_delivery = 'Yes' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS Online_Delivery_Percentage
FROM
    Restaurants;