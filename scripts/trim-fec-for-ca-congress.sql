
WITH cal_ids AS
            (SELECT
                cm.cmte_id

             FROM cm
             INNER JOIN cn
                ON cn.cand_id = cm.cand_id
             WHERE
                -- committee type is Congress
                  cm.cmte_tp IN ('H', 'S')
                AND
                -- committee is the principal committee
                  cm.cmte_dsgn = 'P'
                AND
                -- just 2012, 2014, 2016 races
                  cn.cand_election_yr in (2012, 2014, 2016)
                AND
                  cn.cand_office_st = 'CA'
              -- done with the WHERE

              -- gratuitous GROUP BY. We just need to remove
              -- multiple committee entries
              GROUP BY cm.cmte_id
             )

-- Now we get to the main query
DELETE FROM indiv
WHERE

    indiv.cmte_id NOT IN cal_ids # don't delete non californians
;

delete FROM indexps
WHERE indexps.can_off_sta != 'CA';

delete from oppexp
WHERE oppexp.cmte_id NOT IN cal_ids;

DROP TABLE pas2;
DROP TABLE oth;

