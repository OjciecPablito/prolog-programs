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
prowdopodobnie_zamordowana(agnieszka,kij_golfowy).
prowdopodobnie_zamordowana(agnieszka,łow).

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

%reguly

%Osoba prawdopodobnie posiada buty piłkarskie lub piłkę jeśli jest piłkarzem
posiada(X,but_piłkarski):- osoba(X,_,piłkarz).
posiada(X,piłka):- osoba(X,_,piłkarz).
%Osoba prawdopodobnie posiada noż jeśli jest rzeźnikiem
posiada(X,nóż):- osoba(X,_,rzeźnik)
%Osoba prawdopodobnie posiada noż bądź nożyczki jeśli jest chirurgiem
posiada(X,nożyczki):- osoba(X, _, chirurg)
posiada(X,nóż):- osoba(X,_,chirurg)
%Osoba prawdopodobnie posiada łom jeśli jest złodziejem
posiada(X,łom):- osoba(X, _, złodziej)
%Osoba prawdopodobnie posiada nogę od stołu jeśli jest stolarzem
posiada(X, noga_od_stołu):- osoba(X, _, stolarz)