{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program TaskPrimeNumber(input, output); 

var
    n: integer;

function IsPrimeNumber(k: integer): boolean;

function divs(counter: integer): integer;
begin
    if sqr(counter) <= k then
        divs := ord(k mod counter = 0) + divs(counter + 1)
    else
        divs := 0;
end;

begin
    IsPrimeNumber := (divs(2) = 0);
end;


begin
    writeln;
    writeln('Gikalo Egor 110 TaskPrimeNumber');
    writeln;
    write('Please, set a number: ');
    read(n);
    writeln;
    writeln('The setted number is prime: ', IsPrimeNumber(n));
    writeln;
end.