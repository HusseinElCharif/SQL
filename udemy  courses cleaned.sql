-- link for data set on kaggle: https://www.kaggle.com/datasets/jilkothari/finance-accounting-courses-udemy-13k-course?utm_source=newsletter.thequery.io&utm_medium=newsletter&utm_campaign=what-working-in-analytics-at-netflix-is-like

SELECT * 
FROM [udemy courses]


--correcting price details and discount
SELECT price_detail__price_string,
REPLACE (price_detail__price_string, '₹','$') AS PriceDetailString
FROM [udemy courses]

ALTER TABLE [udemy courses]
DROP COLUMN PriceDetailString ;


SELECT discount_price__price_string,
REPLACE (discount_price__price_string, '₹','$')
FROM [udemy courses]

UPDATE [udemy courses]
SET discount_price__price_string = REPLACE (discount_price__price_string, '₹','$')


SELECT * 
FROM [udemy courses]

-------------------------------------------------------------------------------------
SELECT price_detail__currency
FROM [udemy courses]
WHERE price_detail__currency <>'INR'

ALTER TABLE [udemy courses]
DROP COLUMN price_detail__currency;

SELECT * 
FROM [udemy courses]



SELECT discount_price__currency
FROM [udemy courses]
WHERE discount_price__currency <> 'INR'

ALTER TABLE [udemy courses]
DROP COLUMN discount_price__currency;

SELECT * 
FROM [udemy courses]

ALTER TABLE [udemy courses]
DROP COLUMN published_time;

SELECT
SUBSTRING(created,1,CHARINDEX('T', created)-1)AS date_created,--seperating date and time (-1 to remove T from date_created)
SUBSTRING(created,CHARINDEX('T', created)+1,LEN(created)) AS time_created  --creating time_created column
FROM [udemy courses]

--adding substringed values to new columns

ALTER TABLE [udemy courses]
ADD date_created Date;

UPDATE [udemy courses]
SET date_created = SUBSTRING(created,1,CHARINDEX('T', created)-1)

ALTER TABLE [udemy courses]
ADD time_created NVARCHAR(255);

UPDATE [udemy courses]
SET time_created = SUBSTRING(created,CHARINDEX('T', created)+1,LEN(created))

SELECT *
FROM [udemy courses]

SELECT time_created,
REPLACE(time_created, 'Z','')
FROM [udemy courses]

UPDATE [udemy courses]
SET time_created= REPLACE(time_created, 'Z','')

ALTER TABLE [udemy courses]
DROP COLUMN created;

ALTER TABLE [udemy courses]
DROP COLUMN url;

SELECT *
FROM [udemy courses]
