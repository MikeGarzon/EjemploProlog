progenitorde('Nancy','Maicol').
progenitorde('German','Sebastian').
progenitorde('German','Esteban').
progenitorde('Nancy','Santiago').
progenitorde('Alba','Sebastian').
progenitorde('Jhon','Santiago').
progenitorde('German','Juan').
progenitorde('Orlando','Yisset').
progenitorde('Nelson','Andres').
progenitorde('Maicol','Karen').
progenitorde('Karen','Ramon').
progenitorde('Santiago','Stiven').
progenitorde('Pepe','Pablo').

hijode(A,B) :- progenitorde(B,A).
abuelode(A,B) :- progenitorde(A,C), progenitorde(C,B).
bisabuelo(A,B) :- progenitorde(A,C), abuelode(C,B).
hermanode(A,B) :- progenitorde(C,A), progenitorde(C,B), A \== B.
tiode(A,B) :- progenitorde(C,B), hermanode(A,C).
primo(X,Y):-progenitorde(Z,X),progenitorde(W,Y),hermanode(Z,W).
sobrino(A,B):- tiode(B,A).
nieto(X,Y):-abuelode(Y,X).
bisnieto(X,Y) :- bisabuelo(Y,X).

familiarde(A,B) :- progenitorde(A,B).
familiarde(A,B) :- hijode(A,B).
familiarde(A,B) :- abuelode(A,B).
familiarde(A,B) :- hermanode(A,B).
familiarde(A,B) :- tiode(A,B).
familiarde(A,B) :- primo(A,B).
familiarde(A,B) :- sobrino(A,B).
familiarde(A,B) :- nieto(A,B).
familiarde(A,B) :- bisnieto(A,B).

familiaresde(X,L):- findall(B,familiarde(X,B),L).


casado(A,B) :- progenitorde(A,C) , progenitorde(B,C), A \== B.
esfeliz(X) :- casado(X,_). 
