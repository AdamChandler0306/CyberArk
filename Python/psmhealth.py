import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
#Defining the world.

failures = {}
psmservers = filter(None, requests.get('git').text.split('\n'))
for psm in psmservers:
    r = requests.get('https://' + psm + './psm/api/health', verify=False)
    if r.text != 'PASS':
        failures.update({psm: r.text})
