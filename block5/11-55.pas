{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_55(input, output); 
var
    n, i: integer;

function IsPrime(x:integer): boolean;
var
    i: integer;
    flag: boolean;
begin
    flag := true;
    i := 2;
    while flag and (sqr(i) <= x) do begin
        if (x mod i) = 0 then
            flag := false;
        i := i + 1;
    end;
    IsPrime := flag;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_55');
    writeln;
    write('Please, set "n": ');
    read(n);
    writeln;
    writeln('These are all twin prime numbers in range of [2,n]:');
    {prew := -1'
    for i := 2 to n do begin
        if IsPrime(i) then begin
            if i - prew = 2 then
                writeln(prew:6, i:6);
            prew := i;
        end;
    end;}
    i := 2;
    while i <= (n - 2) do begin
        if IsPrime(i) then
            if IsPrime(i+2) then begin
                writeln(i, ' ', (i+2));
                i := i + 1;
            end;
        i := i + 1;
    end;
    writeln;
end.
