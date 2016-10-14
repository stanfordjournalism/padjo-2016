https://github.com/tthibo/SQL-Tutorial/blob/master/tutorial_files/part1.textile
http://swcarpentry.github.io/sql-novice-survey/01-select/


- Select all columns from a table using a wildcard
- Select three columns
- Select a column multiple times
- Select a literal string
- Select a mathematical operation

- ORDER BY a column name
- ORDER BY a column name in ascending order
- ORDER BY a column name in descending order
- ORDER BY two columns
- ORDER BY a non-selected column

- LIMIT https://www.sqlite.org/lang_select.html#limitoffset

--------------

# WHERE clause and True/False conditions

Provide a constraint

- 1 = 1
- 1 = 0
- "name" = 'Daniel'
- "name" = 'Daniel' AND "name" = 'Dan'
- Use parentheses
- greater than/less than
- OR
- NOT

# Fuzzy matching

- LIKE
- IN
- BETWEEN


# Data types and literal values

- Difference between 5, "5", '5'
- CAST

# Core/simple functions

https://www.sqlite.org/lang_corefunc.html

- ABS(X): https://www.sqlite.org/lang_corefunc.html#abs
- IFNULL(X,Y): https://www.sqlite.org/lang_corefunc.html#ifnull
- LENGTH(X): https://www.sqlite.org/lang_corefunc.html#length
- LTRIM
- MAX
- MIN
- PRINTF
- REPLACE
- ROUND
- RTRIM, TRIM
- LOWER, UPPER

# Aliasing


# Group By
# Aggregate functions
https://www.sqlite.org/lang_aggfunc.html

- COUNT http://stackoverflow.com/questions/1221559/count-vs-count1
- MAX
- MIN
- SUM
- GROUP_CONCAT
- AVG

Do not select columns that you aren't either aggregating or grouping by.


# Subqueries

- Select from the result of another query

# JOINs

- Unique IDs
- 

