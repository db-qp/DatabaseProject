-- Query 1
-- returns the total number of businesses for each category

CREATE TABLE query1 AS
SELECT C.category_id AS category_id, C.name AS name, COUNT(B.business_id) as count 
FROM Business B, Category C, Hascategory H 
WHERE B.business_id = H.business_id AND C.category_id = H.category_id 
GROUP BY C.category_id;


-- Query 2
-- returns the average rating per category

CREATE TABLE query2 AS
SELECT C.category_id AS category_id, C.name AS name, AVG(R.RATING) as rating 
FROM Category C, Business B, Review R, Hascategory H
WHERE R.business_id = B.business_id AND B.business_id = H.business_id AND H.category_id = C.category_id
GROUP BY C.category_id;


-- Query 3
-- returns the businesses have at least 4000 reviews

CREATE TABLE query3 AS
SELECT B.business_id AS business_id, B.title AS title, COUNT(R.business_id) AS CountOfRatings
FROM Business B, Review R
WHERE B.business_id = R.business_id 
GROUP BY B.business_id
HAVING COUNT(R.business_id) > 3999;


-- Query 4
-- returns all “Chinese” businesses including business_id and title

CREATE TABLE query4 AS
SELECT B.business_id as business_id, B.title as title
FROM Business B, Category C, Hascategory H
WHERE B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Chinese';


-- Query 5
-- returns the average rating per business

CREATE TABLE query5 AS
SELECT B.business_id AS business_id, B.title AS title, AVG(R.RATING) as average
FROM Business B, Review R
WHERE B.business_id = R.business_id
GROUP BY B.business_id;


-- Query 6
-- returns the average rating for all “Chinese” businesses

CREATE TABLE query6 AS 
SELECT AVG(R.RATING) as average
FROM Business B, Review R, Category C, Hascategory H
WHERE B.business_id = R.business_id AND B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Chinese';


-- Query 7
-- returns the average rating for all businesses and each of these businesses is both “Chinese” and “Japanese”

CREATE TABLE query7 AS 
SELECT AVG(R.RATING) AS average
FROM Business B, Review R
WHERE B.business_id = R.business_id AND B.business_id IN (SELECT B.business_id
FROM Business B, Category C, Hascategory H
WHERE B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Chinese'
INTERSECT
SELECT B.business_id
FROM Business B, Category C, Hascategory H
WHERE B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Japanese');


-- Query 8
-- returns the average rating for all businesses and each of these businesses is “Chinese” but not “Japanese”

CREATE TABLE query8 AS
SELECT AVG(R.RATING) AS average
FROM Business B, Review R
WHERE B.business_id = R.business_id AND B.business_id IN (SELECT B.business_id
FROM Business B, Category C, Hascategory H
WHERE B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Chinese') AND B.business_id NOT IN (SELECT B.business_id
FROM Business B, Category C, Hascategory H
WHERE B.business_id = H.business_id AND C.category_id = H.category_id AND C.name = 'Japanese');


-- Query 9
-- finds all businesses that are rated by a User such that the userId is equal to ‘CxDOIDnH8gp9KXzpBHJYXw’

CREATE TABLE query9 AS
SELECT B.business_id as business_id, AVG(R.RATING) as rating 
FROM Business B, Review R 
WHERE B.business_id = R.business_id AND R.user_id = 'CxDOIDnH8gp9KXzpBHJYXw'
GROUP BY B.business_id;
