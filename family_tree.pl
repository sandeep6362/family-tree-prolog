% =========================================
% FAMILY TREE PROGRAM IN PROLOG
% =========================================

% ----------- FACTS -----------

% Parent relationships
parent(john, mary).
parent(john, david).
parent(susan, mary).
parent(susan, david).

parent(mary, anna).
parent(mary, peter).
parent(linda, anna).
parent(linda, peter).

parent(david, lisa).
parent(david, james).
parent(karen, lisa).
parent(karen, james).

% Gender facts
male(john).
male(david).
male(peter).
male(james).

female(susan).
female(mary).
female(anna).
female(lisa).
female(linda).
female(karen).

% ----------- BASIC RELATIONSHIPS -----------

% Child relationship
child(X, Y) :-
    parent(Y, X).

% ----------- DERIVED RELATIONSHIPS -----------

% Grandparent rule
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling rule
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Brother rule
brother(X, Y) :-
    sibling(X, Y),
    male(X).

% Sister rule
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Cousin rule
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% ----------- RECURSIVE RELATIONSHIP -----------

% Descendant (direct)
descendant(X, Y) :-
    parent(Y, X).

% Descendant (recursive)
descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).

% ----------- ADDITIONAL RULES (OPTIONAL) -----------

% Grandchild
grandchild(X, Y) :-
    grandparent(Y, X).

% Ancestor (recursive)
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% ----------- SAMPLE QUERIES (FOR REFERENCE) -----------

% To run queries, load the file in SWI-Prolog and try:

% 1. Find children of john
% ?- parent(john, X).

% 2. Find siblings of mary
% ?- sibling(mary, X).

% 3. Find grandparents of anna
% ?- grandparent(X, anna).

% 4. Find cousins of anna
% ?- cousin(anna, X).

% 5. Check if anna is descendant of john
% ?- descendant(anna, john).

% 6. Find all descendants of john
% ?- descendant(X, john).

% 7. Find brothers of mary
% ?- brother(X, mary).

% 8. Find sisters of david
% ?- sister(X, david).

% =========================================
% END OF PROGRAM
% =========================================