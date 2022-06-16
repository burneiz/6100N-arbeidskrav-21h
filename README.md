<h1>6100N Innføring i Linux - Arbeidskrav - 2021 - USN Bø</h1>

<h2>Oppgave 2A) Pyramide</h2>
Programmet skal kunne startes med tall parameter mellom 1 og 9. Eksempelvis kan bruker skrive:
pyramide 4

Da skal programmet lage en «pyramide» med størrelse 4. <br> Dersom det ikke er gitt noen parameter, skal programmet spørre bruker om et tall mellom 1 og 9.
pyramide

Hvor stor? 4

Så skal programmet skrive ut pyramiden ved hjelp av «dobbel løkke» løkke inni løkke:

1<br>
2 2<br>
3 3 3<br>
4 4 4 4<br>
osv. til innlest tall.
Dersom du klarer å få til denne varianten er det enda bedre:<br>
-------1<br>
------2 2<br>
-----3 3 3<br>
----4 4 4 4<br>
osv. til innlest tall.

Programmet bør gi fornuftig feilmelding når bruker gir gal verdi.
<h2>Preview:</h2>

![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Pyramide/pyramide.png?raw=true)

<h2>Oppgave 2B) Random spill</h2>
Programmet trekker et tilfeldig tall mellom 1 og 100, bruker skal gjette tallet iterativt (om igjen) til suksess. <br>
For hver runde skal programmet rapportere om bruker sitt forslag er mindre eller større enn det korrekte. <br>
Om bruker foreslår 0 skal det tolkes som at han/hun gir opp, og spillet avsluttes da med melding om det korrekte tal let. <br>
Når et spill er over skal programmet spørre bruker om hun vil fortsette, og i så fall trekke og starte nytt spill. <br>
Bruk gjerne funksjoner til å modularisere koden.<br>
<br>
Eksempel på kjøring, understrekede elementer viser brukerens input:
random<br>
Gjett det hemmelige tallet: 50<br>
50 er mindre enn det hemmelige tallet<br>
Gjett det hemmelige tallet: 70<br>
70 er mindre enn det hemmelige tallet<br>
Gjett det hemmelige tallet: 80<br>
80 er større enn det hemmelige tallet<br>
Gjett det hemmelige tallet: 75<br>
75 er mindre enn det hemmelige tallet<br>
Gjett det hemmelige tallet: 77<br>
77 er riktig!<br>
Vil du spille en gang til? J<br>
Gjett det hemmelige tallet: 50<br>
50 er større enn det hemmelige tallet<br>
Gjett det hemmelige tallet: 0<br>
Du valgte å avslutte. Det hemmelige tallet var 42. Takk for nå!<br>

<h2>Preview:</h2>

![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Random_spill/random_spill.png?raw=true)

<h2>Oppgave 2C) Diskopprydding</h2>

Dette er en litt større og vanskeligere oppgave, men den er også åpnere, kan løses på ulike måter.<br>
Du skal lage et program som hjelper bruker med å rydde på disken. For hver fil som er større enn en<br>
gitt grense, skal filnavnet vises til bruker. Bruker skal så kunne velge om den fila skal<br>
1. Slettes.
2. Komprimeres.
3. Ikke røres (ignoreres).

Så går programmet til neste store fil. Bruker skal kunne spesifisere grense for størrelse, helst med opsjon.<br> 
Bruker skal også kunne angi, med parametre, hvilken eller hvilke kataloger som skal behandles,<br>
og helst (med en opsjon) om programmet skal jobbe rekursivt, dvs. behandle underkataloger av angitt katalog på samme måte.<br> 
Endelig skal programmet kunne produsere en loggfil der det står hvilke filer som var større enn grensen, og hvilket tiltak (1 3) som ble utført.<br>
Også dette med loggfil styrer brukeren med opsjon. <br>
For å tolke brukerens parametere og opsjoner bør du ABSOLUTT følge mønsteret som du finner på side 9 i lysark fra kapittel 32, case inni while.<br>
<br>
Total syntaks for bruk av programmet kan typisk være:<br>
diskrydding [ str ] l loggfil ] r] [ katalog] ...


<h2>Preview:</h2>

![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Diskrydding/for_slett.png?raw=true)
![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Diskrydding/etter_slett.png?raw=true)
![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Diskrydding/komprimering.png?raw=true)
![alt text](https://github.com/newmanman/6100N-arbeidskrav-21h/blob/main/Diskrydding/log_fil.png?raw=true)
