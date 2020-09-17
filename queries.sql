-- get total number of vine reviews
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'Y'
-- output = 1747

-- get total number of non-vine reviews
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'N'
-- output = 958932

-- get number of 5 star ratings for vine reviews
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'Y' AND star_rating = 5
-- output = 605

-- get number of 5 star ratings for non-vine reviews
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'N' AND star_rating = 5
-- output = 570888

-- get average ratings for vine reviews
SELECT AVG(star_rating) 
FROM vine_table
WHERE vine = 'Y'
-- output = 4.0

-- get average ratings for non-vine reviews
SELECT AVG(star_rating) 
FROM vine_table
WHERE vine = 'N'
-- output = 4.1

-- get average number of helpful votes for vine reviews
SELECT AVG(helpful_votes) 
FROM vine_table
WHERE vine = 'Y'
-- output = 2.86

-- get average number of helpful votes for non- vine reviews
SELECT AVG(helpful_votes) 
FROM vine_table
WHERE vine = 'N'
-- output = 1.19

-- =======================================================
-- CHECK DATA IF FILTERED BY HELPFUL VOTES GREATER THAN 5
-- =======================================================

-- total number of reviews 
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'Y' AND helpful_votes > 5 
-- output = 188

SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'N' AND helpful_votes > 5 
-- output = 41045

-- number of 5 star ratings
SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'Y' AND helpful_votes > 5 AND star_rating = 5 
-- output = 71

SELECT COUNT(review_id) 
FROM vine_table
WHERE vine = 'N' AND helpful_votes > 5 AND star_rating = 5
-- output = 21815

-- average ratings
SELECT AVG(star_rating) 
FROM vine_table
WHERE vine = 'Y' AND helpful_votes > 5
-- output = 4.0

SELECT AVG(star_rating) 
FROM vine_table
WHERE vine = 'N' AND helpful_votes > 5
-- output = 3.9

-- average number of helpful votes 
SELECT AVG(helpful_votes) 
FROM vine_table
WHERE vine = 'Y' AND helpful_votes > 5
-- output = 17.56

SELECT AVG(helpful_votes) 
FROM vine_table
WHERE vine = 'N' AND helpful_votes > 5
-- output = 15.92