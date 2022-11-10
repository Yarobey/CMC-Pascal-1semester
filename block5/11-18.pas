{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_18(input, output); 
type
    integer = longint;
var
    a, b, c: integer;

function subtraction(a,b:integer): integer;
var 
    a1, b1:integer;

begin
    a1 := abs(a);
    b1 := abs(b);
    while a1 <> b1 do begin
        if a1 > b1 then
            a1 := a1 - b1
        else
            b1 := b1 - a1;
    end;
    subtraction := a1;
end;

function division(a,b:integer): integer;
var 
    a1, b1:integer;

begin
    a1 := abs(a);
    b1 := abs(b);
    while (a1 <> 0) and (b1 <> 0) do begin
        if a1 > b1 then
            a1 := a1 mod b1
        else
            b1 := b1 mod a1;
    end;
    division := a1 + b1;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_18');
    writeln;
    write('Please, set "a","b","c": ');
    read(a,b,c);
    writeln;
    writeln('The greatest common divisor of these three numbers:');
    writeln;
    writeln('Found by subtraction: ', subtraction(a,{subtraction(b,c)}b)); {для трех чисел то, что в скобках}
    writeln('Found by division: ', division(a,{division(b,c)}b));{для трех чисел то, что в скобках}
    writeln;
end.
