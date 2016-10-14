from requests import Request, Session
from sys import stdout, stderr
from csv import writer

# http://api.census.gov/data/2015/acs1?get=NAME,B01001_001E,GEOID&for=state:*

BASE_SRC_URL = 'http://api.census.gov/data/2015/acs1'
GEOS = ['state', 'congressional district', 'place']
YEAR = 2015

FIELDS = [
    ("B01001_001E", "total_population"),
    ("B03002_003E", "white"),
    ("B03002_004E", "black"),
    ("B03003_003E", "hispanic"),
    ("B03002_006E", "asian"),
    ("B03002_005E", "american_indian"),
    ("B03002_007E", "pacific_islander"),
    ("B03002_008E", "other_race"),
    ("B01002_001E", "median_age"),
    ("B11011_001E", "total_households"),
    ("B25077_001E", "owner_occupied_homes_median_value"),
    ("B19013_001E", "per_capita_income"),
    ("B19013_001E", "median_household_income"),
    ("B06012_002E", "below_poverty_line"),
    ("B06001_049E", "foreign_born_population"),
]

def build_request(year, geo):
    baseurl = BASE_SRC_URL.format(year=year)
    parms = {'for': "%s:*" % geo}
    parms['get'] = ','.join(['NAME', 'GEOID'] + list(f[0] for f in FIELDS))
    req = Request('GET', baseurl, params=parms)
    return req.prepare()


for geoname in GEOS:
    gfields = ['state'] if geoname == 'state' else ['state', geoname]
    fieldnames = ['year', 'name', 'geo_id'] + list(f[1] for f in FIELDS) + gfields

    destname = "%s.csv" % geoname
    df = open(destname, 'w')
    destcsv = writer(df)
    destcsv.writerow(fieldnames)

    req = build_request(YEAR, geoname)
    stderr.write(req.url + "\n")
    session = Session()
    response = session.send(req, allow_redirects=False)
    data = response.json()
    for row in data[1:]:
        destcsv.writerow([YEAR] + row)



