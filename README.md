# PEVS - Uvod do databaz - Podnikový archív

Teamovy skolsky projekt pre predmet 'Uvod do databaz'

Tento repozitar sluzi ako miesto pre ukladanie suborov pre teamovy projekt na Pan Europskej vysokej skole. Zadanie cislo jedna - podnikovy archiv. V tomto zadani je potrebne navrhnut a realizovat databazu potencialneho archivu. Konecny vysledok na zahrnat: dump databazy, dopyty, ERD diagram...

## Team

Jan Ondis - veduci projektu

Monika Ruzickova Kucerova

Martin Chabada

## Rozdelenie uloh

Jan Ondis - rozdelenie a kontrolovanie uloh, naplnenie databazy dummy datmi, triggre, procedury.✅

Monika Ruzickova Kucerova - navrh a vytvorenie tabuliek.✅

Martin Chabada - Dopyty, useri, views. ❌


## Opisanie databazy
### Bussiness logika
Ocakava sa, ze s databazou bude najcastejsie pracovat archivar, ktory bude nie len robit dopyty, ale taktiez vytvarat nove zaznami v databaze. Kazda interakcia s dokumentom je za pritomnosti archivera.

Hlavne data (zaznami o archivacii) su ulozene v 'archive' tabulke, ktora odkazuje na vsetky vedlajsie data (zamestnanci, lokacie, typy dokumentov). Neocakava sa, ze vedlajsie data budu pribudat pravidelne/velmi casto.

V pripade, ze archivar bude mat noveho kolegu, ktory sa este stale len zaskoluje. Dostane ucet do databazy, ktory bude mat prava len na upravu tabuliek 'hlavnych' dat t. j. archivacnych zaznamoch. Vedlajsie data bude moct upravovat iba skuseny pouzivatel.

Do databazy budu taktiez pristupovat aj backendove aplikacie. Tieto aplikacie maju pristup iba na citanie dat, nakolko sa ocakava, ze akakolvek interakcia s archivom je za pritomnosti archivera a iba on po archivacii dokumentu vytvori zaznam v databaze.

Archiver je zodpovedny za pridelovanie pristupu do archivu - ku dokumentom. Kazda lokacia vyzaduje urcity security pristup, ktory archiver musi skontrolovat. Pre zobrazenie tohto pristupu su vytvorene 2 dopyty.

### Struktura tabuliek
Jadrom/hlavnou tabulkou je 'archive' ktora obsahuje zaznami o archivacii. Kazdy zaznam nasledne odkazuje na data z tychto 3 kategorii:
- dokument (meno dokumentu, typ dokumentu, poznamku ku dokumentu...)
- personalne informacie (meno osoby, jeho adresu/kontakt, oddelenie, pristupove prava...)
- lokacne (v ktorej sekcii sa nachadza archivovany dokument, v ktorej polici, ake su jeho pristupove prava)

### Reporting

Ocakava sa, ze bude potrebne hlasit managementu statistiky archivu. Pre tento ucel existuju dopyty, ktore zobrazia: ktore oddelenie archivuje najviac dokumentov, kolko dokumentov je v kazdej lokacii, kto moze pristupovat ku akym dokumentom, kto archivoval dokumenty za poslednych 30 dni. 