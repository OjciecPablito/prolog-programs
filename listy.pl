/*
Operacje zaawansowane na listach

zakładając numeryczne elementy listy, wstaw dany element
do list uporządkowanej rosnąco tak aby lista wynikowa 
była uporządkowana rosnąco

[1, 4, 10, 50, 80, 100, 200]
wstaw : 20
[1, 4, 10, 20, 50, 80, 100, 200]
*/

wstaw(X, [], [X]).
wstaw(X, [G|O], [X,G|O]):- X =< G.
wstaw(X, [G|O], [G|Reszta]):- X > G, wstaw(X, O, Reszta).