{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_46(input, output);

var
    n, n1, n2, difn, counter: integer;

begin
    counter := 2; {2, так как первые n1 и n2 не входят сумму}
    difn := 1;
    writeln;
    writeln('Gikalo Egor 110 Task5_46');
    writeln;
    writeln('Please, set n');
    read(n);
    writeln;
    writeln('Please, set the sequence');
    read(n1);
    while counter <= n do begin
        read(n2);
        if n1 <> n2 then
            difn := difn + 1;
        n1 := n2;
        counter := counter + 1;
    end;
    writeln;
    writeln('The amount of different numbers = ', difn);
    writeln;
end.

