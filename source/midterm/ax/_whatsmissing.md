


## What's missing?

Fill in the blank of the results.


### 1. 

~~~sql
SELECT 10000 + 10000 AS the_answer;
~~~

|       |
|-------|
| 20000 |
{:.table-sql}




### 2. 

~~~sql
SELECT * 
FROM homes
ORDER BY value DESC
LIMIT 2;
~~~


|        |         |     |
|--------|---------|-----|
| Blair  |         |     |
| Austin | urban   |     |
{:.table-sql}


### 3. 

~~~sql
SELECT name AS first_name, age 
FROM people
WHERE sex = 'M'
  OR age > 40
ORDER BY age DESC;
~~~


| first_name | age |
|------------|-----|
| Blair      |     |
|            |     |
{:.table-sql}


### 4. 

SELECT COUNT(*)
FROM people;

~~~sql
SELECT COUNT(*) AS num,
  SUM(age) as total_age
FROM people
WHERE sex = 'F';
~~~


|   |    |
|---|----|
|   | 66 |
{:.table-sql}



### 5.

~~~sql
SELECT COUNT(*) AS the_count,
  eyes AS eye_color, 
  sex AS sex
FROM people
GROUP BY eye_color, sex
ORDER BY sex, eye_color;
~~~



| the_count | eye_color | sex |
|-----------|-----------|-----|
|         2 |           |     |
|         1 |           |     |
|         1 |           |     |
|         1 | brown     | M   |
{:.table-sql}


### 6.

~~~sql
SELECT name, area, value
FROM people
INNER JOIN
  homes ON 
  homes.owner_name = people.name 
WHERE value > 200
ORDER BY value ASC;
~~~

|        |         |   |
|--------|---------|---|
| Dani   | country |   |
| Austin | urban   |   |
| Blair  | suburbs |   |
{:.table-sql}


### 7.

~~~sql
SELECT *
FROM homes
INNER JOIN
  people ON 
  homes.owner_name = people.name 
WHERE area = 'country'
ORDER BY value ASC;
~~~

| owner_name | area | value | name | sex | age | eyes |
|------------|------|-------|------|-----|-----|------|
|            |      |       |      | F   |     |      |
{:.table-sql}
