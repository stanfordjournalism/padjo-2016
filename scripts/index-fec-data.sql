CREATE INDEX cm_idx_CMTE_ID ON cm(CMTE_ID);
CREATE INDEX cm_idx_CMTE_NM ON cm(CMTE_NM);
CREATE INDEX cm_idx_CMTE_CAND_ID ON cm(CAND_ID);


CREATE INDEX cn_idx_CAND_ID ON cn(CAND_ID);
CREATE INDEX cn_idx_CAND_NAME ON cn(CAND_NAME);
CREATE INDEX cn_idx_CAND_PTY_AFFILIATION ON cn(CAND_PTY_AFFILIATION);
CREATE INDEX cn_idx_CAND_PCC ON cn(CAND_PCC);

CREATE INDEX ccl_idx_cand_cmte_ids ON ccl(CAND_ID, CMTE_ID);
CREATE INDEX ccl_idx_cand_id_and_designation ON ccl(CAND_ID, CMTE_DSGN);



create index weball_idx_cand_id ON weball(cand_id);
create index weball_idx_cvg_end_dt ON weball(cvg_end_dt);

create index webk_idx_cmte_id ON webk(cmte_id);
create index webk_idx_cvg_end_dt ON webk(cvg_end_dt);



CREATE INDEX oth_idx_CMTE_ID ON oth(CMTE_ID);
CREATE INDEX OTH_idx_OTHER_ID ON oth(OTHER_ID);
CREATE INDEX OTH_idx_NAME ON oth(NAME);
CREATE INDEX oth_idx_TRANSACTION_DT ON oth(TRANSACTION_DT);


CREATE INDEX pas2_idx_CMTE_ID ON pas2(CMTE_ID);
CREATE INDEX pas2_idx_OTHER_ID ON pas2(OTHER_ID);
CREATE INDEX pas2_idx_NAME ON pas2(NAME);
CREATE INDEX pas2_idx_TRANSACTION_DT ON pas2(TRANSACTION_DT);


CREATE INDEX oppexp_idx_CMTE_ID_and_dateON oppexp(CMTE_ID, TRANSACTION_DT);
CREATE INDEX oppexp_idx_TRANSACTION_DT ON oppexp(TRANSACTION_DT);
CREATE INDEX oppexp_idx_recipient_name ON oppexp(name);


CREATE INDEX indiv_idx_CMTE_ID_date ON indiv(CMTE_ID, TRANSACTION_DT);
CREATE INDEX indiv_idx_TRANSACTION_DT ON indiv(TRANSACTION_DT);
CREATE INDEX indiv_idx_transdate ON indiv(TRANSACTION_DT);
CREATE INDEX indiv_idx_employer ON indiv(employer);
create index indiv_idx_occupation ON indiv(occupation);


