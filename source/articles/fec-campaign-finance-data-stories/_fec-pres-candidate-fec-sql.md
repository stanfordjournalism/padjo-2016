SELECT UPPER(can_nam) AS cname, sup_opp,

ROUND(SUM(exp_amo) / 1000.0) as total_spent 
FROM 
indexps WHERE cname LIKE '%CLINTON%'
GROUP BY cname, sup_opp
ORDER BY total_spent DESC 