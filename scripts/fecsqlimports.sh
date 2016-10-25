rm fecdata.sqlite
cat fecsqls.sql | sqlite3 fecdata.sqlite
for thing in cm cn ccl oth pas2 webk weball indexps indiv oppexp; do
    nhname="${thing}-noheaders.psv"
    rm -f "$nhname"
    for year in 2012 2014 2016; do
         sed '1d' "${thing}-${year}.psv" >> "$nhname"
    done
    cmd=".separator '|'\n.import ${nhname} ${thing}\n"
    printf "$cmd \n"
    printf "$cmd" | sqlite3 fecdata.sqlite
done
