% 1. PREDICATE TO SUM NUMBERS IN A LIST EXCLUDING NESTED
% Base Case for empty list
sum-up-numbers-simple([], 0).
% Recursive Case for when list is not empty
sum-up-numbers-simple([First|Rest], Sum) :-
number(First),
sum-up-numbers-simple(Rest, Sum1),
Sum is First + Sum1.
% Recursive Case for when list is not empty and encounters non-number
sum-up-numbers-simple([First|Rest], Sum1) :-
\+(number(First)),
sum-up-numbers-simple(Rest, Sum1).

% 2. PREDICATE TO SUM NUMBERS IN A LIST INCLUDING NESTED
% Base Case list is not empty.
sum-up-numbers-general([], 0).
% Recursive case for when list is not empty, and the first element is a number
sum-up-numbers-general([First|Rest], Sum) :-
number(First),
sum-up-numbers-general(Rest, Sum1),
Sum is First + Sum1.
% Recursive Case for if the current element is not a number, but it is a list
sum-up-numbers-general([FirstElem|Rest],Sum) :-
    is_list(FirstElem),
    is_list(Rest),
    sum-up-numbers-general(FirstElem, FirstResult).    
% Recursive case if the current element is not a number, sum rest of list    
sum-up-numbers-general([First|Rest],Sum) :-
    not(number(First)),
    sum-up-numbers-general(Rest, Sum).

% 3. PREDICATE TO FIND THE MIN IN L1 BIGGER THAN THE MIN IN L2

min-above-min(L1, L2, N) :-
%Find the min in L2 with findMin 
findMin(L2, Min2),
include(findLarger(Min2), L1, MinL1),
%Find the min in L1 larger than the min in L2
findMin(MinL1, N).
%Compare which values are larger than the other
findLarger(Val, N) :- 
N > Val.
% Find the minimum of a list
% Base Case if there is only one value in the list, it is the minimum
findMin([First], First).
% Recursive Case where the head is the minimum of the list
findMin([First|Rest], First) :-
findMin(Rest, Min1), 
First < Min1.
% Recursive Case where the calculated minimum is the minimum of the list
findMin([First|Rest], Min1) :-
findMin(Rest, Min1), 
First >= Min1.

% 4. PREDICATE TO FIND COMMON ELEMENTS IN DIFFERENT LISTS
% Base Case where all lists are empty
common-unique-elements([],[],[]).
common-unique-elements([], [a,b,c,d,e], []).
common-unique-elements([a,b,c,d,e], [], []).
common-unique-elements([a], [a], [a]).
common-unique-elements([[[a]]], [a], [a]).
common-unique-elements([a,b], [b,a], [a,b]).
common-unique-elements([a,b], [b,c,a], [a,b]).
common-unique-elements([a,c,b], [a,b], [a,b]).
common-unique-elements([a,9,b,8,c,13,d,6,e,20], [2,e,3,d,4,c,5,b,6,a,7], [a,b,c,d,6,e] ).
common-unique-elements([a,9,[b,8,c],[13,[[d],6],e,20]], [2,e,[3,d,4],[c,[[5],[b],[[6]]],a],7], [a,b,c,d,6,e]).

