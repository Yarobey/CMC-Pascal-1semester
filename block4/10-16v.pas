{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task10_16v(input, output); 
const
    n = 30;
    k = 5;
type
    word = packed array [1..k] of char;
    table = array[1..n] of word;

var
    t: table;
    c: char;
    i, j: integer;

begin
    writeln;
    writeln('Gikalo Egor 110 Task10_16v');
    writeln;
    writeln('Please, write a text that has "," between words and "." at the end: ');
    i := 0;
    repeat
        i := i + 1;
        read(c);
        j := 0;
        repeat
            j := j + 1;
            t[i][j] := c;
            read(c);
        until (c = ',') or (c = '.');
        for j := j + 1 to k do
            t[i][j] := ' ';
    until c ='.';
    write(t[1], ' ');
    for i := 2 to n do begin
        j := i;
        repeat
            j := j - 1;
        until (t[i] = t[j]) or (j = 1);
        if t[i] <> t[j] then
            write(t[i], ' ');
    end;
    write('.');
    writeln;
end.

