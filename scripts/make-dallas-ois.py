# expects this to have been run:
# ls *.pdf | xargs -n 1 pdftotext -layout

import csv
import re
from pathlib import Path
SRC_FILE = Path('rawdata.csv')
PDF_DIR = Path('pdfs')

INCIDENTS_HEADERS = ['case_number', 'date', 'location', 'subject_statuses', 'subject_weapon',
    'subjects', 'subject_count', 'officers', 'officer_count', 'grand_jury_disposition',
    'attorney_general_forms_url', 'summary_url', 'summary_text', 'latitude', 'longitude']

SUBJECTS_HEADERS = ['case_number', 'race', 'gender', 'last_name', 'first_name', 'full_name']
OFFICERS_HEADERS = ['case_number', 'race', 'gender', 'last_name', 'first_name', 'full_name']



icsv = csv.DictWriter(open('incidents.csv', 'w'), fieldnames=INCIDENTS_HEADERS)
icsv.writeheader()
scsv = csv.DictWriter(open('subjects.csv', 'w'), fieldnames=SUBJECTS_HEADERS)
scsv.writeheader()
ocsv = csv.DictWriter(open('officers.csv', 'w'), fieldnames=OFFICERS_HEADERS)
ocsv.writeheader()


for r in csv.DictReader(SRC_FILE.open('r')):
    row = {k: v.replace('\xa0', ' ').strip() for k,v in r.items()}
    i = {}
    i['case_number'] = row['Case #']
    i['date'] = row['Date']
    i['location'] = row['Location']
    i['subject_statuses'] = row['Subject Deceased, Injured, or Shoot and Miss']
    i['subject_weapon'] = row['Subject Weapon']
    i['subjects'] = row['Subject(s)']
    i['subject_count'] = 0
    subjects = [s.strip() for s in i['subjects'].split(';') if s]
    for s in subjects:
        m = re.search(r'(.+?) ([A-Z]|NA)/([MF])', s)
        if not m:
            print("Subject:", i['subjects'])
        else:
            i['subject_count'] += 1
            o = {'case_number': i['case_number']}
            o['full_name'], o['race'], o['gender'] = m.groups()
            names = o['full_name'].split(', ', 2)
            if len(names) == 2:
                o['last_name'], o['first_name'] = names
            else:
                o['last_name'] = names[0]
                o['first_name'] = None
            scsv.writerow(o)

    i['officers'] = row['Officer(s)']
    i['officer_count'] = 0
    officers = [s.strip() for s in i['officers'].split(';') if s]
    for s in officers:
        m = re.search(r'(.+?) ([A-Z]|NA)/([MF])', s)
        if not m:
            print("Officer:", i['officers'])
        else:
            i['officer_count'] += 1
            o = {'case_number': i['case_number']}
            o['full_name'], o['race'], o['gender'] = m.groups()
            names = o['full_name'].split(', ', 2)
            if len(names) == 2:
                o['last_name'], o['first_name'] = names
            else:
                o['last_name'] = names[0]
                o['first_name'] = None
            ocsv.writerow(o)



    i['grand_jury_disposition'] = row['Grand Jury Disposition']
    i['attorney_general_forms_url'] = row['Attorney General Forms URL']
    i['summary_url'] = row['Summary URL']
    i['summary_text'] = None if 'http' not in i['summary_url'] else PDF_DIR.joinpath(Path(i['summary_url']).stem + '.txt').read_text().strip()
    # (32.836823°, -96.870954°)
    latlng = re.search(r'\((\d+\.\d+)., (-\d+\.\d+)', row['GeoLocation'])
    if latlng:
        i['latitude'], i['longitude'] = [float(f) for f in latlng.groups()]
    else:
        i['latitude'] = i['longitude'] = None
    icsv.writerow(i)
