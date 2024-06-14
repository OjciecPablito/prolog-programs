%fakty
osoba(tomasz,55,stolarz).
osoba(krzysztof,25,piłkarz).
osoba(krzysztof,25,rzeźnik).
osoba(piotr,25,złodziej).
osoba(anna,39,chirurg).

romans(anna, piotr).
romans(anna, krzysztof).
romans(agnieszka, piotr).
romans(agnieszka,tomasz).
zamordowana(agnieszka).
prawdopodobnie_zamordowana(agnieszka,kij_golfowy).
prawdopodobnie_zamordowana(agnieszka,łow).

pobrudzony(tomasz,krew).
pobrudzony(agnieszka,krew).
pobrudzony(krzysztof,krew).
pobrudzony(krzysztof,błoto).
pobrudzony(piotr,błoto).
pobrudzony(anna,krew).

posiada(tomasz,sztuczna_noga).
posiada(piotr,rewolwer).

podobne_obrażenia(sztuczna_noga,kij_golfowy).
podobne_obrażenia(noga_od_stołu,kij_golfowy).
podobne_obrażenia(łom,kij_golfowy).
podobne_obrażenia(nożyczki,nóż).
podobne_obrażenia(but_piłkarski,kij_golfowy).

mężczyzna(piotr).
mężczyzna(krzysztof).
mężczyzna(tomasz).
kobieta(anna).
kobieta(agnieszka).

%--------------------
%Reguly

%Osoba prawdopodobnie posiada buty piłkarskie lub piłkę jeśli jest piłkarzem
posiada(X,but_piłkarski):- osoba(X,_,piłkarz).
posiada(X,piłka):- osoba(X,_,piłkarz).
%Osoba prawdopodobnie posiada noż jeśli jest rzeźnikiem
posiada(X,nóż):- osoba(X,_,rzeźnik).
%Osoba prawdopodobnie posiada noż bądź nożyczki jeśli jest chirurgiem
posiada(X,nożyczki):- osoba(X, _, chirurg).
posiada(X,nóż):- osoba(X,_,chirurg).
%Osoba prawdopodobnie posiada łom jeśli jest złodziejem
posiada(X,łom):- osoba(X, _, złodziej).
%Osoba prawdopodobnie posiada nogę od stołu jeśli jest stolarzem
posiada(X, noga_od_stołu):- osoba(X, _, stolarz).
%Określenie kto ma narzędzie zbrodni
posiada(X, narzędzie_zbrodni):- posiada(X, rewolwer);
                                posiada(X, nóż);
                                posiada(X, nożyczki);
                                posiada(X, łom);
                                posiada(X, kij_golfowy);
                                posiada(X, noga_od_stołu);
                                posiada(X, sztuczna_noga).
% Osoba jest podejrzana jeśli prawdopodobnie posiada narzędzie
% którego uderzenie powoduje podobne obrażenia jak narzędzie, którym
% została uderzona osoba zamordowana
podejrzany(X):-zamordowana(Z), prawdopodobnie_zamordowana(Z, Y),
    podobne_obrażenia(N, Y), posiada(X, N).
% Motywem osoby będącej mężczyzną jest zazdrość jeśli mężczyzna miał romans z
% osobą zamordowaną
motyw(X, zazdrość):-mężczyzna(X), zamordowana(Z), romans(Z, X).
% Motywem osoby będącej kobietą jest zazdrość jeśli kobieta miała romans z
% tym samym mężczyzną 
motyw(X, zazdrość):-kobieta(X), zamordowana(Z), romans(Z, M), 
    romans(X,M), X \= Z.
% Motywem osoby będącej mężczyzną są pieniądze jeśli jest on złodziejem
motyw(X, pięniądze):-mężczyzna(X), osoba(X, _, złodziej).
% Mordercą jest osoba podejrzana, posiadająca motyw i która była
% pobrudzona tą samą substancjąco osoba zamordowana
morderca(X):- podejrzany(X), motyw(X,_), zamordowana(Z),
    pobrudzony(Z,S), pobrudzony(X, S).

motyw_mordercy(M):- morderca(X), motyw(X, M).
