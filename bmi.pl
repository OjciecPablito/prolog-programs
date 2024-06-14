/*
dane są fakty opisane predykatem osoba(imię, wzrost, waga)
Stosując wzór na obliczenie wzkaźnika bmi (mody mass of index)
Postać wzoru:
    Bmi = waga/(wzrost/100)^2

Zadanie:
Napisz reguły bmi(X, Y).
gdzie:  X - dana osoba
        Y - wynik na co cierpi osoba

Przyjęta ocena wkaźnika:
    bmi < 20        niedowaga
    20 <= bmi < 25  zdrowy
    25 <= bmi < 35  nadwaga
    35 <= bmi < 40  otyłość
    40 <= bmi       chorobliwa otyłość
*/
% Fakty
osoba(ala, 170, 80).
osoba(zosia, 180, 50).
osoba(andrzej, 160, 80).
osoba(jan, 170, 84).
osoba(ja, 170, 75).

% Reguły
bmi(X, Y):-osoba(X,Wzrost, Waga), Bmi is Waga/(Wzrost/100)^2,
    (
        (Bmi < 20, Y = niedowaga);
        (Bmi >= 20, Bmi < 25, Y = zdrowy);
        (Bmi >= 25, Bmi < 35, Y = nadwaga);
        (Bmi >= 35, Bmi < 40, Y = otyłość);
        (Bmi >= 40, Y = chorobliwa_otyłość)

    ).

% Rekurencja
/*
silnia(n)=silnia(n-1)*N, N>1
silnia(1)=1

silnia(5)=silnia(4)*5   = 24*5 = 120
silnia(4)=silnia(3)*4   = 6*4 = 24
silnia(3)=silnia(2)*3   = 2*3 = 6
silnia(2)=silnia(1)*2   = 1*2 = 2
silnia(1)=1
*/
silnia(1, 1).
silnia(W,N):- N > 1, N1 is N-1, silnia(W1, N1), W is W1*N.