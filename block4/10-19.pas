{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task10_19(input, output); 
const
    n = 60;
var
    a1, a2: packed array [1..26] of char;
    c: char;
    i, j: integer;
    ok: boolean;
    text, new:  packed array [1..n] of char;

begin
    writeln;
    writeln('Gikalo Egor 110 Task10_19');
    writeln;
    writeln('Please, write a text that has 60 symbols in it: ');
    a1 := 'abcdefghijklmnopqrstuvwxyz';
    a2 := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for i := 1 to n do begin
        read(c);
        text[i] := c;
    end;
    writeln;
    writeln('This is the written text in which each letter is underlined');
    writeln(text);
    for i := 1 to n do begin
        j := 0;
        repeat
            j := j + 1;
            ok := (a1[j] = text[i]) or (a2[j] = text[i]) ;
        until ok or (j = 26);
        if ok then
            new[i] := '-'
        else
            new[i] := ' ';
    end;
    writeln(new);
    writeln;
end.