#!/bin/bash
##
## Šis scenrijus atsisiunčia iš www.likit.lt svetainės
## Anglų-lietuvių terminų žodynėlio šaltinius ir
## konvertuoja į tris žodynų formatus:
## Slovo (*.dwa), Babylon (*.babylon) ir 
## LISA: Term Base eXchange (*.tbx).
## Kad scenarijus veiktų, turite jį vykdyti Linux
## sistemoje.
## Scenarijų parašė:
## (c) Donatas G. <dgvirtual@akl.lt>, 2010
## (c) Mindaugas Baranauskas, 2010
## Scenarijus platinamas pagal GPL v3 licenciją.

## atsisiunčiame archyvą

function cleanup {
rm en-lt.zip
rm en-lt.csv
}

function error_wget {
echo "Šaltinių failo atsisiųsti iš www.likit.lt/en-lt/ nepavyko."
echo "Patikrinkite, ar turite interneto prieigą, bei, ar minėta"
echo "interneto svetainė yra prieinama, ir bandykite iš naujo."
if [ -f en-lt.zip ]; then 
	echo 
	echo "Bet radome seniau parsisiųstą rinkmeną en-lt.zip."
else
	if [ -f en-lt.txt ]; then 
		echo 
		echo "Bet šiame kompiuterio aplanke radome"
		echo "pirminio teksto rinkmeną en-lt.txt."
	else
		exit 1
	fi
fi
}

function convert_txt_dwa {
echo "Konvertuojame į slovo formato žodyną (*.dwa)..."
## konvertuojame į dwa formato žodyną (naudojimui su 
## OpenDict programa
cat en-lt.txt | sed 's/|//g' | \
    sed 's/ – / = /' | sed '1,9d' > en-lt.dwa
echo
echo "Slovo formato rinkmena en-lt.dwa parengta. Ją galite"
echo "naudoti su programa OpenDict."
echo
echo "Jei ketinate žodyną platinti, turite perkelti į jį "
echo "originalios rinkmenos preambulėje esančią informaciją "
echo "bei nurodyti, kad žodyno šaltinis yra atsisiųstas iš"
echo "žiniatinklio svetainės http://www.likit.lt"
echo "Visą tai galite surašyti pirmojoje rinkmenos eilutėje"
echo "atvėrę jį bet kokia teksto rengykle štai taip: "
echo ". = Anglų–lietuvių kalbų <...>"
echo
}

function convert_txt_csv {
## parengiame csv formato rinkmeną, visi tikri kableliai keičiami
## išraiška #_#
## laikinai perkoduojami ir &amp; &quot; &lt; &gt;
## tam, kad jų neinterpretuotų kaip lauko skyriklių
## „;“ skirtingoms reikšmėms
## (kableliai skyrė sinonimus).
cat en-lt.txt | sed 's/,/#_#/g' |  \
	sed "s/\ \–\ /${TEKSTO_SKYRIKLIS}${LAUKO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/" | \
	sed 's/^/\"/' | \
	sed 's/.$/\"/' | sed 's/|//g' | sed '1,9d' | \
	sed 's/&amp;/#_amp_#/g' | sed 's/&quot;/#_quot_#/g' | \
	sed 's/&lt;/#_lt_#/g' | sed 's/&gt;/#_gt_#/g' | \
	sed "s/\;\ /${TEKSTO_SKYRIKLIS}${LAUKO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/g" | \
	sed 's/#_amp_#/\&amp\;/g' | sed 's/#_quot_#/\&quot\;/g' | \
	sed 's/#_lt_#/\&lt\;/g' | sed 's/#_gt_#/\&gt\;/g' > en-lt.csv
}

function convert_csv_balylon {
echo "Konvertuojame į babylon formato žodyną (*.babylon)..."
echo "
#stripmethod=keep
#sametypesequence=h
#bookname=Anglų–lietuvių kalbų kompiuterijos žodynėlis
#author=(c) 2008, Valentina Dagienė, Gintautas Grigas, Tatjana Jevsikova
#description=Anglų–lietuvių kalbų kompiuterijos žodynėlis (Enciklopedinio kompiuterijos žodyno priedas).<br> Sukurtas `date` iš pirminio teksto, kurį galite atsiisųti iš http://www.likit.lt
" > en-lt.babylon
cat en-lt.csv | grep -v "^$" | sed 's/#_#/,/g' | \
	sed "s/^${TEKSTO_SKYRIKLIS}//" | sed "s/${TEKSTO_SKYRIKLIS}$//" | \
	sed "s/${LAUKO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/${LAUKO_SKYRIKLIS}/g" | \
	sed "s/${TEKSTO_SKYRIKLIS}${LAUKO_SKYRIKLIS}/${LAUKO_SKYRIKLIS}/g" | \
	sed "s/${TEKSTO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/${TEKSTO_SKYRIKLIS}/g" | \
	sed "s/${LAUKO_SKYRIKLIS}$//g" | sed "s/$/\n/" | \
	sed "s/${LAUKO_SKYRIKLIS}/\n/ " | sed "s/${LAUKO_SKYRIKLIS}/\; \<br\> /" >> en-lt.babylon
echo
echo "Babylon formato rinkmena en-lt.babylon parengta. Ją galite"
echo "savarankiškai konvertuoti su stardict-editor programa"
echo "ir po to naudoti su StarDict, GoldenDict, QStarDict..."
echo
echo "Jei ketinate žodyną platinti, turite perkelti į jį "
echo "originalios rinkmenos preambulėje esančią informaciją "
echo "bei nurodyti, kad žodyno šaltinis yra atsisiųstas iš"
echo "žiniatinklio svetainės http://www.likit.lt"
echo "Beje, en-lt.babylon rinkmenos pradžioje tai jau paminėta."
echo
}


function convert_csv_tbx {
## Konvertuojame šią csv rinkmeną į tbx.
## Visi tikri „:“ laikinai pakeičiami į „#__#“,
## nes „:“ naudojamas kaip ID atskyrimo ženklas.
## Visus pavienius &, < ir > būti pakeisti,
## nes kitaip Lokalize nematys aiškinamojo žodyno.
## Dar atsižvelkim, teksto csv laukeliai turi teksto skyriklius,
## tai juos nuimkime, o prievarta uždėkime eilučių pradžioje ir pabaigoje.
echo "Konvertuojame į programos Lokalize naudojamą *.tbx "
echo "formatą..."
echo
cat en-lt.csv | grep -v "^$" | sed 's/:/#__#/g' | grep "" -n  | \
	sed 's/&amp;/#_amp_#/g' | sed 's/&quot;/#_quot_#/g' | \
	sed 's/&lt;/#_lt_#/g' | sed 's/&gt;/#_gt_#/g' | \
	sed 's/&/#_amp_#/g' | sed 's/</#_lt_#/g' | sed 's/>/#_gt_#/g' | \
	sed "s/${LAUKO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/${LAUKO_SKYRIKLIS}/g" | \
	sed "s/${TEKSTO_SKYRIKLIS}${LAUKO_SKYRIKLIS}/${LAUKO_SKYRIKLIS}/g" | \
	sed "s/\:/\:${TEKSTO_SKYRIKLIS}/" | sed "s/$/${TEKSTO_SKYRIKLIS}/" | \
	sed "s/${TEKSTO_SKYRIKLIS}${TEKSTO_SKYRIKLIS}/${TEKSTO_SKYRIKLIS}/g" | \
	sed "s/${LAUKO_SKYRIKLIS}$//g" | \
	sed 's/^/            <termEntry id=\"žodyno_terminas-/' | \
	sed "s/\:${TEKSTO_SKYRIKLIS}/\">\n\
                <langSet xml:lang=\"en\">\n\
                    <ntig>\n\
                        <termGrp>\n\
                            <term>/" | \
	sed "s/${TEKSTO_SKYRIKLIS}$/<\/term>--####--/" | \
	sed "s/${LAUKO_SKYRIKLIS}$//g" | \
	sed "s/${LAUKO_SKYRIKLIS}/<\/term>\n\
                        <\/termGrp>\n\
                    <\/ntig>\n\
                <\/langSet>\n\
                <langSet xml:lang=\"lt\">\n\
                    <ntig>\n\
                        <termGrp>\n\
                            <term>/g" | \
	sed "s/--####--/\n\
                        <\/termGrp>\n\
                    <\/ntig>\n\
                <\/langSet>\n\
            <\/termEntry>/g" \
	> en-lt.vidurys.tbx

## Sugrąžiname pakeistus ženklus
sed 's/#_#/,/g' -i en-lt.vidurys.tbx 
sed 's/#__#/\:/g' -i en-lt.vidurys.tbx 
sed 's/#_amp_#/\&amp\;/g' -i en-lt.vidurys.tbx 
sed 's/#_quot_#/\&quot\;/g' -i en-lt.vidurys.tbx 
sed 's/#_lt_#/\&lt\;/g' -i en-lt.vidurys.tbx 
sed 's/#_gt_#/\&gt\;/g' -i en-lt.vidurys.tbx 

## Jau turimam viduriukui pridedame 
## tbx rinkmenoms būdingą pradžia ir pabaigą
echo \
"<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE martif PUBLIC \"ISO 12200:1999A//DTD MARTIF core (DXFcdV04)//EN\" \"TBXcdv04.dtd\">
<martif type=\"TBX\" xml:lang=\"en\">
    <martifHeader>
        <fileDesc>
            <titleStmt>
                <title>Anglų–lietuvių kalbų kompiuterijos žodynėlis</title>
            </titleStmt>
            <sourceDesc>
                <p>`grep -m 6 "^" en-lt.txt`
                   Ši TBX rinkmena sukurta `date`
                   iš nuolat atnaujinamo pirminio teksto, kurį rasite
                   http://www.likit.lt/en-lt/en-lt.zip pakete.
                </p>
            </sourceDesc>
        </fileDesc>
    </martifHeader>
    <text>
        <body>
" > en-lt.tbx
cat en-lt.vidurys.tbx >> en-lt.tbx
echo \
"        </body>
    </text>
</martif>" >> en-lt.tbx
## ir pašaliname laikiną rinkmeną
rm en-lt.vidurys.tbx

echo "Lokalize naudojamo formato rinkmena en-lt.tbx parengta."
echo
echo "Jei ketinate žodyną platinti, turite perkelti į jį "
echo "originalaus rinkmenos preambulėje esančią informaciją "
echo "bei nurodyti, kad žodyno šaltinis yra atsisiųstas iš"
echo "žiniatinklio svetainės http://www.likit.lt"
echo "Beje, en-lt.tbx rinkmenos pradžioje tai jau paminėta."
}

echo "Atsisiunčiame žodyną..."

wget http://www.likit.lt/en-lt/en-lt.zip || error_wget;
## išpakuojame, jei yra ką išpakuoti
if [ -f en-lt.zip ]; then
	echo
	echo "Išpakuojame..."
	unzip en-lt.zip
fi

echo "Keičiame failo koduotę iš cp1257 į utf8..."
## konvertuojame į utf8 koduotę, jei dar nekonvertuota
cp en-lt.txt en-lt.txt~
iconv -f cp1257 -t utf8  en-lt.txt -o en-lt_utf8.txt && \
	rm en-lt.txt && mv en-lt_utf8.txt en-lt.txt || \
	{ rm en-lt.txt; mv en-lt.txt~ en-lt.txt ; }
echo

#Šie skyrikliai nurodo būsimos CSV rinkmenos savybes
TEKSTO_SKYRIKLIS="\""
LAUKO_SKYRIKLIS="\	"

#Pagrindinis darbas :)
convert_txt_dwa
convert_txt_csv
convert_csv_balylon
convert_csv_tbx

echo
echo "Sėkmės!"
echo

exit 0
