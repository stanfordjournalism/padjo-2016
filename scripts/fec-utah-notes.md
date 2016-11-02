









dont' know what this is....



## Counting by committee

~~~sql
select cm.cmte_id, cm.cmte_nm, cm.cmte_st,
count(*)  as cx,
sum(transaction_amt) as tx
from indiv
inner join cm ON
    indiv.cmte_id = cm.cmte_id
WHERE indiv.transaction_dt > 2016
group by indiv.cmte_id
order by tx desc
~~~


## delete all other expense tables







## find all individual donations where someone donated to outside their state

~~~sql
select cm.cmte_id, cm.cmte_nm, indiv.state, count(*)  as cx
from indiv
inner join cm ON
    indiv.cmte_id = cm.cmte_id
    AND cm.cmte_tp != 'P'
inner join cn ON
    cn.cand_pcc = cm.cmte_id
where cn.cand_office_st != indiv.state
group by indiv.cmte_id, indiv.state
order by cx desc
~~~




# More complex cull
## Select all utah committee IDs, that are based in UTAH



WITH utah_comm_ids AS
            (SELECT cm.cmte_id
             FROM cm
             INNER JOIN cn
                ON cn.cand_id = cm.cand_id
             WHERE cn.CAND_ST = 'UT'
                AND cn.CAND_ELECTION_YR BETWEEN 2012 AND 2016

             GROUP BY cm.cmte_id
            )
DELETE FROM indiv
    WHERE indiv.STATE != 'UT'
         AND indiv.cmte_id NOT IN utah_comm_ids;




WITH    pres_comm_ids AS
            (SELECT cm.cmte_id
             FROM cm
             INNER JOIN cn
                ON cn.cand_id = cm.cand_id
                --AND ccl.cmte_id = cm.cmte_id
             WHERE cn.CAND_OFFICE = 'P'

                AND cn.CAND_ELECTION_YR BETWEEN 2012 AND 2016
             GROUP BY cm.cmte_id
            )



-- Is everything OK?
select
indiv.cmte_id, cm.cmte_nm,
cn.cand_name,
cm.cmte_tp,
count(*) as rowcount
from indiv
INNER JOIN cm
    ON cm.cmte_id = indiv.cmte_id
INNER JOIN cn
    on cm.cand_id = cn.cand_id
WHERE cm.cmte_tp NOT IN('H', 'S', 'P')
    and indiv.transaction_dt >= 2015
GROUP BY indiv.cmte_id, cm.cmte_nm,
    cn.cand_name, cm.cmte_tp
order by rowcount DESC

