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
