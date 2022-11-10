{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_7d(input, output);

var
    n, max, amount: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task5_7d');
    writeln;
    writeln('Please, set a sequence that ends with a "0"');
    read(n);
    max := 0;
    amount := 1;
    while n <> 0 do begin
        if max = n then
            amount := amount + 1;
        if max < n then begin
            max := n;
            amount := 1;
        end;
        read(n);
    end;        
    writeln;
    write('The amount of max elements = ', amount);
    writeln;
end.
