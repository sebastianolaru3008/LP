on_route(camin).

on_route(Place) :-
    move(Place, NextPlace),
    on_route(NextPlace).

move(cluj, camin).
move(gara, cluj).
move(acasa, gara).