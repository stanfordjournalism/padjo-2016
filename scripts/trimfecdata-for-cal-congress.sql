-- OLD?

DELETE FROM indiv
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE != 'P' AND CAND_OFFICE_ST = 'CA')
);


DELETE FROM oppexp
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE != 'P' AND CAND_OFFICE_ST = 'CA')
);

DELETE FROM pas2
WHERE CMTE_ID
    NOT IN (
    SELECT CAND_PCC
        FROM cn
        WHERE
            CAND_PCC IS NOT NULL
            AND (CAND_OFFICE != 'P' AND CAND_OFFICE_ST = 'CA')
);


DELETE FROM indexps
WHERE can_off_sta != 'CA';

