practice 

Let N be the number of CITY entries in STATION, and let N` be the number of distinct CITY names in STATION; query the value of  from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
-------------------------------------------------------------------------
select count(city)-count(distinct city) from station

Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID,2) = 0


Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
--------------------------------------------------------------------------
(select CITY, char_length(CITY) as len_city from STATION where char_length(CITY)=(select char_length(CITY)from STATION order by char_length 
(CITY) LIMIT 1) Order by CITY LIMIT 1) UNION ALL (select CITY,char_length(CITY) as len_city from STATION where char_length(CITY)=(select char_length(CITY) from STATION order by char_length(CITY) DESC LIMIT 1)  Order by CITY DESC LIMIT 1) ORDER BY char_length(CITY);


Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE WHERE CITY RLIKE '^[aeiouAEIOU].*$'


Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' or CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U'

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'


Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$'



Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
--------------------------------------------------------------------------
select distinct CITY from STATION where CITY not REGEXP'[aeiouAEIOU]$';



Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'

Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$' and CITY not REGEXP'[aeiouAEIOU]$'

Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
--------------------------------------------------------------------------
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$' and CITY not REGEXP'[aeiouAEIOU]$' order by city

Query the Name of any student in STUDENTS who scored higher than  75 Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
--------------------------------------------------------------------------
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER by right(name,3),id asc