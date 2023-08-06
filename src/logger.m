:- module logger.

:- interface.

:- import_module string.
:- import_module list.
:- import_module io.

:- pred logMsg(string::in, io::di, io::uo) is det.

:- implementation.

:- func msg(string) = string.

msg(String) = append(String, "\n").

logMsg(InString, !IO) :-
    io.format("%s\n", [s(InString)], !IO).