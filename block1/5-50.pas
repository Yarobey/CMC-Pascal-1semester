{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_50(input, output);

var
    x, a, b, summ, counter: integer; {n = counter}
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task5_50');
    writeln;
    writeln('Please, set a sequence that ends with "x < 0"');
    read(x);
    a := x;
    b := 0;
    counter := 1;
    while x > 0 do begin
        read(x);
        if x > 0 then begin
            a := a + x;
            counter := counter + 1;
            b := b + ((counter - 1) * x);
        end;
    end;
    summ := (counter * a) - b;
    writeln;
    writeln('The summ = ', summ);
    writeln;
end.

    

