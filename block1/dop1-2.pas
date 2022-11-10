{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop1_2(input, output);

var
    n, k, m, ans, b:integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_2');
    writeln;
    writeln('Please, set "n": ');
    read(n);
    b := 1;
    ans := 0;
    while n > 0 do begin
        k := n mod 10;
        if k <> 3 then begin
            ans := ans + k * b;
            if b <= 1000 then
                b := b * 10;
        end;
        n := n div 10;
    end;
    writeln(ans);
    writeln;
end.

