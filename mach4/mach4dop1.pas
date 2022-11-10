{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Taskmash4dop1(input, output); 

var
    x: real;
    n: integer;

function Count6(X: real; n: integer): integer;
begin
    x := x - trunc(x);
    if n = 0 then
        Count6 := 0
    else
        Count6 := ord((trunc(x * 10) mod 10) = 6) + Count6(((x * 10) - trunc(x*10)),(n-1));
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskMash4dop1');
    writeln;
    write('Please, set "x" and "n": ');
    read(x);
    read(n);
    writeln;
    write('Number of "6" in "x" after "n" digits after decimal point = ', Count6(x,n));
    writeln;
end.