{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskDop5_1(input, output);
const
    n = 200;

var
    x, st: integer;

procedure Exponentiation(x, st: integer);
var
    i, j, k, counter: integer;
    v: array[1..n] of 0..9;
begin
    j := n;
    for i := 1 to n do
        v[i] := 0;
    v[j] := 1;
    for i := 1 to st do begin
        counter := 200;
        for k := 200 downto counter do begin 
            v[k-1] := (v[k] * x) div 10;
            v[k] := (v[k] * x) mod 10;
            if v[k-1] <> 0 then
                counter := counter - 1;;
        end;
    end;
    for i := 1 to n do 
        write(v[i], ' ');
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop5_1');
    writeln;
    writeln('Exponentiation of which number you want?: ');
    read(x);
    writeln('Which exponent you want to find?: ');
    read(st);
    Exponentiation(x,st);
    writeln;
end.
