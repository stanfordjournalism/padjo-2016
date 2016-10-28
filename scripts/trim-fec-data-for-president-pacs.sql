DROP TABLE IF EXISTS indiv;

DELETE FROM oppexp
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE = 'P')
);

DELETE FROM pas2
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE = 'P')
);


DELETE FROM oth
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE = 'P')
);

DELETE FROM indexps
WHERE can_off != 'P';

