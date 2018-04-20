import re, sys

data = sys.stdin.read()
assert isinstance(data, str)

for l in (
	r'^[0-9]+$',
	r'^Marja Peltola$',
	r'^Kunnollisia perheitä$',
	r'^VÄHEMMISTÖJEN VÄLISET SUHTEET: TUTKIMUSTULOKSIA JA TOIMINTAEHDOTUKSIA$',
	r'^TYÖ- JA ELINKEINOMINISTERIÖN JULKAISUJA 1/2017$',
):
	data = re.sub(l, '', data, flags=re.MULTILINE)


data = re.sub(r'\n+', ' ', data)
#data = re.sub(r'\n+', ' ', data)
data = re.sub(r'\s', ' ', data, re.UNICODE)  # Normalize whitespace

data = re.sub(r'\([-, 0-9–]+\)', ' ', data)  # "(2008, 112–114)"
data = re.sub(r'\([A-Z][-–;,&\w\s]+[\d.]\)', ' ', data)  # (Name ...,; ... 999)

data = re.sub(r'[ ]+', ' ', data)  # Normalize whitespace again

print(data)