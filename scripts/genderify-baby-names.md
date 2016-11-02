


DROP TABLE IF EXISTS gendered_names;
CREATE TABLE `gendered_names` (
    `year`  NUMERIC NOT NULL,
    `state` TEXT NOT NULL,
    `name`  TEXT NOT NULL,
    `total_babies` NUMERIC NOT NULL,
    `primary_sex`   TEXT NOT NULL,
  `primary_sex_ratio` NUMERIC NOT NULL,
  `per_100k_in_state` NUMERIC NOT NULL
);

CREATE INDEX "gendered_names_idx_name_state"
  ON gendered_names(name, state);
CREATE INDEX "gendered_names_idx_state"
  ON gendered_names(state);

-- make guys names and insert
INSERT INTO gendered_names
WITH statesums AS(
  SELECT state, year, sum(count) AS state_total
  FROM babynames
  GROUP BY state,year
), 
namesums AS (
SELECT state, year, name, sum(count) as total_babies
FROM babynames
GROUP BY state,year,name)

SELECT namesums.year, namesums.state, namesums.name,
  namesums.total_babies,
  'M' as "primary_sex",
  ROUND(100.0 * babynames.count / total_babies, 1)  AS primary_sex_ratio,
  ROUND(100000.0 * namesums.total_babies / statesums.state_total, 1) AS
    per_100k_in_state
FROM babynames
INNER JOIN namesums
  USING(state,year,name)
INNER JOIN statesums
  USING(state,year)
WHERE babynames.sex = 'M'
  AND primary_sex_ratio > 50
order by year ASC, state ASC, 
  primary_sex ASC,
total_babies DESC, primary_sex_ratio DESC, name ASC;



-- make girl names
INSERT INTO gendered_names
WITH statesums AS(
  SELECT state, year, sum(count) AS state_total
  FROM babynames
  GROUP BY state,year
), 

 namesums AS (
SELECT state, year, name, sum(count) as total_babies
FROM babynames
GROUP BY state,year,name)
SELECT namesums.year, namesums.state, namesums.name,
  namesums.total_babies,
  'F' as "primary_sex",
  ROUND(100.0 * babynames.count / total_babies, 1)  AS primary_sex_ratio,
  ROUND(100000.0 * namesums.total_babies / statesums.state_total, 1) AS
    per_100k_in_state
FROM babynames
INNER JOIN namesums
  USING(state,year,name)
INNER JOIN statesums
  USING(state, year)
WHERE babynames.sex = 'F'
  AND primary_sex_ratio > 50
order by year ASC, state ASC, 
  primary_sex ASC,
total_babies DESC, primary_sex_ratio DESC, name ASC;


DROP TABLE babynames;
