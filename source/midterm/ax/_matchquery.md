
### 1. From "people", select all the fields for all the males

The result:

|  name   | sex | age | eyes   |
|---------+-----+-----+--------|
|  Austin | M   | 10  | blue   |
|  Blair  | M   | 32  | brown  |
{:.table-sql}


#### A.

~~~sql
SELECT *
FROM people ;
~~~


#### B.

~~~sql
SELECT *
FROM people 
WHERE sex = "M";
~~~

#### C.

~~~sql
SELECT 'M'
FROM people;
~~~



---------------


### 2. List the values of the first 3 "homes", in order of value

The result:

|  value  |
|---------|
|  800    |
|  500    |
|  400    |
{:.table-sql}



#### A.

~~~sql
SELECT value
FROM homes
ORDER BY 
  value DESC 
LIMIT 3;
~~~


#### B. 


~~~sql
SELECT *
FROM homes
LIMIT 3
ORDER BY 
  value DESC; 
~~~


#### C. 


~~~sql
SELECT *
FROM homes
WHERE value > 400;
~~~



### 3. Count the number of people with brown eyes


~~~sql
SELECT COUNT(*)
FROM people;
~~~

|  COUNT(*)  |
|------------|
|  5         |
{:.table-sql}


### 4. Count the number of people grouped by sex, in descending order of count


|  sex | the_count  |
|------+------------|
|  F   | 3          |
|  M   | 2          |
{:.table-sql}



~~~sql
SELECT sex, COUNT(*) AS the_count
FROM people
GROUP BY sex;
~~~



### 5. List all the fields for the people over 20, in order of descending age 

|  name     | sex | age | eyes   |
|-----------+-----+-----+--------|
|  Blair    | M   | 32  | brown  |
|  Carolina | F   | 28  | brown  |
|  Dani     | F   | 22  | blue   |
{:.table-sql}



~~~sql
SELECT *
FROM people
WHERE age > 20
ORDER BY age DESC;
~~~


### 6. List the sum of the value of homes by area, in order of the sum per area.




|  area    | total  |
|----------+--------|
|  urban   | 1000   |
|  suburbs | 900    |
|  country | 400    |
{:.table-sql}



~~~sql
SELECT area, 
  SUM(value) AS total
FROM homes 
GROUP BY area
ORDER BY total DESC;
~~~


### 7. Join all the "homes" to their proper owner in "people", in reverse alphabetical order of the owner's name


|  owner_name | area    | value | name     | sex | age | eyes   |
|-------------+---------+-------+----------+-----+-----+--------|
|  Eliza      | urban   | 100   | Eliza    | F   | 16  | blue   |
|  Dani       | country | 400   | Dani     | F   | 22  | blue   |
|  Carolina   | suburbs | 100   | Carolina | F   | 28  | brown  |
|  Carolina   | urban   | 200   | Carolina | F   | 28  | brown  |
|  Blair      | suburbs | 800   | Blair    | M   | 32  | brown  |
|  Austin     | urban   | 500   | Austin   | M   | 10  | blue   |
{:.table-sql}

~~~sql
SELECT * 
FROM homes
INNER JOIN 
  people ON 
  people.name = homes.owner_name 
ORDER BY homes.owner_name DESC;
~~~



### 8. Find the homes owned by men, in descending order of value



~~~sql
SELECT 
  owner_name, area, value
FROM homes
INNER JOIN 
  people ON 
  people.name = owner_name 
WHERE sex = 'M'
ORDER BY owner_name DESC;
~~~

|  owner_name | area    | value  |
|-------------+---------+--------|
|  Blair      | suburbs | 800    |
|  Austin     | urban   | 500    |
{:.table-sql}


### 9. Count the number of homes owned by women


|  COUNT(*)  |
|------------|
|  4         |
{:.table-sql}


~~~sql
SELECT COUNT(*) 
FROM homes
INNER JOIN 
  people ON 
  homes.owner_name = people.name
WHERE sex = 'F';
~~~


### 10. List the count and total value of homes, grouped by owner, in descending order of total value



|  owner_name | total_value | total_count  |
|-------------+-------------+--------------|
|  Blair      | 800         | 1            |
|  Austin     | 500         | 1            |
|  Dani       | 400         | 1            |
|  Carolina   | 300         | 2            |
|  Eliza      | 100         | 1            |
{:.table-sql}



~~~sql
SELECT owner_name, 
  SUM(value) AS total_value,
  COUNT(*) AS total_count
FROM homes
INNER JOIN 
  people ON 
  homes.owner_name = people.name
GROUP BY owner_name
ORDER BY total_value DESC;
~~~



