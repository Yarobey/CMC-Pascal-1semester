{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_41(input, output);

var
    n1, n2, counter: integer;

begin
    counter := 0;
    writeln;
    writeln('Gikalo Egor 110 Task5_41');
    writeln;
    writeln('Please, set a sequence that ends with a "0"');
    read(n1,n2);
    while n2 <> 0 do begin
        if (n1 > 0) and (n2 < 0)  then
            counter := counter + 1;
        if (n1 < 0) and (n2 > 0)  then
            counter := counter + 1;
        n1 := n2;
        read(n2);
    end;
    writeln;
    writeln('The amount of sign changes = ', counter);
    writeln;
end.
