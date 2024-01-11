---
title: 3G/GPRS ryšio konfigūravimas Kubuntu Intrepid operacinėje sistemoje (howto)
author: Donatas G.
type: post
date: 2009-01-24T23:28:09+00:00
#url: /?p=100
categories:
  - HOWTO
  - Programos
tags:
  - 3G
  - gprs
  - knetworkmanager
---
Šiandien į savo nešiojamą kompiuterį įkišęs telefono Sony Ericsson K530i USB laidą staiga pamačiau, kad tinklo prisijungimus tvarkanti programa [KNetworkManager][1] mano įkištą telefoną (kurį ketinau naudoti kaip modemą jungiantis prie interneto) pastebėjo. Prieš prijungiant modemą KNetworkManager meniu atrodė taip: 

<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/pries_modema.jpeg" alt="pries_modema" title="pries_modema" width="386" height="216" class="alignnone size-full wp-image-101" srcset="/wp-content/uploads/2009/01/pries_modema.jpeg 386w, /wp-content/uploads/2009/01/pries_modema-150x83.jpg 150w, /wp-content/uploads/2009/01/pries_modema-300x167.jpg 300w" sizes="(max-width: 386px) 100vw, 386px" /> 

O prijungus modemą – jau taip:

<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/po_modemo.jpeg" alt="po_modemo" title="po_modemo" width="372" height="270" class="alignnone size-full wp-image-102" srcset="/wp-content/uploads/2009/01/po_modemo.jpeg 372w, /wp-content/uploads/2009/01/po_modemo-150x108.jpg 150w, /wp-content/uploads/2009/01/po_modemo-300x217.jpg 300w" sizes="(max-width: 372px) 100vw, 372px" /> 

Taigi, atsirado du nauji įrenginiai greta jau anksčiau buvusių eth0 (laidinio tinklo įrenginio) ir eth1 (belaidžio tinklo įrenginio): ttyACM0 ir usb0. Žalio supratimo neturiu, kam reikalingas usb0, bet ttyACM0 naudojamas jungiantis prie žiniatinklio. 

Šaunu! &#8211; pagalvojau. Jau buvau skaitęs, kad Kubuntu Linux operacinės sistemos 8.10 versijoje yra įdiegta 0.7 programos NetworkManager versija, kuri jau sugeba tvarkyti ir _dialup_ tipo prisijungimus (tiek senuosius modemo ryšius, tiek ir GPRS/EDGE/3G tinklo prisijungimus). Bet galvojau, kad KDE aplinkai skirtas grafinis įrankis KNetworkManager šių gudrybių dar nemoka&#8230; O pasirodo, moka! 

<!--more-->

Taigi nusprendžiau susikonfigūruoti prieigą taip, kad ją valdytų NetworkManager. Anksčiau prie interneto jungdavausi arba komandų eilutės priemonėmis, arba programa KPPP, tačiau jungiantis šiais būdais reikėdavo visaip apgaudinėti NetworkManager, kuris galvodavo, kad kompiuteris prie interneto neprijungtas ir neleisdavo dideliai daliai programų palaikyti interneto ryšio. 

Taigi, dariau žemiau išvardintus žingsnius. Konfigūravau modemą prisijungimui prie Bitė GSM wap paslaugos, tad kitų operatorių atveju nustatymai gali skirtis.

1. Iš „New Connection&#8230;“ meniu išsirinkau „ttyACM0“:<figure id="attachment_104" aria-describedby="caption-attachment-104" style="width: 466px" class="wp-caption alignnone">

<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/new_connection.jpeg" alt="Naujo prisijungimo konfigūravimo meniu" title="new_connection" width="466" height="276" class="size-full wp-image-104" srcset="/wp-content/uploads/2009/01/new_connection.jpeg 466w, /wp-content/uploads/2009/01/new_connection-150x88.jpg 150w, /wp-content/uploads/2009/01/new_connection-300x177.jpg 300w" sizes="(max-width: 466px) 100vw, 466px" /> <figcaption id="caption-attachment-104" class="wp-caption-text">Naujo prisijungimo konfigūravimo meniu</figcaption></figure> 

2. Pirmajame pasirodžiusio vediklio dialoge, laukelyje „Network Type“ pasirinkau „GPRS“; APN įrašiau „WAP“; kitų numatytųjų nustatymų nekeičiau:<figure id="attachment_117" aria-describedby="caption-attachment-117" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas1-300x159.jpg" alt="Prisijungimo konfigūravimo vediklis - 1 dialogas" title="knm_konfiguravimas1" width="300" height="159" class="size-medium wp-image-117" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas1-300x159.jpg 300w, /wp-content/uploads/2009/01/knm_konfiguravimas1-150x79.jpg 150w, /wp-content/uploads/2009/01/knm_konfiguravimas1.jpeg 654w" sizes="(max-width: 300px) 100vw, 300px" />][2]<figcaption id="caption-attachment-117" class="wp-caption-text">Prisijungimo konfigūravimo vediklis - 1 dialogas</figcaption></figure> 

**DĖMESIO:** APN yra labai svarbus parametras, priklausomai nuo jo galite gauti labai skirtingo dydžio sąskaitas&#8230; Bitės ryšio atveju dar gali būti ir standartinis APN – BANGA. Jį reikia rašyti konfigūruojant prisijungimą prie interneto kuriam nors standartiniam Vodafone Mobile Connect abonentui.

3. Antrajame vediklio dialoge pažymėjau parinktis „No Authorization“ ir „CRTSCTS“; kitų nustatymų nekeičiau:<figure id="attachment_106" aria-describedby="caption-attachment-106" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas2-300x159.jpg" alt="Prisijungimo konfigūravimo vediklis - 2 dialogas" title="knm_konfiguravimas2" width="300" height="159" class="size-medium wp-image-106" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas2-300x159.jpg 300w, /wp-content/uploads/2009/01/knm_konfiguravimas2-150x79.jpg 150w, /wp-content/uploads/2009/01/knm_konfiguravimas2.jpeg 654w" sizes="(max-width: 300px) 100vw, 300px" />][3]<figcaption id="caption-attachment-106" class="wp-caption-text">Prisijungimo konfigūravimo vediklis - 2 dialogas</figcaption></figure> 

4. Trečiajame dialoge nieko nekeičiau 🙂 ; netgi negalėčiau pasakyti, ką visi tie numatytieji nustatymai reiškia:<figure id="attachment_107" aria-describedby="caption-attachment-107" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas3-300x159.jpg" alt="Prisijungimo konfigūravimo vediklis - 3 dialogas" title="knm_konfiguravimas3" width="300" height="159" class="size-medium wp-image-107" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas3-300x159.jpg 300w, /wp-content/uploads/2009/01/knm_konfiguravimas3-150x79.jpg 150w, /wp-content/uploads/2009/01/knm_konfiguravimas3.jpeg 654w" sizes="(max-width: 300px) 100vw, 300px" />][4]<figcaption id="caption-attachment-107" class="wp-caption-text">Prisijungimo konfigūravimo vediklis - 3 dialogas</figcaption></figure> 

5. Ketvirtajame dialoge vėlgi, nekeičiau nieko; prisijungiant prie Bitės tinklo nenaudojami statiniai IP adresai: <figure id="attachment_108" aria-describedby="caption-attachment-108" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas4-300x159.jpg" alt="Prisijungimo konfigūravimo vediklis - 4 dialogas" title="knm_konfiguravimas4" width="300" height="159" class="size-medium wp-image-108" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas4-300x159.jpg 300w, /wp-content/uploads/2009/01/knm_konfiguravimas4-150x79.jpg 150w, /wp-content/uploads/2009/01/knm_konfiguravimas4.jpeg 654w" sizes="(max-width: 300px) 100vw, 300px" />][5]<figcaption id="caption-attachment-108" class="wp-caption-text">Prisijungimo konfigūravimo vediklis - 4 dialogas</figcaption></figure> 

6. Penktajame dialoge įrašiau prisijungimo pavadinimą: <figure id="attachment_109" aria-describedby="caption-attachment-109" style="width: 300px" class="wp-caption alignnone">

[<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas5-300x159.jpg" alt="Prisijungimo konfigūravimo vediklis - 5 dialogas" title="knm_konfiguravimas5" width="300" height="159" class="size-medium wp-image-109" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas5-300x159.jpg 300w, /wp-content/uploads/2009/01/knm_konfiguravimas5-150x79.jpg 150w, /wp-content/uploads/2009/01/knm_konfiguravimas5.jpeg 654w" sizes="(max-width: 300px) 100vw, 300px" />][6]<figcaption id="caption-attachment-109" class="wp-caption-text">Prisijungimo konfigūravimo vediklis - 5 dialogas</figcaption></figure> 

Na štai, tada beliko paspausti Connect & Save“ mygtuką&#8230; ir aš &#8211; internete, ką liudija ir pasikeitęs KNetworkManager ženkliukas:<figure id="attachment_114" aria-describedby="caption-attachment-114" style="width: 196px" class="wp-caption alignnone">

<img loading="lazy" decoding="async" src="/wp-content/uploads/2009/01/knm_konfiguravimas-zenkliukas.jpeg" alt="KNetworkManager ženkliukas  3G ryšiui" title="knm_konfiguravimas-zenkliukas" width="196" height="94" class="size-full wp-image-114" srcset="/wp-content/uploads/2009/01/knm_konfiguravimas-zenkliukas.jpeg 196w, /wp-content/uploads/2009/01/knm_konfiguravimas-zenkliukas-150x71.jpg 150w" sizes="(max-width: 196px) 100vw, 196px" /> <figcaption id="caption-attachment-114" class="wp-caption-text">KNetworkManager ženkliukas 3G ryšiui</figcaption></figure> 

Dar keletas pastabų dėl KNetworkManager: 

1. Nežinau kaip sukonfigūruoti prisijungimą per mobilųjį telefoną, jei jungtis tarp telefono ir mobilaus telefono yra ne USB kabelis, o Bluetooth ryšys; Bluetooth įrenginio RFCOMM0 kažkodėl KNetworkManager nefiksuoja. Gal tai tik laikinas programos trūkumas ar klaida?

2. Man nepavyko sukurti dviejų skirtingų prisijungimų: antrasis kažkodėl neveikė (to man reikia, nes kartais su nešiojamu kompiuteriu naudoju Express Card tipo modemą su Vodafone Mobile Connect interneto planu, o kartais – savo mobilųjį telefoną su WAP prieiga ir paprastu GSM abonento mokėjimo planu.

 [1]: http://en.opensuse.org/Projects/KNetworkManager
 [2]: /wp-content/uploads/2009/01/knm_konfiguravimas1.jpeg
 [3]: /wp-content/uploads/2009/01/knm_konfiguravimas2.jpeg
 [4]: /wp-content/uploads/2009/01/knm_konfiguravimas3.jpeg
 [5]: /wp-content/uploads/2009/01/knm_konfiguravimas4.jpeg
 [6]: /wp-content/uploads/2009/01/knm_konfiguravimas5.jpeg

## Komentarai

### Vidmantas, 2009 m. sausio 25 d.
Bent jau Omnitelis dalina kai kuriuos &#8222;flip-flop&#8221; tipo įrenginius, tai prieš konfigūruojant KNetworkManager, teks susirasti kaip perjungti USB įrenginuką į modemo rėžimą 🙂

### linius, 2009 m. sausio 26 d.
kad veiktu per Bluetooth, isidiegiau blueman&#8230;&#8230;

### Donatas G., 2009 m. sausio 26 d.
Liniau, o kaip naudoti tą blueman (ar bluemon)? Mielai papildyčiau šį howto&#8230; Ir pačiam man būtų naudinga.

### Donatas G., 2009 m. sausio 26 d.
Štai čia:  
<a href="http://www.draisberghof.de/usb_modeswitch/" rel="nofollow ugc">http://www.draisberghof.de/usb_modeswitch/</a>  
yra įrankis kai kuriems USB modemams pervesti iš „usb mass storage“ į modemo veikseną&#8230;

### linius, 2009 m. kovo 15 d.
<a href="http://blueman-project.org/" rel="nofollow ugc">http://blueman-project.org/</a>  
čia išsamiai aprašoma kaip su blueman pagalba tvarkytis per bluetooth&#8230;.3G/EDGE/GPRS, Connecting to/Creating bluetooth networks, Connecting to input devices, Connecting to audio devices, Sending/Receiving/Browsing files via OBEX, Pairing&#8230;..
