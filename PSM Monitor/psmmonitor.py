#!/usr/bin/python
import requests
psmservers = ['psm1','psm2']
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
failures = {}
for psm in psmservers:
    r = requests.get('https://' + psm + '/psm/api/health', verify=False)
    if r.text != 'PASS':
        failures.update({psm: r.text})
