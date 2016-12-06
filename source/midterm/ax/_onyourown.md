


# Write out the query

The results are provided, just write the query to get the answer.

### Example

> List all the homes owned by women, in order of value

The results:

|  owner_name | area    | value  |
|-------------+---------+--------|
|  Dani       | country | 400    |
|  Carolina   | urban   | 200    |
|  Carolina   | suburbs | 100    |
|  Eliza      | urban   | 100    |
{:.table-sql}


The answer:


~~~sql
SELECT homes.*
FROM homes
INNER JOIN
  people
  ON people.name = homes.owner_name
WHERE people.sex = 'F'
ORDER BY value DESC;
~~~




### 1. List the homes owned by "Carolina"


~~~sql
SELECT *
FROM homes 
WHERE owner_name = 'Carolina';
~~~

|  owner_name | area    | value  |
|-------------+---------+--------|
|  Carolina   | suburbs | 100    |
|  Carolina   | urban   | 200    |
{:.table-sql}



### 2. List all the men in order of oldest to youngest


~~~sql
SELECT *
FROM people 
WHERE sex = 'M'
ORDER BY age DESC;
~~~

|  name   | sex | age | eyes   |
|---------+-----+-----+--------|
|  Blair  | M   | 32  | brown  |
|  Austin | M   | 10  | blue   |
{:.table-sql}



### 3. Sum the values of homes


~~~sql
SELECT SUM(value)
FROM homes;
~~~

|  SUM(value)  |
|--------------|
|  2300        |
{:.table-sql}



### 4. Show the count of people grouped by eye color, in ascending order of eye color


~~~sql
SELECT eyes, COUNT(*) the_count
FROM people
GROUP BY eyes
ORDER BY the_count ASC;
~~~

|  eyes  | the_count  |
|--------+------------|
|  brown | 2          |
|  blue  | 3          |
{:.table-sql}


### 5. Show all homes owned by brown-eyed men



~~~sql
SELECT homes.* 
FROM homes
INNER JOIN people 
  ON people.name = homes.owner_name 
WHERE eyes = 'brown';
~~~

|  owner_name | area    | value  |
|-------------+---------+--------|
|  Blair      | suburbs | 800    |
|  Carolina   | suburbs | 100    |
|  Carolina   | urban   | 200    |
{:.table-sql}
