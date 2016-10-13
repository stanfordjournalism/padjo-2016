import requests
import csv
from pathlib import Path

DATA_URL = 'https://www.dallasopendata.com/api/views/4gmt-jyx2/rows.csv?accessType=DOWNLOAD'
DEST_FILE = Path('rawdata.csv')
PDF_DIR = Path('pdfs')
PDF_DIR.mkdir(exist_ok=True)

print("Fetching", DATA_URL)
resp = requests.get(DATA_URL)
data = list(csv.DictReader(resp.text.splitlines()))
print("Rows:", len(data))

DEST_FILE.write_text(resp.text)

for row in data:
    if 'http' in row['Summary URL']:
        url = row['Summary URL']
        pdfname = PDF_DIR.joinpath(Path(url).name)
        print("Saving", pdfname)
        pdfname.write_bytes(requests.get(url).content)


