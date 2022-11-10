{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_18(input, output); 

var
    a, b: integer;

function subtraction(a,b:integer): integer;
begin
    if a > b then
        subtraction := subtraction(a - b, b)
    else if b > a then
        subtraction := subtraction(a, b - a)
    else
        subtraction := a;
end;

function division(a,b:integer): integer;
begin
    if (a = 0) or (b = 0) then
        division := a + b
    else if a > b then
        division := division(a mod b, b)
    else if (b > a) or (b = a) then
        division := division(a, b mod a)
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_18');
    writeln;
    write('Please, set "a","b": ');
    read(a,b);
    writeln;
    writeln('The greatest common divisor of these two numbers:');
    writeln;
    writeln('Found by subtraction: ', subtraction(a, b));
    writeln('Found by division: ', division(a, b));
    writeln;
end.
