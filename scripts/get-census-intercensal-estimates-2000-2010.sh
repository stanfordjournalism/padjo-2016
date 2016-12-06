# https://www.census.gov/popest/data/intercensal/county/CO-EST00INT-alldata.html

echo "Downloading the CSVs from the Census site..."
wget -r --level 1 \
    --no-directories \
    --no-clobber \
    -e robots=off \
    --accept csv \
    https://www.census.gov/popest/data/intercensal/county/CO-EST00INT-alldata.html

echo "Combine all the CSVs into one TSV file"
csvstack -e latin1 *.csv | csvformat -T > all.states.tsv

echo "Set us up the database and estimates table"

echo '
DROP TABLE IF EXISTS estimates;
CREATE TABLE estimates (
    "SUMLEV" VARCHAR(10) NOT NULL,
    "STATE" VARCHAR(3) NOT NULL,
    "COUNTY" VARCHAR(10) NOT NULL,
    "STNAME" VARCHAR(30) NOT NULL,
    "CTYNAME" VARCHAR(100) NOT NULL,
    "YEAR" INTEGER NOT NULL,
    "AGEGRP" INTEGER NOT NULL,
    "TOT_POP" INTEGER NOT NULL,
    "TOT_MALE" INTEGER NOT NULL,
    "TOT_FEMALE" INTEGER NOT NULL,
    "WA_MALE" INTEGER NOT NULL,
    "WA_FEMALE" INTEGER NOT NULL,
    "BA_MALE" INTEGER NOT NULL,
    "BA_FEMALE" INTEGER NOT NULL,
    "IA_MALE" INTEGER NOT NULL,
    "IA_FEMALE" INTEGER NOT NULL,
    "AA_MALE" INTEGER NOT NULL,
    "AA_FEMALE" INTEGER NOT NULL,
    "NA_MALE" INTEGER NOT NULL,
    "NA_FEMALE" INTEGER NOT NULL,
    "TOM_MALE" INTEGER NOT NULL,
    "TOM_FEMALE" INTEGER NOT NULL,
    "NH_MALE" INTEGER NOT NULL,
    "NH_FEMALE" INTEGER NOT NULL,
    "NHWA_MALE" INTEGER NOT NULL,
    "NHWA_FEMALE" INTEGER NOT NULL,
    "NHBA_MALE" INTEGER NOT NULL,
    "NHBA_FEMALE" INTEGER NOT NULL,
    "NHIA_MALE" INTEGER NOT NULL,
    "NHIA_FEMALE" INTEGER NOT NULL,
    "NHAA_MALE" INTEGER NOT NULL,
    "NHAA_FEMALE" INTEGER NOT NULL,
    "NHNA_MALE" INTEGER NOT NULL,
    "NHNA_FEMALE" INTEGER NOT NULL,
    "NHTOM_MALE" INTEGER NOT NULL,
    "NHTOM_FEMALE" INTEGER NOT NULL,
    "H_MALE" INTEGER NOT NULL,
    "H_FEMALE" INTEGER NOT NULL,
    "HWA_MALE" INTEGER NOT NULL,
    "HWA_FEMALE" INTEGER NOT NULL,
    "HBA_MALE" INTEGER NOT NULL,
    "HBA_FEMALE" INTEGER NOT NULL,
    "HIA_MALE" INTEGER NOT NULL,
    "HIA_FEMALE" INTEGER NOT NULL,
    "HAA_MALE" INTEGER NOT NULL,
    "HAA_FEMALE" INTEGER NOT NULL,
    "HNA_MALE" INTEGER NOT NULL,
    "HNA_FEMALE" INTEGER NOT NULL,
    "HTOM_MALE" INTEGER NOT NULL,
    "HTOM_FEMALE" INTEGER NOT NULL
);

' | sqlite3 censuspop.sqlite


echo "Importing all.states.tsv into estimates table"

echo "
.separator \"\t\"
.import all.states.tsv estimates

DELETE FROM estimates WHERE SUMLEV = 'SUMLEV';
" | sqlite3 censuspop.sqlite


# using the key in the documentation, translate
# YEAR variable to something human-readable:
# https://www.census.gov/popest/data/intercensal/county/files/CO-EST00INT-ALLDATA.pdf
echo "Fix up the year values"

echo "
DELETE FROM estimates WHERE year IN (1, 12);

UPDATE estimates
SET year = CASE
    WHEN year = 2 THEN 2000
    WHEN year = 3 THEN 2001
    WHEN year = 4 THEN 2002
    WHEN year = 5 THEN 2003
    WHEN year = 6 THEN 2004
    WHEN year = 7 THEN 2005
    WHEN year = 8 THEN 2006
    WHEN year = 9 THEN 2007
    WHEN year = 10 THEN 2008
    WHEN year = 11 THEN 2009
    WHEN year = 13 THEN 2010
END;
" | sqlite3 censuspop.sqlite


# Index the table for faster grouping
sqlite3 censuspop.sqlite \
    "CREATE INDEX state_county_year_idx ON estimates(state, county, year);"

sqlite3 censuspop.sqlite -csv -header "
WITH totals AS (
    SELECT year,
        state AS state_fips,
        county AS county_fips,
        stname AS state,
        ctyname AS county,
        tot_pop AS total,
        tot_female AS female,
        tot_male AS male,
        ia_male + ia_female AS alaskan_or_am_indian,
        aa_male + aa_female AS asian,
        ba_male + ba_female AS black,
        h_male + h_female AS hispanic,
        tom_male + tom_female AS mixed,
        na_male + na_female AS pacific_islander,
        wa_male + wa_female AS white
        FROM estimates
        WHERE AGEGRP = 99
)
SELECT year, state_fips, county_fips, state, county,
    total,
    ROUND(100.0 * female / total, 1) AS female,
    ROUND(100.0 * male / total, 1) AS male,
    ROUND(100.0 * alaskan_or_am_indian / total, 1) AS alaskan_or_am_indian,
    ROUND(100.0 * asian / total, 1) AS asian,
    ROUND(100.0 * black / total, 1) AS black,
    ROUND(100.0 * hispanic / total, 1) AS hispanic,
    ROUND(100.0 * mixed / total, 1) AS mixed,
    ROUND(100.0 * pacific_islander / total, 1) AS pacific_islander,
    ROUND(100.0 * white / total, 1) AS white
FROM totals
ORDER BY state, county, year;
" > intercensal_county_estimates.csv




