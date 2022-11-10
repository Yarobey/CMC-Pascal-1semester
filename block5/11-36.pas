{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_36(input, output); 
const 
    n = 6;
type
    word = packed array[1..n] of char;
var
    A, B, S: word;
    flag: boolean;
    t: char;
    counter: integer;

procedure ReadWord(var a:word);
var
    i: integer;
    c: char;
begin
    i := 1;
    read(c);
    repeat
        a[i] := c;
        i := i + 1;
        read(c);
    until ((c = ',') or (c = '.')) or (i > n);
    while i <= n do begin
        a[i] := ' ';
        i := i + 1;
    end;
    t := c;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_36');
    writeln;
    writeln('Please, write a text that has "," between words and "." at the end:');
    ReadWord(a);
    flag := false;
    counter := 0;
    writeln;
    writeln('Words with matching "neighbors":');
    while t <> '.' do begin
        if (counter = 0) then begin
            ReadWord(b);
            counter := 1;
        end;
        if t <> '.' then begin
            ReadWord(s);
            if (a = b) and (b = s) then begin
                writeln(b);
                flag := true;
            end;
            a := b;
            b := s;
        end;
    end;
    if not flag then
        writeln('!none of them were found!');
    writeln;
end.
