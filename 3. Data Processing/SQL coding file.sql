-- Databricks notebook source
-I wanted to see the whole table before I start doing any analysis on it
SELECT*
From brightcase.study.bright_tv_user_profile
LIMIT 10;

--CHECKING FOR DUPLICATES IN MY DATA
Select UserID,
        COUNT(*) AS duplicate_count
FROM brightcase.study.bright_tv_user_profile
GROUP BY UserID
HAVING COUNT(*) > 1;

--I am checking the size of the data
SELECT 
        Count(*) AS  number_of_row,
        COUNT(DISTINCT UserID) AS number_subs
FROM brightcase.study.bright_tv_user_profile;

--ARE THERE ANY ROWS WHER USERID is NULL
SELECT COUNT(*) AS cnt
FROM brightcase.study.bright_tv_user_profile
WHERE UserID IS NULL;


--TO CHECK IF ALL 1000 ROWS AVE DISTINCTCT USERID if all are accumulated then they do
SELECT DISTINCT UserID
FROM brightcase.study.bright_tv_user_profile;


-------------------------------------------------------------------------------------
--Gender Checks
-------------------------------------------------------------------------------------
SELECT DISTINCT gender
FROM brightcase.study.bright_tv_user_profile;

--checking gender is Empty(space)
SELECT DISTINCT COUNT(*)
FROM brightcase.study.bright_tv_user_profile
WHERE gender=' ';
--218 where there is empty space

SELECT DISTINCT COUNT(*)
FROM brightcase.study.bright_tv_user_profile
WHERE gender='None';
----702 are none

---This helps us with code below
SELECT DISTINCT gender
FROM brightcase.study.bright_tv_user_profile;


SELECT 
        COUNT(DISTINCT userid) AS subs,
    CASE
        WHEN Gender = ' ' THEN 'None'
        ELSE Gender
    END AS Gender
FROM brightcase.study.bright_tv_user_profile
GROUP BY Gender;
-------------------------------------------------------------------------------------
--Race checks
-------------------------------------------------------------------------------------
--I want to know if by any chance if there is a Race that is  null
SELECT COUNT(*) as num_rows
FROM brightcase.study.bright_tv_user_profile
WHERE Race IS NULL;

SELECT DISTINCT Race
FROM brightcase.study.bright_tv_user_profile;

SELECT DISTINCT
        CASE
            WHEN Race = 'other' THEN 'None'
            WHEN Race =' ' THEN 'None'
        ELSE Race
END AS Ethnicity
FROM brightcase.study.bright_tv_user_profile;
-------------------------------------------------------------------------------------
--Province checks
-------------------------------------------------------------------------------------

SELECT DISTINCT Province
 FROM brightcase.study.bright_tv_user_profile;

--Other prov inces are fine but there is a space and none

SELECT DISTINCT
    CASE
        WHEN Province = ' ' THEN 'Uncategorized'
        WHEN Province = 'None' THEN 'Uncategorized'
    ELSE Province
    END AS Region
 FROM brightcase.study.bright_tv_user_profile;
-------------------------------------------------------------------------------------
--AGE
-------------------------------------------------------------------------------------
---check what is in my age column (range)
SELECT MIN(Age) AS min_age, ------0
       MAX(Age) AS max_age   -----114
 FROM brightcase.study.bright_tv_user_profile;


--check if I have columns where age is null
SELECT COUNT(*)
 FROM brightcase.study.bright_tv_user_profile
 WHERE Age IS NULL;

---we know some people might have the same age hence it is not necessary to check duplicates

SELECT COUNT(DISTINCT UserID) AS subs,
    CASE
        WHEN Age = 0 THEN 'Infants'
        WHEN Age BETWEEN 1 AND 12 THEN 'Kids'
        WHEN Age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN Age BETWEEN 20 AND 35 THEN 'Youth'
        WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
        WHEN Age BETWEEN 51 AND 65 THEN 'Elder'
        WHEN Age > 65 THEN 'Senior'
        END AS Age_groups
 FROM brightcase.study.bright_tv_user_profile
 GROUP BY age_groups;


---using cte
---COMBINING EVERYTHING INTO ONE
WITH user_profiles AS (
SELECT UserID,

    CASE
        WHEN Province = ' ' THEN 'Uncategorized'
        WHEN Province = 'None' THEN 'Uncategorized'
    ELSE Province
    END AS Region,

    Age,
    
    CASE                                             -----Turning my ager into age buckets
        WHEN Age = 0 THEN 'Infants'
        WHEN Age BETWEEN 1 AND 12 THEN 'Kids'
        WHEN Age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN Age BETWEEN 20 AND 35 THEN 'Youth'
        WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
        WHEN Age BETWEEN 51 AND 65 THEN 'Elder'
        WHEN Age > 65 THEN 'Senior'
        END AS Age_groups,

    
    CASE  ---Flagging the emails that when a legit email appeares then show as 1 and when an email is empty,null or none     flag as 0
        WHEN (Email IS NOT NULL) 
        OR (Email<>' ') 
        OR (Email NOT IN ('None')) THEN 1
        ELSE 0
    END AS Email_flag,



    CASE ---Flagginf my social media handles that when it is legit flag as 1 and when an social media is empty,null or none   flag as 0
        WHEN (`Social Media Handle` IS NOT NULL) OR (`Social Media Handle`!=' ') OR (`Social Media Handle` NOT IN ('None')) THEN 1
        ELSE 0
    END AS sm_flag,

     CASE
            WHEN Race ilike ('%other%') THEN 'None'
            WHEN Race =' ' THEN 'None'
        ELSE Race
    END AS Ethnicity,

    CASE
        WHEN Gender = ' ' THEN 'None'
        ELSE Gender
    END AS Gender


 FROM brightcase.study.bright_tv_user_profile
),
viewership AS (  
    SELECT 
    COALESCE(UserID0,userid4,0) AS UserID,   ---if there is no user id replace with 0

   ---DATES    
   To_DATE(RecordDate2) AS watch_date, ---Is to extract the date from the date from the timestamp in our table
    TO_CHAR(TO_DATE(RecordDate2), 'yyyyMM') AS month_id, ---TO_CHAR(): convertS a date into a string, TO_DATE(): Converts a string into a date
    MONTHNAME(RecordDate2) AS month_name,
    TO_CHAR(RecordDate2,'DD') AS day_of_week,
    DAYNAME(RecordDate2) AS day_name,
    CASE
        WHEN day_name IN ('Sat','Sun') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_classification,

  
  ----TIME
    DATE_FORMAT(RecordDate2, 'HH:mm:ss') AS watch_time,
    HOUR(RecordDate2) AS hour_of_day,

    CASE
        WHEN watch_time BETWEEN '00:00:00' AND '05:59:59' THEN 'Early Morning'
        WHEN watch_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN watch_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN watch_time BETWEEN '17:00:00' AND '29:59:59' THEN 'Evening'
    END AS time_of_day,

    DATE_FORMAT(`Duration 2`, 'HH:mm:ss') AS duration,
    CASE
        WHEN duration BETWEEN '00:05:00' AND '00:30:00' THEN 'Low Usage: <30 min'
        WHEN duration BETWEEN '00:30:01' AND '00:59:59' THEN 'Med Usage: Between 30 min and 60 min'
        WHEN duration > '00:59:59' THEN 'High Usage: >60'
        ELSE 'No Usage'
    END AS screen_time_bucket,

time_to_seconds(TIME(duration)) as duration_seconds,

    CASE
        WHEN Channel2 IN ('SawSee','Sawsee') THEN 'SawSee'
        WHEN Channel2 IN ('SuperSport Live Events','Live on SuperSport','Supersport Live Events', 'DStv Events 1','ICC Cricket World Cup 2011') THEN 'Live Events'
    ELSE Channel2
    END AS TV_channel

   


FROM brightcase.study.bright_tv_viewership
)
 SELECT COALESCE(A.UserID,B.UserID) AS sub_ID,
        watch_date,
        month_id,
        month_name,
        day_of_week,
        day_name,
        day_classification,
        watch_time,
        hour_of_day,
        time_of_day,
        duration,
        duration_seconds,
        screen_time_bucket,
        TV_channel,
        Region,
        Age,
        Age_groups,
        Email_flag,
        sm_flag,
        Ethnicity,
        --Ethnicity,
        Gender
 FROM viewership AS A
 LEFT JOIN user_profiles AS B
 ON A.UserID = B.UserID
 GROUP BY ALL;