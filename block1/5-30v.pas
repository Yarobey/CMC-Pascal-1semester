{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_30v(input, output);

var
    n, n1, n2, dif, counter: integer;
    p: boolean;
    
begin
    counter := 3; {3, так как первые n1,n2 и n1 := n2 не входят в сумму}
    p := true;
    writeln;
    writeln('Gikalo Egor 110 Task5_30v');
    writeln;
    writeln('Please, set n');
    read(n);
    writeln;
    writeln('Please, set the sequence');
    read(n1, n2);
    dif := n2 - n1;
    while p and (dif = n2 - n1) and (counter <= n) do begin
        n1 := n2;
        read(n2);
        if dif <> n2 - n1 then
            p := false;
        counter := counter + 1;
        end;
    writeln;
    writeln('Is this an Arithmetic progression?');
    if p then
        writeln('Yes')
    else
        writeln('No');
    writeln;
end.


