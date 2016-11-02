-- This script assumes you've managed to acquire a database of
-- FEC bulk data, with the table and field names exactly as
-- stated in the FEC documentation, for better or worse


-- What this SQL code does is slim the database so that it contains
-- boilerplate candidate/committee information, as well as only individual
-- contribution data for people contributing to Utah's House and Senate
-- races, as well as Utah residents contributing to presidential candidates

DROP TABLE oppexp;
DROP TABLE pas2;
DROP TABLE indexps;
DROP TABLE oth;



WITH relevant_ids AS
            (SELECT
                cm.cmte_id,
                cm.cmte_tp,

                cn.cand_office_st -- meanwhile, cand_office_st refers
                                  -- to the state that the office serves,
                                  -- e.g. a Texas Senator. For president, it
                                  -- is always 'US'
             FROM cm
             INNER JOIN cn
                ON cn.cand_id = cm.cand_id
             WHERE
                -- committee type is Presidential/Senate/House
                 (cm.cmte_tp IN('P', 'S', 'H')) -- pres/house/senate
                AND
                -- committee is the principal committee
                  cm.cmte_dsgn = 'P'
                AND
                -- Candidates can run for multiple years, we want
                -- just 2012, 2014, and 2016 races
                  (cn.cand_election_yr BETWEEN 2012 AND 2016)
              -- done with the WHERE

              -- gratuitous GROUP BY. We just need to remove
              -- multiple committee entries
              GROUP BY cm.cmte_id, cm.cmte_tp, cm.cmte_st, cn.cand_office_st
             ),

    -- create a table of committee IDs that are all presidential
    -- committee IDs, regardless of home state, e.g McMullin and Trump
    presidential_ids AS
        (SELECT cmte_id
         FROM relevant_ids
         WHERE cmte_tp = 'P'),

    -- create a table of committee IDs that are presidential
    -- committee IDs...but just commitees based in Utah, e.g. McMullin and Romney
    -- utah_pres_ids AS
    --     (SELECT cmte_id
    --      FROM relevant_ids
    --      WHERE cmte_tp = 'P' AND cmte_st = 'UT'),

    -- create a table of committee IDs that are just for Utah state
    -- and house campaigns
    utah_state_ids AS
        (SELECT cmte_id
         FROM relevant_ids
         -- note that cand_office_st of NOT `US' is always
         -- going to be a state position, but no problem in
         -- being explicit by saying "no president" committees
         WHERE cmte_tp != 'P' AND cand_office_st = 'UT')

-- Now we get to the main query
DELETE FROM indiv
WHERE
    NOT(
        -- not individuals whose contributions
        --  are earmarked to a Utah senate/house committee
        indiv.cmte_id IN utah_state_ids
        OR
        -- not individuals who reside in Utah and who
        --  contributed to one of the presidential campaign committees
        indiv.state = 'UT' AND indiv.cmte_id IN presidential_ids
    )
    -- in other words
    -- delete all individual contribution records
    -- in which the record neither has:
    --   a contribution  to a Utah House/Senate candidate
    --   a Utah-state resident donating to any presidental candidate
;



