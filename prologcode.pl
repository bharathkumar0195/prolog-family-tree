% -------- FACTS --------

% Gender
male(john).
male(paul).
male(mike).
male(tom).
male(david).

female(mary).
female(linda).
female(susan).
female(anna).
female(kate).

% Parent relationships
parent(john, paul).
parent(mary, paul).

parent(john, linda).
parent(mary, linda).

parent(paul, mike).
parent(susan, mike).

parent(paul, anna).
parent(susan, anna).

parent(linda, tom).
parent(david, tom).

parent(linda, kate).
parent(david, kate).


% -------- RULES --------

% Child
child(X, Y) :- parent(Y, X).

% Grandparent
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Cousin
cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B).

% Descendant (Recursive)
descendant(X, Y) :-
    parent(Y, X).

descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).