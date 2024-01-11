---
title: Apie PulseAudio naudojimą KDE aplinkoje
author: Donatas G.
type: post
date: 2010-02-19T10:14:40+00:00
#url: /?p=212
categories:
  - HOWTO
  - Programos
tags:
  - kde4
  - pulseaudio
---
<figure id="attachment_213" aria-describedby="caption-attachment-213" style="width: 300px" class="wp-caption right"><a href="/wp-content/uploads/2010/02/pulseaudio_valdymas.jpg"><img loading="lazy" decoding="async" src="/wp-content/uploads/2010/02/pulseaudio_valdymas-300x187.jpg" align="right" alt="" title="PulseAudio garsų serverio valdymo įrankiai KDE aplinkoje" width="300" height="187" class="size-medium wp-image-213" srcset="/wp-content/uploads/2010/02/pulseaudio_valdymas-300x187.jpg 300w, /wp-content/uploads/2010/02/pulseaudio_valdymas-150x93.jpg 150w, /wp-content/uploads/2010/02/pulseaudio_valdymas-1024x640.jpg 1024w, /wp-content/uploads/2010/02/pulseaudio_valdymas.jpg 1280w" sizes="(max-width: 300px) 100vw, 300px" /></a><figcaption id="caption-attachment-213" class="wp-caption-text">PulseAudio garsų serverio valdymo įrankiai KDE aplinkoje</figcaption></figure> 

Kelias pastarąsias dienas vis probėgom sprendžiau savo nešiojamo kompiuterio audio problemas. Gal ir negaliu pernelyg peikti Linux audio posistemės, nes pats mėgstu nestabilias, ne itin išbaigtas ar užtektinai neišbandytas sistemas, tačiau šį kartą (jau eilinį) kovą su savo nešiojamajame kompiuteryje esančiu Linux baigiu paliaubomis taip ir nesupratęs, kaip pasiekti pergalę 🙂

Taigi, prieš kelias dienas pastebėjau, kad kažkodėl nebegroja garso naršyklių adobe-flashplugin įskiepis. Kartu „nutilo“ ir kas antra audio/video programa: VLC, Kaffeine, o SMPlayer groti priverčiau tik šios programos nustatymuose pakeitęs anksčiau problemų nekėlusį Alsa 0.0 audio įrenginį į Alsa 0.1… Tuo tarpu Amarok, Dragonplay toliau sėkmingai grojo garsą…

Plačiau apie PulseAudio naudojimo KDE aplinkoje ypatumus skaitykite šiame tinklaraščio įraše: [„PulseAudio, KDE ir adobe-flashplugin: keista mišrainė“][2]

 [2]: http://dg.lapas.info/?p=550

## Komentarai

### NerijusV, 2010 m. balandžio 27 d.
Sveiki,

Pas mane tai kita problema su garsu. Gana menkas garsas. Kiek visko isbandziau rezultatu nera. Gal kas zinot kaip pagarsint KDE 4.4.2 😀

### Donatas G., 2010 m. balandžio 27 d.
O PulseAudio paleistas, ar ne? 

Jei be PulseAudio, pažiūrėk, ar visi reikiami kanalai maksimaliai pagarsinti. Pvz., Kmix lange pas mane kažkuri programa pritylina PCM kanalą, kuris numažina bendrą garsą, nors „Master“ kanale nustatyta 100% garsumo. Kartais tų reikiamų kanalų gali nerodyti; paieškok jų per meniu „Nustatymai“ > „Konfigūruoti kanalus“.

### NerijusV, 2010 m. balandžio 28 d.
he he he aciu kad pasakiai isimeciau i reguliavima daugiau kanalu ir visus max padariau tai kai uz griaudejo :DDDDDD thanks lb
