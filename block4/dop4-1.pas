{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task10_17j(input, output);

const
    n = 50;
    k = 8;

type
    strings = array[1..n] of packed array [1..k] of char;
var
    t: strings;
    i, j, l: integer;
    c: char;
    ok: boolean;

begin
    writeln;
    writeln('Gikalo Egor 110 Task10_17j');
    writeln;
    writeln('Please, enter 50 words that have " " between them and "." at the end: ');
    i := 1;
    repeat
        read(c);
        j := 1;
        if c = ' ' then
            while c = ' ' do
                read(c);
        if c <> ' ' then begin
            repeat
                t[i,j] := c;
                read(c);
                if ((c = '.') or (c = ' ')) and (j <> k) then
                    for l := k downto (j+1) do
                        t[i,l] := ' ';
                j := j + 1;
            until (c = '.') or (c = ' ');
        end;
        i := i + 1;
    until (c = '.');
    {for i := 1 to n do
        writeln(t[i], '/');}
    writeln;
    writeln('These are all words that are not same with the last one and dont have any identical letters in them:');
    for i := 1 to (n-1) do begin
        ok := true;
        if t[n] <> t[i] then begin
            for j := 1 to (k-1) do
                for l := j + 1 to k do
                    if (t[i,l] >= 'a') and (t[i,l] <= 'z') then
                        if t[i,j] = t[i,l] then
                            ok := false; 
            if ok then
                writeln(t[i]);
        end;
    end;
    writeln;
end.