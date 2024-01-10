---
title: KDE vertimo vadovas
author: Donatas G.
type: page
date: 2009-10-25T13:27:46+00:00
menu:
  main:
    weight: 2
    parent: Vertimas
---
[puslapis dar nebaigtas, tad būkite kantrūs&#8230;]

Norėdami pradėti versti KDE programas, visų pirma turite atsisiųsti vertimo failus. KDE kaip ir nemaža dalis kitų laisvosios programinės įrangos projektų, lokalizuojama naudojant [gettext][1] sistemą. Kiekviena su gettext lokalizuojama programa turi failą, kuriame sudėtos programos vartotojo sąsajos eilutės – šabloną, turintį priesagą „pot“. Šis failas po to verčiamas į kitas kalbas, ir kiekvienos kalbos failas pavadinamas su priesaga „po“. Vėliau, kompiliuojant programą į dvejetainio kodo failus, „po“ failai virsta „mo“ failais, kuriuos programa naudoja, kad galėtų sąsają pateikti skirtingomis kalbomis.

**Failų atsisiuntimas**

Paprasčiausias būdas atsisiųsti KDE vertimo failus – eiti į KDE šaltinių svetainę. Štai keli naudingi adresai:

**Kamieno** atšakos [lietuviški vertimai][2] ir [šablonai][3].

**Stabilios** atšakos [lietuviški vertimai][4] ir [šablonai][5].

Kurie iš jų šiuo metu verčiami? Tai priklauso nuo to, ar daugiausiai programuotojų darbo skiriama naujos versijos rengimui, ar – išleistos versijos tobulinimo leidimų rengimui (pvz., KDE 4.3 yra _versija_ o KDE 4.3.1 – jau tik KDE 4.3 versijos pataisymų _leidimas_). Paprastai informacija apie tai, ką šiuo metu verčia lietuvių komanda, rasite [šioje svetainėje][6], o jei ne &#8211; klauskite komandos koordinatoriaus.

**Atsisiuntimas per KDE SVN**

Kartais, užuot siuntusis failus po vientą, gali būti patogiau turėti juos visus. Tuomet teks juos atsisiųsti iš KDE šaltinių repozitorijos naudojant subversion programą.

Štai komandų seka, vykdoma programoje _konsole_, kuri sukurs vertimams skirtą aplanką, atsiųs KDE kamieno atšakos lietuviškus vertimus ir taip pat vertimų šablonus, tačiau praleis dokumentacijos vertimus ir dokumentacijos šablonus (mums jų nereikės):

<pre>mkdir vertimai
cd vertimai
svn co -N svn://anonsvn.kde.org/home/kde/branches/stable/l10n-kde4/lt/
cd lt
svn co svn://anonsvn.kde.org/home/kde/branches/stable/l10n-kde4/lt/messages/
cd ..
svn co -N svn://anonsvn.kde.org/home/kde/branches/stable/l10n-kde4/templates/
cd templates
svn co svn://anonsvn.kde.org/home/kde/branches/stable/l10n-kde4/templates/messages/
cd ..</pre>

Taigi, dabar, aplanke vertimai turėsite stabilios vertimų atšakos visų kde programų vertimų medį aplanke lt/ ir šablonų medį aplanke templates/.

<pre>$ tree -d vertimai/
vertimai/
|-- lt
|   `-- messages
|       |-- extragear-multimedia
|       |-- extragear-network
|       |-- kdeaccessibility
|       |-- kdeadmin
|       |-- kdeartwork
|       |-- kdebase
|       |-- kdeedu
|       |-- kdegames
|       |-- kdegraphics
|       |-- kdelibs
|       |-- kdemultimedia
|       |-- kdenetwork
|       |-- kdepim
|       |-- kdepimlibs
|       |-- kdeplasma-addons
|       |-- kdesdk
|       |-- kdetoys
|       |-- kdeutils
|       |-- kdewebdev
|       |-- koffice
|       `-- qt
`-- templates
    `-- messages
        |-- extragear-multimedia
        |-- extragear-network
        |-- kdeaccessibility
        |-- kdeadmin
        |-- kdeartwork
        |-- kdebase
        |-- kdeedu
        |-- kdegames
        |-- kdegraphics
        |-- kdelibs
        |-- kdemultimedia
        |-- kdenetwork
        |-- kdepim
        |-- kdepimlibs
        |-- kdeplasma-addons
        |-- kdesdk
        |-- kdetoys
        |-- kdeutils
        |-- kdewebdev
        |-- koffice
        `-- qt</pre>

Pakeitę aukščiau esančiame komandų sąraše frazę „branches/stable“ į frazę „trunk“ galėtumėte atsisiųsti kamieno atšakos vertimus.

Toks šaltinių atsisiuntimas patogus tuo, kad vėliau bet kada galėsite aplanke „lt/messages“ arba „templates/messages“ įvykdyti komandą `svn up` ir vertimų medis per kelias minutes atsinaujins iki dabartinės būklės.

Dabar jau galėtume atverti reikiamą failą ir versti, tačiau prieš tai suderinkime vertimui programą Lokalize.

**Lokalize derinimas**

Lokalize yra KDE 4 programa, skirta būtent programų vertimui. Atverkime programą, štai jos pagrindinis langas:<figure id="attachment_168" aria-describedby="caption-attachment-168" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-168" title="lokalize1" src="/wp-content/uploads/2009/10/lokalize1-300x178.png" alt="Lokalize langas - prieš konfigūruojant" width="300" height="178" srcset="/wp-content/uploads/2009/10/lokalize1-300x178.png 300w, /wp-content/uploads/2009/10/lokalize1-150x89.png 150w, /wp-content/uploads/2009/10/lokalize1.png 853w" sizes="(max-width: 300px) 100vw, 300px" />][7]<figcaption id="caption-attachment-168" class="wp-caption-text">Lokalize langas - prieš konfigūruojant</figcaption></figure> 

Dabar jau galėtume spausti mygtuką „Atverti“ ir išsirinkti norimą versti failą. Tačiau pamėginkime prieš tai pamatyti visą vertimų medžio vaizdą – pasinaudokime projekto konfigūravimo galimybe.

Taigi, iš meniu „Projektas“ išsirenkame įrašą „Create New Project“, ir paleidžiame vediklį:<figure id="attachment_188" aria-describedby="caption-attachment-188" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-188" title="lokalize-svn1" src="/wp-content/uploads/2009/10/lokalize-svn1-300x229.png" alt="Lokalize projekto vediklis - 1 dalis" width="300" height="229" />][8]<figcaption id="caption-attachment-188" class="wp-caption-text">Lokalize projekto vediklis - 1 dalis</figcaption></figure> <figure id="attachment_188" aria-describedby="caption-attachment-188" style="width: 300px" class="wp-caption alignnone">[<img loading="lazy" decoding="async" class="size-medium wp-image-188" title="lokalize-svn2" src="/wp-content/uploads/2009/10/lokalize-svn2-300x229.png" alt="Lokalize projekto vediklis - 1 dalis" width="300" height="229" />][9]<figcaption id="caption-attachment-188" class="wp-caption-text">Lokalize projekto vediklis - 2 dalis</figcaption></figure> <figure id="attachment_187" aria-describedby="caption-attachment-187" style="width: 300px" class="wp-caption alignnone">[<img loading="lazy" decoding="async" class="size-medium wp-image-187" title="lokalize-svn3" src="/wp-content/uploads/2009/10/lokalize-svn3-300x229.png" alt="Lokalize projekto vediklis 3 dalis" width="300" height="229" srcset="/wp-content/uploads/2009/10/lokalize-svn3-300x229.png 300w, /wp-content/uploads/2009/10/lokalize-svn3-150x114.png 150w, /wp-content/uploads/2009/10/lokalize-svn3.png 508w" sizes="(max-width: 300px) 100vw, 300px" />][10]<figcaption id="caption-attachment-187" class="wp-caption-text">Lokalize projekto vediklis 3 dalis</figcaption></figure> <figure id="attachment_187" aria-describedby="caption-attachment-187" style="width: 300px" class="wp-caption alignnone">[<img loading="lazy" decoding="async" class="size-medium wp-image-187" title="lokalize-svn4" src="/wp-content/uploads/2009/10/lokalize-svn4-300x229.png" alt="Lokalize projekto vediklis 4 dalis" width="300" height="229" />][11]<figcaption id="caption-attachment-187" class="wp-caption-text">Lokalize projekto vediklis 4 dalis</figcaption></figure> 

Išsaugojus projekto pakeitimus projekto apžvalgoje esantis „messages“ aplanke matysite visą KDE vertimų medį ir atskirų failų (bei aplankų) išverstumo statistiką:<figure id="attachment_189" aria-describedby="caption-attachment-189" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-189" title="lokalize3-projview2" src="/wp-content/uploads/2009/10/lokalize3-projview2-300x178.png" alt="Lokalize: „Projekto vaizdas“" width="300" height="178" srcset="/wp-content/uploads/2009/10/lokalize3-projview2-300x178.png 300w, /wp-content/uploads/2009/10/lokalize3-projview2-150x89.png 150w, /wp-content/uploads/2009/10/lokalize3-projview2-1024x608.png 1024w, /wp-content/uploads/2009/10/lokalize3-projview2.png 1280w" sizes="(max-width: 300px) 100vw, 300px" />][12]<figcaption id="caption-attachment-189" class="wp-caption-text">Lokalize: „Projekto vaizdas“</figcaption></figure> 

O tada, spragtelėjus bet kurį failą, atveriame jį redagavimui:<figure id="attachment_177" aria-describedby="caption-attachment-177" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-177" title="lokalize5-editview" src="/wp-content/uploads/2009/10/lokalize5-editview-300x178.png" alt="Lokalize „rengyklės vaizdas“" width="300" height="178" srcset="/wp-content/uploads/2009/10/lokalize5-editview-300x178.png 300w, /wp-content/uploads/2009/10/lokalize5-editview-150x89.png 150w, /wp-content/uploads/2009/10/lokalize5-editview-1024x608.png 1024w, /wp-content/uploads/2009/10/lokalize5-editview.png 1280w" sizes="(max-width: 300px) 100vw, 300px" />][13]<figcaption id="caption-attachment-177" class="wp-caption-text">Lokalize „rengyklės vaizdas“</figcaption></figure> 

Dar vienas parengiamasis etapas – vertimo atminties parengimas. Ji mums padės verčiant – atskirame laukelyje programos lange matysime, kaip panašios (ar visiškai tapačios) eilutės yra verčiamos kitur KDE. Taigi, eikime į meniu „Įrankiai“ ir pasirinkime įrašą „Manage translation memories“.<figure id="attachment_178" aria-describedby="caption-attachment-178" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-178" title="lokalize6-trmemories" src="/wp-content/uploads/2009/10/lokalize6-trmemories-300x162.png" alt="Vertimo atminties tvarkymas" width="300" height="162" srcset="/wp-content/uploads/2009/10/lokalize6-trmemories-300x162.png 300w, /wp-content/uploads/2009/10/lokalize6-trmemories-150x81.png 150w, /wp-content/uploads/2009/10/lokalize6-trmemories.png 480w" sizes="(max-width: 300px) 100vw, 300px" />][14]<figcaption id="caption-attachment-178" class="wp-caption-text">Vertimo atminties tvarkymas</figcaption></figure> 

Spaudžiame mygtuką „Add data“ ir nurodome „messages“ aplanką, kuriame yra visi KDE vertimai.<figure id="attachment_179" aria-describedby="caption-attachment-179" style="width: 255px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-179" title="lokalize6-trmemories2" src="/wp-content/uploads/2009/10/lokalize6-trmemories2-255x300.png" alt="Nurodome aplanką su vertimais" width="255" height="300" srcset="/wp-content/uploads/2009/10/lokalize6-trmemories2-255x300.png 255w, /wp-content/uploads/2009/10/lokalize6-trmemories2-127x150.png 127w, /wp-content/uploads/2009/10/lokalize6-trmemories2.png 408w" sizes="(max-width: 255px) 100vw, 255px" />][15]<figcaption id="caption-attachment-179" class="wp-caption-text">Nurodome aplanką su vertimais</figcaption></figure> 

Spragtelėjus OK prasideda importavimas, kurio sparta priklauso nuo kompiuterio spartos&#8230;

Dar galime atsisiųsti kokios nors kitos kalbos, kurią gerai išmanome, projektą. Mano atveju tai &#8211; rusų kalba. Taigi, sukuriu naują projektą, liepiu programai atsisiųsti rusų kalbos modulį, naujai sukurtą rusų kalbos projektą uždarau, vėl atsidarau lietuvišką projektą, ir po to iš meniu „Projektas“ išsirenku įrašą „Konfigūruoti projektą“ ir konfigūracijos dialogo modulyje „Advanced“ nurodau, iš kur programa turi imti alternatyvius vertimus (parinktis „Alternative translations folder“):<figure id="attachment_190" aria-describedby="caption-attachment-190" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-190" title="lokalize-alternative_translations" src="/wp-content/uploads/2009/10/lokalize-alternative_translations-300x195.png" alt="Alternatyvių vertimo pasiūlymų konfigūravimas" width="300" height="195" srcset="/wp-content/uploads/2009/10/lokalize-alternative_translations-300x195.png 300w, /wp-content/uploads/2009/10/lokalize-alternative_translations-150x97.png 150w, /wp-content/uploads/2009/10/lokalize-alternative_translations.png 661w" sizes="(max-width: 300px) 100vw, 300px" />][16]<figcaption id="caption-attachment-190" class="wp-caption-text">Alternatyvių vertimo pasiūlymų konfigūravimas</figcaption></figure> 

Į alternatyvų vertimą verta užmesti akį tada, kai angliškas tekstas neaiškus. Iš vertimo į rusų kalbą (rusų vertėjų komanda didesnė nei mūsiškė, tad jie ne tik viską išverčia, bet ir turi daugiau galimybių patikrinti vieni kitų darbą) neretai paaiškėja, ką turėjo omeny programos kūrėjas.

Tada jau tikrai galime pradėti vertimą.

**Pažintis su Lokalize langu ir vertimu**

Lokalize lange, be viršuje esančių įprastų meniu ir įrankių juostų, matote:<figure id="attachment_191" aria-describedby="caption-attachment-191" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-191" title="lokalize5-editview2" src="/wp-content/uploads/2009/10/lokalize5-editview2-300x178.png" alt="Lokalize: redagavimo vaizdas" width="300" height="178" srcset="/wp-content/uploads/2009/10/lokalize5-editview2-300x178.png 300w, /wp-content/uploads/2009/10/lokalize5-editview2-150x89.png 150w, /wp-content/uploads/2009/10/lokalize5-editview2-1024x608.png 1024w, /wp-content/uploads/2009/10/lokalize5-editview2.png 1280w" sizes="(max-width: 300px) 100vw, 300px" />][17]<figcaption id="caption-attachment-191" class="wp-caption-text">Lokalize: redagavimo vaizdas</figcaption></figure> 

  * Translation units (verčiamų eilučių sąrašas) – lango viršuje kairėje; čia matote verčiamą eilutę, išverstą eilutę (jei ji išversta), pastabas, jei tokių pridėjo vertėjas (pastabos pridedamos lango dalyje „Unit metadata“), ir eilutės būklę: jei eilutė išversta arba neišversta &#8211; „yes“, jei eilutė išversta, tačiau vertimas paskelbtas abejotinu (programos, arba &#8211; vertėjo) &#8211; „no“.
  * Unit metadata (Įrašo metaduomenys) &#8211; lango viduryje kairėje; čia matome (ir galime įvesti – jei tokių norime palikti kitiems vertėjams) pastabas, o taip pat matome, kuriame programos šaltinių faile naudojama atitinkama verčiama eilutė. Beje, šią lango dalį galite ir išjungti – vargu ar ji jums bus reikalinga verčiant.
  * Verčiamos eilutės laukelis &#8211; lango viršuje dešinėje.
  * Laukelis vertimui – lango viduryje dešinėje. Būten čia rašomas vertimas. Jei matote vertimą įrašytą _kursyvu_ – vadinasi vertimas nepatvirtintas ir nebus naudojamas programoje (po faile jis pažymėtas žyma „fuzzy“). Jį pradėjus taisyti vertimas automatiškai bus pažymėtas kaip tinkamas. Jei išvertus eilutę visgi suabejosite vertimo teisingumu, įrankių juostoje spragtelėkite mygtuką „Translated“, taip vertimas bus vėl pažymėtas abejotino (fuzzy) žyme.
  * Alternatyvus vertimas &#8211; apačioje kairėje; čia rodomas tos pačios eilutės vertimas į kitą kalbą, jei tik Lokalize tam sukonfigūravote ir atsisiuntėte vertimus.
  * Vertimo atmintis &#8211; apačioje centre; čia rodomos į verčiamą eilutę panašios eilutės iš kitų KDE vietų.
  * Glosarijus &#8211; apačioje dešinėje. Čia galima įterpti svarbiausių terminų žodyną.

Taigi, pats vertimas vyksta dešiniajame viduriniame laukelyje. Išvertę vieną eilutę spaudžiame mygtuką „Next“ ir verčiame kitą. Jei faile daug išverstų eilučių, galime pasikeisti vartotojo sąsają (Nustatymai > Konfigūruoti įrankines) ir prisidėti tinkamų mygtukų, kurie leistų pereiti, pvz., prie kitos nebaigtos versti / neišvertos eilutės, arba išmokti reikiamas klavišų kombinacijas (_Vald + Lyg2 + Psl. žemyn_ atlieka būtent ką tik aprašytą veiksmą).

Išvertę failą jį įrašykite kur nors kitur nei vertimų medyje &#8211; jį po to reikės išsiųsti e. paštu komandos koordinatoriui. Šiuo metu tai yra Andrius Štikonas <stikonas@gmail.com>.

Verčiant nepamirškite daugiskaitos formų (vertimo laukelyje bus net keturios kortelės, už kiekvienos slėpsis po atskirą eilutę konkrečiai daugiskaitos formai). Taip pat nepamirškite nukopijuoti į vertimą visą programinį kodą, kuris yra originale, bei skyrybos ženklus „\n“ „\t“, pakeistukus, pvz., „%1“. Apie tai dar parašysiu vėliau. O kol kas plačiau apie tai pasiskaityti galite [senesniame KDE vertimo vadove][18]. Tik nepamirškite, kad KDE nuo šiol naudoja nebe tris, o [keturias daugiskaitos formas][19].

_Sėkmės verčiant!_

 [1]: http://en.wikipedia.org/wiki/GNU_gettext
 [2]: http://websvn.kde.org/trunk/l10n-kde4/lt/messages/
 [3]: http://websvn.kde.org/trunk/l10n-kde4/templates/messages/
 [4]: http://websvn.kde.org/branches/stable/l10n-kde4/lt/messages/
 [5]: http://websvn.kde.org/branches/stable/l10n-kde4/templates/messages/
 [6]: {{< relref "progresas" >}} "šioje svetainėje"
 [7]: /wp-content/uploads/2009/10/lokalize1.png
 [8]: /wp-content/uploads/2009/10/lokalize-svn1.png
 [9]: /wp-content/uploads/2009/10/lokalize-svn2.png
 [10]: /wp-content/uploads/2009/10/lokalize-svn3.png
 [11]: /wp-content/uploads/2009/10/lokalize-svn4.png
 [12]: /wp-content/uploads/2009/10/lokalize3-projview2.png
 [13]: /wp-content/uploads/2009/10/lokalize5-editview.png
 [14]: /wp-content/uploads/2009/10/lokalize6-trmemories.png
 [15]: /wp-content/uploads/2009/10/lokalize6-trmemories2.png
 [16]: /wp-content/uploads/2009/10/lokalize-alternative_translations.png
 [17]: /wp-content/uploads/2009/10/lokalize5-editview2.png
 [18]: {{< relref "vertimo-vadovas" >}}
 [19]: {{< relref "/irasai/2009-10-19-kde-vertime-nuo-4-4-versijos-bus-keturios-daugiskaitos-formos.md" >}}