{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task2Block7(F, F1, output);

var
    F, F1: text;

function EqualFiles(var F, F1: text): boolean;
var
    ok: boolean;
    c, c1: char;
begin
    reset(F);
    reset(F1);
    ok := true;
    while (not eof(F)) and (not eof(F1)) and ok do begin
        while not eoln(F) and not eoln(F1) and  ok do begin
            read(F, c);
            read(F1, c1);
            if (c1 <> c) then
                ok := false;
        end;
        if eoln(F) <> eoln(F1) then
            ok := false;
        readln(F);
        readln(F1);
    end;
    if eof(F) <> eof(F1) then
        ok := false;
    EqualFiles := ok;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task2Block7');
    writeln;
    assign(F, 't1.txt');
    assign(F1, 't2.txt');
    writeln('These files are equal: ', EqualFiles(F, F1));
    close(F);
    close(F1);
    writeln;
end.