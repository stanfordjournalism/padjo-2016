# Officer-involved shootings


## Data

These data tables are example, simplified excerpts from the L.A. county shooting incidents. They do not represent the LA county's actual data but have been simplified for exam results.


### deputies




| INCIDENT NUMBER | INCIDENT DATE |     INCIDENT TYPE     | DEPUTY RACE | DEPUTY AGE | YEARS OF SERVICE | # OF PREVIOUS SHOOTINGS |
|-----------------|---------------|-----------------------|-------------|------------|------------------|-------------------------|
|         1000914 | 2016-10-31    | HIT SHOOTING INCIDENT | FILIPINO    |         47 |                0 |                       0 |
|         1000914 | 2016-10-31    | HIT SHOOTING INCIDENT | HISPANIC    |         30 |                1 |                       0 |
|         1000684 | 2016-02-14    | HIT SHOOTING INCIDENT | HISPANIC    |         32 |                8 |                       0 |
|         1000874 | 2016-09-08    | HIT SHOOTING INCIDENT | WHITE       |         26 |                4 |                       0 |
|         1000450 | 2013-07-19    | HIT SHOOTING INCIDENT | HISPANIC    |         44 |               18 |                       1 |
{:.table-sql}




### people

A list of people (who were shot) connected to each shooting incident.


`0` and `1` are meant to stand for "false" and "true", respectively.



|  INCIDENT NUMBER | PERSON AGE | PERSON RACE | DECEASED | WOUNDED | MENTAL HEALTH CONCERNS | ON PAROLE  |
|------------------+------------+-------------+----------+---------+------------------------+------------|
|  1000472         | 46         | WHITE       | 0        | 0       | 0                      | 0          |
|  1000380         | 35         | HISPANIC    | 0        | 0       | 0                      | 1          |
|  1000467         | 49         | BLACK       | 1        | 0       | 0                      | 1          |
|  1000332         | 25         | HISPANIC    | 0        | 0       | 0                      | 1          |
|  1000654         | 53         | BLACK       | 1        | 0       | 0                      | 0       |
{:.table-sql}



## Example

To get the race of the deputy and person in the 5 most recent incidents in which the person died:

(remember to quote fields that have non-alphanumeric characters, i.e. `"DEPUTY RACE"`)


~~~sql
SELECT people."INCIDENT NUMBER",
  "INCIDENT DATE", 
  "PERSON RACE", 
  "DEPUTY RACE"
FROM  people
INNER JOIN 
  deputies ON
     deputies."INCIDENT NUMBER" = people."INCIDENT NUMBER"
WHERE "DECEASED" = 1
ORDER BY "INCIDENT DATE"  DESC
LIMIT 5;
~~~

| INCIDENT NUMBER | INCIDENT DATE | PERSON RACE | DEPUTY RACE |
|-----------------|---------------|-------------|-------------|
|         1000896 | 2016-10-14    | HISPANIC    | HISPANIC    |
|         1000895 | 2016-10-14    | BLACK       | WHITE       |
|         1000894 | 2016-10-14    | WHITE       | HISPANIC    |
|         1000874 | 2016-09-14    | WHITE       | WHITE       |
|         1000874 | 2016-09-14    | WHITE       | WHITE       |
{:.table-sql}



## Questions

### 1. Get the count of incidents grouped by the person's race and the deputy's race, in descending order of incident count 


(3 points)


Write out this query. It requires a `JOIN` and `GROUP BY`. And remember to quote field names, i.e. `DEPUTY RACE`, when necessary. And alias the count of incidents as `'icount'` (see the header below)

Example result:


| PERSON RACE | DEPUTY RACE | icount |
|-------------|-------------|--------|
| HISPANIC    | HISPANIC    |     65 |
| HISPANIC    | WHITE       |     42 |
| BLACK       | HISPANIC    |     25 |
| BLACK       | WHITE       |     23 |
| WHITE       | WHITE       |      7 |
| WHITE       | HISPANIC    |      3 |
{:.table-sql}





### 2. Essay SQL

(6 points)

A lot of police shootings analyses focuses on race of officer and subject. But there are often many other aspects to the data.


1. Describe a question you have of the data.
2. Tell me why it's interesting, or at least more interesting to you beyond total number of shootings and race of the persons involved.
3. Write out the SQL query using the `deputies` and/or the `people` tables.
4. Sketch out the table results. They don't have to be correct answers, since you don't have the whole data at hand. I'm looking to see what you _expect_ the data's _format_ to look like, based on your query.

Your query for #4 doesn't have to be as complicated as the example or previous problem. But it should have at least:

1. A filtering of the data by some condition
2. An aggregation (count, average, max, min) **or** a JOIN statement between people and deputies.
3. Be selective of the columns, i.e. don't use `*`


In other words, I want something more complicated than this:

~~~sql
SELECT * FROM deputies
LIMIT 5;
~~~




