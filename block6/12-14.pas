{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task12_14(input, output); 

function max: integer;
var
    n, ans, n1: integer;
begin
    read(n);
    if n <> 0 then begin
        ans := max;
        if n > ans then
            n1 := n;
        if ans > n1 then
            n1 := ans;
    end
    else if n = 0 then
        max := n;
    max := n1;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task12_14');
    writeln;
    writeln('Please, set a sequence of positive numbers that ends with a "0": ');
    writeln('Max number in this sequence: ', max);
    writeln;
end.