update
    INDIV
SET transaction_dt =
    substr(transaction_dt, 5, 4) || '-' ||
    substr(transaction_dt, 1,2) || '-' ||
    substr(transaction_dt, 3, 2)

WHERE length(transaction_dt) = 8;


update
    oth
SET transaction_dt =
    substr(transaction_dt, 5, 4) || '-' ||
    substr(transaction_dt, 1,2) || '-' ||
    substr(transaction_dt, 3, 2)

WHERE length(transaction_dt) = 8;


update
    pas2
SET transaction_dt =
    substr(transaction_dt, 5, 4) || '-' ||
    substr(transaction_dt, 1,2) || '-' ||
    substr(transaction_dt, 3, 2)

WHERE length(transaction_dt) = 8;


update
    webk
SET CVG_END_DT =
    substr(CVG_END_DT, 7, 4) || '-' ||
    substr(CVG_END_DT, 1,2) || '-' ||
    substr(CVG_END_DT, 4, 2)

WHERE length(CVG_END_DT) = 10;

update
    weball
SET CVG_END_DT =
    substr(CVG_END_DT, 7, 4) || '-' ||
    substr(CVG_END_DT, 1,2) || '-' ||
    substr(CVG_END_DT, 4, 2)

WHERE length(CVG_END_DT) = 10;


update
    indexps
SET rec_dat =
    substr(rec_dat, 7, 4) || '-' ||
    substr(rec_dat, 1,2) || '-' ||
    substr(rec_dat, 4, 2)

WHERE length(rec_dat) = 10;


update
    indexps
SET exp_dat =
    substr(exp_dat, 7, 4) || '-' ||
    substr(exp_dat, 1,2) || '-' ||
    substr(exp_dat, 4, 2)

WHERE length(exp_dat) = 10;


update
    oppexp
SET transaction_dt =
    substr(transaction_dt, 7, 4) || '-' ||
    substr(transaction_dt, 1,2) || '-' ||
    substr(transaction_dt, 4, 2)

WHERE length(transaction_dt) = 10;

update indexps
SET exp_amo = replace(replace(exp_amo, ',', ''), '$', '');
update indexps
SET agg_amo = replace(replace(agg_amo, ',', ''), '$', '');

# time to clean up

