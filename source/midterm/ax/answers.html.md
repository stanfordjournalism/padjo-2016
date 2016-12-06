# Match the query

1. 1B
2. 2A
3. 3C
4. 4B
5. 5B
6. 6A
7. 7B
8. 8C
9. 9A
10. 10B
11. 11B


--------


# Write out the query

### 1.
~~~sql
SELECT *
FROM homes
WHERE 
  owner_name = 'Carolina';
~~~

### 2.

~~~sql
SELECT * 
FROM people
WHERE sex = 'M' 
ORDER BY 
  age DESC
~~~

### 3.


~~~sql
SELECT SUM(value)
FROM homes;
~~~

### 4.

~~~sql
SELECT eyes, 
  COUNT(*) AS the_count
FROM people
GROUP BY eyes
ORDER BY the_count ASC
~~~

### 5.

~~~sql
SELECT homes.*
FROM homes
INNER JOIN 
  people ON
  people.name = homes.owner_name
WHERE people.eyes = 'brown'
  AND people.sex = 'M';
~~~

# Twitter joining


### T1.

~~~sql
SELECT COUNT(*) AS tcount
FROM tweets
WHERE text LIKE '%vote%'
~~~

### T2 (Extra credit).

~~~sql
SELECT tag, 
  COUNT(*) AS hcount
FROM tw_hashtags
INNER JOIN 
  tweets ON
    tweets.ID = tw_hashtags.tweet_ID
WHERE tweets.screen_name = 'realdonaldtrump'
  AND STRFTIME('%H', time_tweeted) BETWEEN '00' AND '05'
GROUP BY tag
ORDER BY hcount DESC
LIMIT 5;
~~~

# Police-officer involved shootings

### P1.


~~~sql
SELECT "PERSON RACE", 
  "DEPUTY RACE", 
  COUNT(*) AS icount
FROM deputies
  INNER JOIN people
    ON
      deputies."INCIDENT NUMBER" = people."INCIDENT NUMBER"
GROUP BY 
  "PERSON RACE", "DEPUTY RACE"
ORDER BY 
  icount DESC
~~~





