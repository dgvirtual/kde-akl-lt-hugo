---
title: Vertimo vadovas (senas)
author: Donatas G.
type: page
date: 2008-09-02T14:15:06+00:00
---
**Pastaba**: naująjį [KDE vertimo vadovą rasite čia][1]. 

Pradžiai svarbu išmokti versti naudojant pačios KDE aplinkos priemones. Kol kas tam vis dar tarnauja KDE 3 programa [KBabel][2], kurią neužilgo turėtų pakeisti [Lokalize][3]. Tačiau čia kalbėsime apie vertimą su KBabel.

KDE verčiamas redaguojant taip vadinamus ***.po** failus. Juose yra iš programos šaltinių ištrauktos lokalizuotinos eilutės.

Atvėrus verčiamą *.po failą pamatysime maždaug tokį vaizdą:<figure id="attachment_52" aria-describedby="caption-attachment-52" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-52" title="paprastas_langas" src="/wp-content/uploads/2008/09/paprastas_langas-300x197.png" alt="Kbalbel langas" height="197" width="300" srcset="/wp-content/uploads/2008/09/paprastas_langas-300x197.png 300w, /wp-content/uploads/2008/09/paprastas_langas-150x98.png 150w, /wp-content/uploads/2008/09/paprastas_langas.png 933w" sizes="(max-width: 300px) 100vw, 300px" />][4]<figcaption id="caption-attachment-52" class="wp-caption-text">KBabel langas</figcaption></figure> 

Langas padalintas į keturias dalis. Viršuje, laukelyje „Original string (msgid)“, matote verčiamą eilutę „Additional Information“, po kuria taip pat pateikiama kontekstinė informacija. Žemiau yra laukas „Translated string (msgstr)“, kuriame turite įrašyti vertimą. Šiuo atveju – „Papildoma informacija“.

Svarbūs valdikliai vertimo lange:

```
fuzzy
```

– jei raudona, nurodo, kad eilutė yra „neaiški“ (pvz., kažkada išversta, tačiau šiek tiek pakeista programos šaltiniuose; taip vertėjai žymi eilutes, jei nežino, kaip tiksliai versti). Eilutę nors truputį pakeitus su KBabel, <span style="font-family: monospace;">fuzzy </span>žymė pranyksta. Ją uždėti (sugrąžinti) galima Vald+u klavišų deriniu, arba „Edit“ meniu suradus įrašą „Toggle fuzzy status“. Verčiant rankiniu būdu šią žymę tenka ištrinti ar uždėti paprasčiausiai įrašant **#, fuzzy** prieš eilutės originalą.

```
untranslated
```

– jei raudona, eilutė nera išversta.

```
faulty
```

– jei raudona, nurodo, kad programa mano, kad vertimas yra klaidingas. Pvz., jei išverstas tekstas tiksliai atkartoja originalą, arba jei jame trūksta kokios nors žymės, kuri yra originale.

O štai kaip atrodys minėta po faile, jei ją atsidarysime teksto redaktoriumi, pvz., Kate:<figure id="attachment_53" aria-describedby="caption-attachment-53" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-53" title="paprastas_langas-kate" src="/wp-content/uploads/2008/09/paprastas_langas-kate-300x215.png" alt="*.po failas atvertas su Kate" height="215" width="300" srcset="/wp-content/uploads/2008/09/paprastas_langas-kate-300x215.png 300w, /wp-content/uploads/2008/09/paprastas_langas-kate-150x107.png 150w, /wp-content/uploads/2008/09/paprastas_langas-kate.png 645w" sizes="(max-width: 300px) 100vw, 300px" />][5]<figcaption id="caption-attachment-53" class="wp-caption-text">*.po failas atvertas su Kate</figcaption></figure> 

Žemiau matote langą su pakaitukais:<figure id="attachment_54" aria-describedby="caption-attachment-54" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-54" title="pakaitukai-kbabel" src="/wp-content/uploads/2008/09/pakaitukai-kbabel-300x197.png" alt="KBabel langas su pakaitukais" height="197" width="300" srcset="/wp-content/uploads/2008/09/pakaitukai-kbabel-300x197.png 300w, /wp-content/uploads/2008/09/pakaitukai-kbabel-150x98.png 150w, /wp-content/uploads/2008/09/pakaitukai-kbabel.png 933w" sizes="(max-width: 300px) 100vw, 300px" />][6]<figcaption id="caption-attachment-54" class="wp-caption-text">KBabel langas su pakaitukais</figcaption></figure> 

Tekstas, jį atvėrus teksto rengykle, atrodys taip:

```
#: dolphinmodel.cpp:197
#, kde-format
msgctxt "This shows files and folders permissions: user, group and others"
msgid "(User: %1) (Group: %2) (Others: %3)"
msgstr "(Vartotojas: %1) (Grupė: %2) (Kiti: %3)"
```

Pakaitukus reikia tiksliai nukopijuoti iš originalo į vertimą. KBabel tam turi ir specialių mygtukų &#8211; jų ieškokite viršutinėje įrankių juostoje.

Žemiau matome langą su pakaitukais ir taip pat su `\n` simboliu:<figure id="attachment_56" aria-describedby="caption-attachment-56" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-56" title="su-n-zyme_kbabel" src="/wp-content/uploads/2008/09/su-n-zyme_kbabel-300x197.png" alt="KBabel langas su failu, turinčiu 
 žymę" height="197" width="300" srcset="/wp-content/uploads/2008/09/su-n-zyme_kbabel-300x197.png 300w, /wp-content/uploads/2008/09/su-n-zyme_kbabel-150x98.png 150w, /wp-content/uploads/2008/09/su-n-zyme_kbabel.png 933w" sizes="(max-width: 300px) 100vw, 300px" />][7]<figcaption id="caption-attachment-56" class="wp-caption-text">KBabel langas su failu, turinčiu  
žymę</figcaption></figure> 

O štai tas pats tekstas Kate rengyklėje:<figure id="attachment_57" aria-describedby="caption-attachment-57" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-57" title="su-n-zyme_kate" src="/wp-content/uploads/2008/09/su-n-zyme_kate-300x197.png" alt="Kate langas su failu, turinčiu 
 žymę" height="197" width="300" srcset="/wp-content/uploads/2008/09/su-n-zyme_kate-300x197.png 300w, /wp-content/uploads/2008/09/su-n-zyme_kate-150x98.png 150w, /wp-content/uploads/2008/09/su-n-zyme_kate.png 706w" sizes="(max-width: 300px) 100vw, 300px" />][8]<figcaption id="caption-attachment-57" class="wp-caption-text">Kate langas su failu, turinčiu  
žymę</figcaption></figure> 

Šią žymę taip pat reikia tiksliai nukopijuoti iš originalo į vertimą.

Kiek ilgesnis tekstas su html formato žymėmis:<figure id="attachment_58" aria-describedby="caption-attachment-58" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-58" title="su-html-zymem_kbabel" src="/wp-content/uploads/2008/09/su-html-zymem_kbabel-300x197.png" alt="KBabel langas su failu, turinčiu html formato žymes" height="197" width="300" srcset="/wp-content/uploads/2008/09/su-html-zymem_kbabel-300x197.png 300w, /wp-content/uploads/2008/09/su-html-zymem_kbabel-150x98.png 150w, /wp-content/uploads/2008/09/su-html-zymem_kbabel.png 933w" sizes="(max-width: 300px) 100vw, 300px" />][9]<figcaption id="caption-attachment-58" class="wp-caption-text">KBabel langas su failu, turinčiu html formato žymes</figcaption></figure> 

Jos taip pat kopijuojamos tiksliai, kad vertimas atspindėtų originalą. Štai vaizdas Kate rengyklėje:<figure id="attachment_59" aria-describedby="caption-attachment-59" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-59" title="su-html-zymem_kate" src="/wp-content/uploads/2008/09/su-html-zymem_kate-300x197.png" alt="Kate langas su failu, turinčiu html formato žymių" height="197" width="300" srcset="/wp-content/uploads/2008/09/su-html-zymem_kate-300x197.png 300w, /wp-content/uploads/2008/09/su-html-zymem_kate-150x98.png 150w, /wp-content/uploads/2008/09/su-html-zymem_kate.png 706w" sizes="(max-width: 300px) 100vw, 300px" />][10]<figcaption id="caption-attachment-59" class="wp-caption-text">Kate langas su failu, turinčiu html formato žymių</figcaption></figure> 

Žemiau matote langą su daugiskaitos formomis:<figure id="attachment_60" aria-describedby="caption-attachment-60" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" class="size-medium wp-image-60" title="daugiskaita-kbabel" src="/wp-content/uploads/2008/09/daugiskaita-kbabel-300x197.png" alt="KBabel langas su daugiskaitos formų turinčiu failu" height="197" width="300" srcset="/wp-content/uploads/2008/09/daugiskaita-kbabel-300x197.png 300w, /wp-content/uploads/2008/09/daugiskaita-kbabel-150x98.png 150w, /wp-content/uploads/2008/09/daugiskaita-kbabel.png 933w" sizes="(max-width: 300px) 100vw, 300px" />][11]<figcaption id="caption-attachment-60" class="wp-caption-text">KBabel langas su daugiskaitos formų turinčiu failu</figcaption></figure> 

Tekstas atvėrus teksto rengykle atrodys taip:

```
#: dolphinview.cpp:1205
#, kde-format
msgctxt "@action:inmenu"
msgid "Paste One File"
msgid_plural "Paste %1 Files"
msgstr[0] "Padėti %1 failą"
msgstr[1] "Padėti %1 failus"
msgstr[2] "Padėti %1 failų"
```

O jei vertimas visiškai naujas ir dar nebuvo tvarkytas su programa „KBabel“, msgstr[2] eilutės net nebus, ją reikės patiems parašyti:

```
#:dolphinview.cpp:1205
#, kde-format
msgctxt "@action:inmenu"
msgid "Paste One File"
msgid_plural "Paste %1 Files"
msgstr[0] ""
msgstr[1] ""
```

Netikslaus vertimo eilutė su **fuzzy** žyme:

```
#: viewpropertiesdialog.cpp:133
#, fuzzy
#| msgctxt "@title:menu"
#| msgid "Additional Information"
msgctxt "@action:button"
msgid "Additional Information"
msgstr "Papildoma informacija"
```

Eilutę išvertus ar pataisius žymę **_fuzzy_** reikia ištrinti kartu su visa eilute:

```
#: viewpropertiesdialog.cpp:133
msgctxt "@action:button"
msgid "Additional Information"
msgstr "Papildoma informacija"
```

Trinamos ir eilutės, kurios prasideda **<span style="font-family: monospace;"><em>#|</em> </span>**ženklais. Jose nurodoma, kaip tekstas atrodė anksčiau, prieš jį pakeičiant programos kode. Šios žymės kartais naudingos vertėjams, tačiau išvertus eilutę jų palikti nebėra prasmės.

Kitokia _**fuzzy**_ eilutė:

```
#: ui/kis_bookmarked_configurations_editor.cc:68
#, fuzzy, kde-format
msgid "New configuration %1"
msgstr "Štačiakampis žymėjimas"
```

Trinant žymę teksto rengyklėje reikia ištrinti tik pirmąjį kablelį ir pačią žymę:

```
#: ui/kis_bookmarked_configurations_editor.cc:68
#, kde-format
msgid "New configuration %1"
msgstr "Nauja konfigūracija %1"
```

Tekstas, esantis failo gale, kurio programa daugiau nebenaudoja, ir kurį galima trinti (KBabel ištrina pati, be vartotojo nurodymo):

```
#~ msgctxt "@title:group"
#~ msgid "Others"
#~ msgstr "Kiti"
#~ msgctxt "@action:inmenu Sort By"
#~ msgid "Rating"
#~ msgstr "Reitingą"
```

Eilutė su įterpiamu lūžiu `\n`:

```
#: ui/kis_aboutdata.h:35
msgid "(c) 1999-2007 The Krita team.\n"
msgstr ""</pre>
```

Lūžis `\n` turi būti aktartojamas vertime:

```
#: ui/kis_aboutdata.h:35</span>
msgid "(c) 1999-2007 The Krita team.\n"
msgstr "(c) 1999-2007 Krita komanda.\n"
```

Kartais originalo tekste naudojamos ASCII kabutės. Kadangi kabutės yra ir skiriamasis eilučių ženklas *.po failuose, tais atvejais, kai jos pasitaiko tekste, jos yra įkomentuojamos (atšaukiamos) simboliu „`\`“:

```
#: kokross/KoScriptManager.cpp:202
#, kde-format
msgid "Could not read the package \"%1\"."
msgstr ""
```

Lietuvių kalboje angliškų kabučių nenaudojame. Versdami jas keičiame lietuviškomis kabutėmis, kurių įkomentuoti (atšaukti) nereikia:

```
#: kokross/KoScriptManager.cpp:202
#, kde-format
msgid "Could not read the package \"%1\"."
msgstr "Nepavyko perskaityti paketo „%1“."
```

Kartais, versdami anksčiau jau verstus (ar automatiškai generuotus) failus rasite eilučių su tokiu keistu msgstr turiniu:

```
#: kptview.cpp:244
#, fuzzy
"#-#-#-#-#\n"
msgid "Edit..."
msgstr ""
"#-#-#-#-# mii-ooo11-comp-20051005.po (ooo_Compendium-kde_format-20051001)  "
"Taisa...\n"
"#-#-#-#-# gnome-all-comp-20050902.po (GnomeCompendium_KDEformat_20050902)  "
"#-#-#-#-#\n"
"Keisti..."
```

Tokios eilutės – automatinio vertimo rezultatas. Verčiant automatiškai buvo rasti ne vienas, o keli variantai, kaip eilutę galima išversti. Todėl programa įterpė abu variantus („Edit“ yra verčiama ir „taisa“, ir „keisti“) ir atitinkamai pažymėjo juos, bei nurodė, iš kur buvo imti šie vertimo variantai.

Šiuo atveju išsirenkamas vienas galimas variantas, ir eilutė atrodo taip:

```
#: kptview.cpp:244
msgid "Edit..."
msgstr "Keisti..."
```

## *.po failo antraštė

Informacija rengiama

 [1]: {{< relref "kde-vertimo-vadovas" >}}
 [2]: http://kbabel.kde.org/
 [3]: http://l10n.kde.org/tools/
 [4]: /wp-content/uploads/2008/09/paprastas_langas.png
 [5]: /wp-content/uploads/2008/09/paprastas_langas-kate.png
 [6]: /wp-content/uploads/2008/09/pakaitukai-kbabel.png
 [7]: /wp-content/uploads/2008/09/su-n-zyme_kbabel.png
 [8]: /wp-content/uploads/2008/09/su-n-zyme_kate.png
 [9]: /wp-content/uploads/2008/09/su-html-zymem_kbabel.png
 [10]: /wp-content/uploads/2008/09/su-html-zymem_kate.png
 [11]: /wp-content/uploads/2008/09/daugiskaita-kbabel.png