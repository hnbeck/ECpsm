:- module readOcean.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module reader.

main(!IO) :-
    readerMain(!IO).
 