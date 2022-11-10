{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task3Block7(F, output);

var
    F: text;

procedure LongestString(var F: text);
var
    s, maxs, max, counter: integer;
    c: char;
begin
    reset(F);
    max := 1;
    s := 1;
    while not eof(F) do begin
        counter := 0;
        while not eoln(F) do begin
            read(F,c);{а разве нельзя просто написать read(F)? у меня не работало,пока я не вставил c}
            counter := counter + 1;
        end;
        if max < counter then begin
            max := counter;
            maxs := s;
        end;
        readln(f);
        s := s + 1;
    end;
    reset(F);
    while maxs <> 1 do begin
        readln(F);
        maxs := maxs - 1;
    end;
    while not eoln(F) do begin
        read(F, c);
        write(c);
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task3Block7');
    writeln;
    assign(F, 't3.txt');
    writeln('Longest sentence in this file: ');
    LongestString(F);
    close(F);
    writeln;
end.