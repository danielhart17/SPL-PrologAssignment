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
