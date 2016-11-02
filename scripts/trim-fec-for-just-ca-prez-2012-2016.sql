
WITH pres_ids AS
            (SELECT
                cm.cmte_id

             FROM cm
             INNER JOIN cn
                ON cn.cand_id = cm.cand_id
             WHERE
                -- committee type is Presidential
                  cm.cmte_tp = 'P'
                AND
                -- committee is the principal committee
                  cm.cmte_dsgn = 'P'
                AND
                -- just 2012 and 2016 races
                  cn.cand_election_yr in (2012, 2016)
              -- done with the WHERE

              -- gratuitous GROUP BY. We just need to remove
              -- multiple committee entries
              GROUP BY cm.cmte_id
             )

-- Now we get to the main query
DELETE FROM indiv
WHERE
    indiv.state != 'CA'
     OR indiv.cmte_id NOT IN pres_ids
;
