for year in $(seq 2009 2015); do
    echo $year
    curl -O http://publicpay.ca.gov/RawExport/${year}_City.zip
    unzip ${year}_City.zip
done

tail -n +5 2009_City.csv | head -n 1 > peninsula_salaries.csv

ls *_City.csv | while read -r fname; do
    echo $fname
    tail -n +5 $fname \
     | iconv -f iso-8859-2 -t UTF-8 \
     | csvgrep -c 'Entity County' -r 'Santa Clara|San Mateo|San Francisco' \
     | sed '1d' >> peninsula_salaries.csv
done

