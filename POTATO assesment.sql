create database twitter;
use twitter;
alter table correct_twitterr rename correct_tweeter; -- skip it if you alredy save the data with this name
select * from correct_tweeter;
-- Construct functionality that allows you to query the data.
 -- If I search for a term, like “music,” I would like to know some subset of the following:
 -- ques 1- How many tweets were posted containing the term on each day?
select count(author_id),created_date from correct_tweeter
where text like "%music%"
group by created_date
order by created_date;
-- How many unique users posted a tweet containing the term?
select count(distinct (author_id)) as unique_user
from correct_tweeter
where text like '%music%';
-- How many likes did tweets containing the term get, on average?
select avg(like_count) as average_like 
from correct_tweeter 
where text regexp "music";
-- Where (in terms of place IDs) did the tweets come from?
select count(*) as no_of_tweets, place_id
from correct_tweeter
where text like '%music%'
group by place_id;
-- What times of day were the tweets posted at? 
select count(*) ,created_time from correct_tweeter
where text regexp "music"
group by created_time;
-- Which user posted the most tweets containing the term?
select count(*) tweet_count, author_id
from correct_tweeter
where  text regexp "music"
group by author_id 
order by tweet_count desc
limit 1 ;







