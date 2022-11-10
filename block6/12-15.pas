{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_15(input, output); 

function digits: integer;
var
    c: char;
begin
    read(c);
    if c = '.' then
        digits := 0
    else begin
        if (c >= '0') and (c <= '9')  then
            digits := digits + 1
        else
            digits := digits;
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_15');
    writeln;
    writeln('Please, set a sequence that ends with a ".": ');
    writeln('The amount of digits in setted sequence = ', digits);
    writeln;
end.