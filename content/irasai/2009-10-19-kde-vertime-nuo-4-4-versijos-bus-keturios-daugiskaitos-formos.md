---
title: KDE vertime nuo 4.4 versijos bus keturios daugiskaitos formos
author: Donatas G.
type: post
date: 2009-10-19T09:41:36+00:00
#url: /?p=148
categories:
  - vertimas
tags:
  - daugiskaita
  - kde4
  - naujienos
  - vertimas
---
KDE 4.4 versijoje lietuviškas vertimas turės jau keturias daugiskaitos formas. Tokiu būdu KDE vertėjų komanda siekia pagerinti lietuvišką KDE sąsają, geriau pritaikyti ją prie lietuvių kalbos normų.

Šiuo metu ir KDE, ir visi kiti laisvosios programinės įrangos projektai, naudojantys [gettext][1] programų lokalizavimo priemonę, turi tris daugiskaitos formas. Kiekviena kalba jų turi skirtingą skaičių. 

<!--more-->Pvz., anglų kalba, iš kurios verčiame KDE programas, turi dvi daugiskaitos formas: 

```
„The program has downloaded one message“
„The program has downloaded %1 messages“
``` 

Iki šiol, verčiant į lietuvių kalbą, darydavome tris daugiskaitos formas: 

```
„Programa atsisiuntė %1 pranešimą“  (1, 21, 31 ir pan.)
„Programa atsisiuntė %1 pranešimus“ (2-9, 22-29 ir pan.)
„Programa atsisiuntė %1 pranešimų“ (10-20, 30 ir pan.)
```

Nuo šiol daugiskaitos formų bus keturios: 

```
„Programa atsisiuntė vieną pranešimą“ (tik 1)
„Programa atsisiuntė %1 pranešimus“ (2-9, 22-29 ir pan.)
„Programa atsisiuntė %1 pranešimų“ (10-20, 30 ir pan.)
„Programa atsisiuntė %1 pranešimą“  (21, 31, 41...)
```

KDE vertėjų komandos koordinatoriaus Andrius Š. apie atliktą pakeitimą KDE vertėjus informavo dar spalio 6 dieną, pridurdamas, kad prie 4 daugiskaitos formų siūlo pereiti ir kitiems laisvosios programinės įrangos projektams, pvz., Gnome: 

> Kiek pastebėjau konvertuodamas, kur kas gražiau verčiasi esant 4 [daugiskaitos] formoms, todėl rekomenduočiau ir GNOME&#8217;ui, ir kitiems lietuvinimo projektams taip pat pereiti prie 4 daugiskaitos formų.

Taigi, nuo šiol, versdami naujus failus, turėsime gettext formato *.po failo antraštėje rašyti tokią daugiskaitos formų eilutę:

```
"Plural-Forms: nplurals=4; plural=(n==1 ? 0 : n%10>=2 && (n%100<10 || n"
"%100>=20) ? 1 : n%10==0 || (n%100>10 && n%100<20) ? 2 : 3);\n"
```

KDE programinės įrangos vertimo programoje Lokalize nuo 4.4 versijos bu galimybė pasirinkti keturių daugiskaitos formų eilutę vietoje šiuo metu standartinės trijų formų eilutės. O kol kas ją teks taisyti rankiniu būdu.

 [1]: http://www.gnu.org/software/gettext/