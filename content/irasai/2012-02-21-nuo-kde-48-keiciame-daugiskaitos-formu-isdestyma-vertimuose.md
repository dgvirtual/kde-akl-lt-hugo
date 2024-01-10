---
title: Nuo KDE 4.8 keičiame daugiskaitos formų išdėstymą vertimuose
author: Donatas G.
type: post
date: -001-11-30T00:00:00+00:00
draft: true
#url: /?p=279
categories:
  - Bendra
---
Nuo KDE 4.4 iki šiol daugiskaitos formos KDE vertime buvo išdėstytos tokia tvarka:

```
„Programa atsisiuntė vieną pranešimą“ (tik 1)
„Programa atsisiuntė %1 pranešimą“  (21, 31, 41...)
„Programa atsisiuntė %1 pranešimus“ (2-9, 22-29 ir pan.)
„Programa atsisiuntė %1 pranešimų“ (10-20, 30 ir pan.)
``` 

O daugiskaitos formas apibūdinanti eilutė KDE vertimuose atrodydavo taip:

<del datetime="2012-02-21T03:51:47+00:00"><code>"Plural-Forms: nplurals=4; plural=(n==1 ? 0 : n%10>=2 && (n%100&lt;10 || n"
"%100>=20) ? 1 : n%10==0 || (n%100>10 && n%100&lt;20) ? 2 : 3);\n"</code></del>

Deja, vienas pagrindinių Linux distributyvų Lietuvoje – Ubuntu – per du metus niekaip nesugebėjo prisitaikyti prie KDE vertimo komandos padarytų pakeitimų – perėjimo prie 4 daugiskaitos formų vietoje trijų – mat Ubuntu naudoja nuosavą ir nelabai lanksčią žiniatinklio programą vertimui „Rosetta“ (žr. klaidos pranešimą <a href="https://bugs.launchpad.net/ubuntu/+source/language-pack-kde-lt-base/+bug/782031" title="782031" target="_blank">782031</a>. O Rosetta leidžia tik vieną daugiskaitos sistemą vienai kalbai ir ignoruoja verčiamame faile esančią daugiskaitos formų eilutę. Tad Rosetta, eksportuodama turimus vertimus, juos sudarko – tiesiog išmeta ketvirtąją formą, o likusias tris interpretuoja kaip baigtinį sąrašą. Todėl, pvz., išsiregistruojant iš KDE aplinkos ant ekrano rodomas laiko skaitliukas praneša, kad iki išsiregistravimo liko „1 sekundė“, „29 sekundės“, „28 sekundės“ ir t.t., 

Ką gi, atsižvelgiant į tai, kad Ubuntu vartotojai jau du metus gauna suklaipytą KDE vertimą, vertėjų komanda pertvarkė daugiskaitos formų išdėstymą, kad papildomai pridėta ketvirtoji forma būtų ketvirta iš eilės (nors logiškai turėtų būti antra) ir jos „nupjovimas“ neturėtų tokių liūdnų pasekmių. 

Taigi, naujoji išdėstymo tvarka:

```
„Programa atsisiuntė vieną pranešimą“ (tik 1)
„Programa atsisiuntė %1 pranešimus“ (2-9, 22-29 ir pan.)
„Programa atsisiuntė %1 pranešimų“ (10-20, 30 ir pan.)
„Programa atsisiuntė %1 pranešimą“  (21, 31, 41...)
```

O daugiskaitos formas apibūdinanti eilutė KDE vertimuose atrodydavo taip:

```
"Plural-Forms: nplurals=4; plural=(n==1 ? 0 : n%10>=2 && (n%100<10 || n"
"%100>=20) ? 1 : n%10==0 || (n%100>10 && n%100<20) ? 2 : 3);\n"
```