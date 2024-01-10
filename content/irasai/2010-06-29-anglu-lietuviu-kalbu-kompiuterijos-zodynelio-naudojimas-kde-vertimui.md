---
title: Anglų-lietuvių kalbų kompiuterijos žodynėlio naudojimas KDE vertimui – ATNAUJINTA
author: Donatas G.
type: post
date: 2010-06-29T09:30:40+00:00
#url: /?p=220
categories:
  - Programos
  - vertimas
tags:
  - lokalize
  - opendict
  - žodynas
---
<figure id="attachment_235" aria-describedby="caption-attachment-235" style="width: 300px" class="wp-caption right"><a href="/wp-content/uploads/2010/02/lokalize_aiskinamasis_zodynas.png"><img loading="lazy" decoding="async" src="/wp-content/uploads/2010/02/lokalize_aiskinamasis_zodynas-300x201.png" alt="Lokalize programos dešiniajame apatiniame kampe – terminai iš Anglų-lietuvių kalbų kompiuterijos žodynėlio" title="Lokalize ir veikiantis aiskinamasis zodynas" width="300" height="201" class="size-medium wp-image-235" srcset="/wp-content/uploads/2010/02/lokalize_aiskinamasis_zodynas-300x201.png 300w, /wp-content/uploads/2010/02/lokalize_aiskinamasis_zodynas-150x100.png 150w, /wp-content/uploads/2010/02/lokalize_aiskinamasis_zodynas.png 853w" sizes="(max-width: 300px) 100vw, 300px" /></a><figcaption id="caption-attachment-235" class="wp-caption-text">Lokalize programos dešiniajame apatiniame kampe – terminai iš Anglų-lietuvių kalbų kompiuterijos žodynėlio</figcaption></figure> 

Anglų &#8211; lietuvių kalbų kompiuterijos žodynėlis yra puikus resursas programinės įrangos vertimui į Lietuvių kalbą. Jis yra prieinamas internetu, adresu: <http://www.likit.lt/en-lt/>.

Tačiau internetu jį naudoti ne itin patogu, tad iš šio žodyno šaltinių, viešai pateiktų internete, galima pasigaminti „Slovo“ formato žodyną, kurį galima naudoti su programa [OpenDict][2], arba – Term Base eXchange formato žodyną, kurį galima naudoti tiesiogiai KDE vertimo programoje [Lokalize][3].

Nekantrieji gali tiesiog atsisiųsti perdarytus žodynus (abu įdėti į bz2 tipo archyvą): 

Slovo: [en-lt_2009-12-16.dwa.bz2][4]

Translation Base eXchange: [en-lt_2010-02-24.tbx.bz2][5]

Tačiau šių žodynų nepažadame operatyviai atnaujinti, tad siūlome juos pasigaminti patiems <ins datetime="2010-07-29T06:55:07+00:00">– juolab, kad jį gaminantis patiems galima sukurti dar ir *.babylon formato žodyną</ins>. Taigi, kaip perdaryti žodynus? Labai paprastai. Atsisiųskite šį scenarijų: [alkkz-konvertavimas2.sh][6].

<!--more-->Padarykite šį scenarijų vykdomuoju: atverkite Konsole ar kitą X terminalo programą ir įvykdykite komandą:

  
```
cd /aplankas/i/kuri/atsisiuntete/scenariju
chmod +x alkkz-konvertavimas2.sh
```

<del datetime="2010-07-29T06:27:10+00:00">Įsidiekite programų rinkinį „translate-toolkit“. Ubuntu/Kubuntu vartotojai tai gali padaryti paprasta komanda:<br /> <code>sudo apt-get install translate-toolkit</code></del>

Tada įvykdykite patį atsisiųstąjį scenarijų:  
```
./alkkz-konvertavimas2.sh
```

Scenarijus turėtų bent preliminariai informuoti apie klaidas ir jų priežastis. Jei viskas gerai pavyko, po kelių minučių tame pačiame aplanke rasite failus en-lt.dwa ir en-lt.tbx <ins datetime="2010-07-29T06:27:10+00:00">bei Babylon formato žodyną en-lt.babylon<br /> </ins>.

**en-lt.dwa** galite įdiegti kaip programos OpenDict žodyną.

<ins datetime="2010-07-29T06:27:10+00:00"><strong>en-lt.babylon</strong> galite savarankiškai konvertuoti su stardict-editor programa ir po to naudoti su StarDict, GoldenDict, QStarDict&#8230;</ins>

**en-lt.tbx** galite naudoti kaip programos Lokalize aiškinamąjį žodyną. 

Jei šiek tiek suprantate XML, galite nesunkiai pastarąjį sujungti su specifiniu KDE terminų žodynu, kurį rasite [čia][7]. Tai galite padaryti bet kokia teksto rengykle, į bet kurį žodyną įterpdami kito žodyno turinį (tik žinoma reikia atitaikyti, ką iškirpti ir kur tiksliai įterpti :).

Žodynas prie Lokalize programos prijungiamas nurodant kelią iki jo „Projekto aprašyme“: **Meniu „Projektas“ > „Konfigūruoti projektą“ > Dialogo laukelis „Aiškinamasis žodynas“.**

Nurodę žodyną, versdami bet kurią programą Lokalize „Aiškinamojo žodyno“ komponentas programos lango dešinėje apačioje rodys vertimo pasiūlymus visiems verčiamoje eilutėje esantiems terminams, kokius tik pavyks rasti žodynėlyje! (žr. paveikslėlį įrašo viršuje).

Beje, ir slovo formato žodyną galite sujungti su atitinkamu kde terminynu, kurį rasite [čia][8]. Tiesiog reikia sujungti du failus į vieną (pirmasis turėtų eiti KDE terminų failas. Tiesa, nesu tikras, kaip OpenDict elgsis su besidubliuojančiais įrašais, bet jei specifiniai KDE terminai faile yra pirmi, gal jiems bus teikiama pirmenybė?

<ins datetime="2010-07-29T06:27:10+00:00">Įrašas atnaujintas 010-07-29 – ačiū Mindaugui už pataisytą scenarijų alkkz-konvertavimas2.sh, kuriame atsisakyta priklausomybės nuo translate-toolkit programų rinkinio ir pasiekta, kad *.tbx failas geriau atitiktų Lokalize naudojamą *.tbx formato variantą. Mindaugas taip pat pridėjo funkciją, konvertuojančią žodyną į *.babylon formatą. </a></ins>

 [2]: http://www.akl.lt/projektai/?doc=OpenDict.html
 [3]: http://userbase.kde.org/Lokalize
 [4]: /wp-content/uploads/2010/02/en-lt_2009-12-16.dwa.bz2
 [5]: /wp-content/uploads/2010/02/en-lt_2010-02-24.tbx.bz2
 [6]: /newp/zodynai/alkkz-konvertavimas2.sh
 [7]: http://websvn.kde.org/*checkout*/trunk/l10n-kde4/lt/terms.tbx
 [8]: /newp/zodynai/generuoti/kde-specifiniai-terminai.dwa