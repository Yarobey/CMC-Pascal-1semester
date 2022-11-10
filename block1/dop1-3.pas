{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop1_3(input, output);

var
    n, ans, b, minx, new, k:integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_3');
    writeln;
    write('Please, set "n" >= 10: ');
    read(n);
    writeln;
    b := 1;
    ans := 0;
    new := n;
    minx := 9;
    while n > 0 do begin
        if (n mod 10) < minx then
            minx := n mod 10;
        n := n div 10;
    end;
    while new > 0 do begin
        k := new mod 10;
        if k <> minx then begin
            ans := ans + k * b;
            if b <= 1000 then
                b := b * 10;
        end;
        new := new div 10;
    end;
    writeln('The biggest number without one of its digits: ', ans);
    writeln;
end.