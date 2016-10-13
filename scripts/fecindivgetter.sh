curl -O ftp://ftp.fec.gov/FEC/2016/cm16.zip
curl -O ftp://ftp.fec.gov/FEC/2016/cn16.zip
curl -O ftp://ftp.fec.gov/FEC/2016/oppexp16.zip


curl -O http://www.fec.gov/finance/disclosure/metadata/cm_header_file.csv
curl -O http://www.fec.gov/finance/disclosure/metadata/cn_header_file.csv
curl -O http://www.fec.gov/finance/disclosure/metadata/oppexp_header_file.csv


cat cm_header_file.csv <(unzip -p cm16.zip | csvformat -e 'latin1' -d '|') > committees.csv
cat cn_header_file.csv <(unzip -p cn16.zip | csvformat -e 'latin1' -d '|') > candidates.csv
cat oppexp_header_file.csv <(unzip -p oppexp16.zip | csvformat -d '|') > oppexp.csv


csvsql --dialect sqlite candidates.csv
head -n 50000 oppexp.csv | csvsql --dialect sqlite --tables oppexp

sqlite3 fecdata.sqlite <<EOF
CREATE TABLE oppexp (
  "CMTE_ID" VARCHAR(9) NOT NULL,
  "AMNDT_IND" VARCHAR(1) ,
  "RPT_YR" INTEGER ,
  "RPT_TP" VARCHAR(4) ,
  "IMAGE_NUM" BIGINT ,
  "LINE_NUM" VARCHAR(4) ,
  "FORM_TP_CD" VARCHAR(4) ,
  "SCHED_TP_CD" VARCHAR(4) ,
  "NAME" VARCHAR(100) ,
  "CITY" VARCHAR(40),
  "STATE" VARCHAR(10),
  "ZIP_CODE" VARCHAR(10),
  "TRANSACTION_DT" DATE NOT NULL,
  "TRANSACTION_AMT" FLOAT NOT NULL,
  "TRANSACTION_PGI" VARCHAR(4),
  "PURPOSE" VARCHAR(120),
  "CATEGORY" VARCHAR(4),
  "CATEGORY_DESC" VARCHAR(60),
  "MEMO_CD" VARCHAR(4),
  "MEMO_TEXT" VARCHAR(120),
  "ENTITY_TP" VARCHAR(3) ,
  "SUB_ID" BIGINT ,
  "FILE_NUM" INTEGER ,
  "TRAN_ID" VARCHAR(20) ,
  "BACK_REF_TRAN_ID" VARCHAR(20)
);
EOF
