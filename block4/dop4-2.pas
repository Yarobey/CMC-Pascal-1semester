{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task10_17g(input, output); 
const
    n = 50;
    k = 8;
type
    strings = array[1..n] of packed array [1..k] of char;
var
    t: strings;
    a: packed array [1..26] of char;
    c, x: char;
    i, j, l, z, p: integer;
    ok: boolean;

begin
    writeln;
    writeln('Gikalo Egor 110 Task10_17g');
    writeln;
    writeln('Please, enter 50 words that have " " between them and "." at the end: ');
    z := 1;
    for x := 'a' to 'z' do begin
        a[z] := x;
        z := z + 1;
    end;
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
    for i := 1 to n do
        writeln(t[i], '/');
    writeln;
    writeln('These are all words that are not same with the last one and that are parts of alphabet:');
    for i := 1 to (n-1) do begin
        ok := true;
        if t[n] <> t[i] then begin
            p := 1;
            while (t[i,p] <> ' ') and (p <> k) do begin
                if t[i,p] <> a[p] then
                    ok := false;
                p := p + 1;
            end;
            if ok then
                writeln(t[i]);
        end;
    end;
    writeln;
end.