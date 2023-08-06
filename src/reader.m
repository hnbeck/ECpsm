:- module reader.

:- interface.

:- import_module io.

:- pred readerMain(io::di, io::uo) is det.

:- implementation.

:- import_module dir.
:- import_module string.

:- pred streamOpen( io.res(io.text_input_stream)::in, string::out, io::di, io::uo) is det.

readerMain(!IO) :-
    write_string("Hello!\n", !IO),
    current_directory(Result, !IO),
    (if 
        Result = ok(String)
    then
        Msg = append(String, "\n"),
        write_string(Msg, !IO)
    else
        write_string("Something wrong\n", !IO)
    ),
    open_input("C:/Dev/Workspace/MercuryTest/TCL/testfile.txt", Result2, !IO),
    streamOpen(Result2, Content, !IO),
    write_string(Content, !IO).
    

% streamOpen(Result, ContentOut, !IO) :- 
%     (if
%         Result = ok(Stream)
%     then
%         write_string("Ok!\n", !IO),
%         read_file_as_string(Stream, Content, !IO),
%         (if 
%             Content = ok(ContentOut)
%         then
%             write_string(ContentOut, !IO)
%         else
%             true
%         )
%     else
%         write_string("Fehler!\n", !IO)
%     ).

%%%% different style
streamOpen(ok(Stream), FileContent, !IO) :- 

    read_file_as_string(Stream, Content, !IO),
    (if 
        Content = ok(ContentString)
    then
        FileContent = ContentString
    else
        FileContent = ""
    ),
    close_input(Stream, !IO).

streamOpen(error(_), "", !IO) :- write_string("Fail", !IO).

