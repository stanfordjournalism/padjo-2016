
## Complete the query


Fill in the missing code where the blanks are to get the result. The blanks just indicate that something is missing, not that only one thing is missing.


-----------------------

### 1. 

~~~sql
SELECT 100 AS _________, 200 __________;
~~~


| hello | world |
|-------|-------|
|   100 |   200 |
{:.table-sql}




### 2. 


~~~sql
SELECT ____
______ people
WHERE ____ > 20
ORDER BY age _____;
~~~

|  name     | sex | age | eyes   |
|-----------+-----+-----+--------|
|  Blair    | M   | 32  | brown  |
|  Carolina | F   | 28  | brown  |
|  Dani     | F   | 22  | blue   |
{:.table-sql}


### 3. 

~~~sql
SELECT _____________
FROM homes
ORDER BY value _____, 
  owner_name ______
LIMIT ___;
~~~


|  owner_name | value  |
|-------------+-----------|
|  Eliza      | 100       |
|  Carolina   | 100       |
{:.table-sql}


### 4.

~~~sql
SELECT sex, 
  COUNT(*) __________
FROM _____
INNER JOIN  homes
    ON people.name = ______
WHERE sex = 'F';
~~~


|  sex | the_count  |
|------+------------|
|  F   | 4          |
{:.table-sql}


### 5.
