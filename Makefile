.PHONY: tem.mp3 kunnollisia_perheita.mp3

tem.mp3: TEM_1_2017_FINAL_verkko.pdf
	pdftotext -f 11 -l 60 -nopgbrk TEM_1_2017_FINAL_verkko.pdf - | python3 unwrap.py > tem.txt
	say -v Satu -o tem.aiff -f tem.txt
	lame -V0 tem.aiff
	rm tem.aiff

kunnollisia_perheita.mp3: kunnollisia_perheita_verkko.pdf
	pdftotext -f 11 -l 41 -nopgbrk kunnollisia_perheita_verkko.pdf - | python3 unwrap.py > kunnollisia_perheita.txt
	say -v Satu -o kunnollisia_perheita.aiff -f kunnollisia_perheita.txt
	lame -V0 kunnollisia_perheita.aiff
	rm kunnollisia_perheita.aiff

TEM_1_2017_FINAL_verkko.pdf:
	curl -o $@ "http://julkaisut.valtioneuvosto.fi/bitstream/handle/10024/79168/TEM_1_2017_FINAL_verkko.pdf?sequence=1&isAllowed=y"

kunnollisia_perheita_verkko.pdf:
	curl -o $@ "http://www.nuorisotutkimusseura.fi/images/julkaisuja/kunnollisia_perheita_verkko.pdf"
