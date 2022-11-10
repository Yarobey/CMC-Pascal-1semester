{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop1_2(input, output);

var
    n, k, m, ans, new:integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_2');
    writeln;
    writeln('Please, set "n": ');
    read(n);
    new := 0;
    while n > 0 do begin
        k := n mod 10;
        if k <> 3 then
            new := new * 10 + k;
        n := n div 10;
    end;
    ans := n;
    while new > 0 do begin
        m := new mod 10;
        ans := ans * 10 + m;
        new := new div 10;
    end;
    writeln(ans);
    writeln;
end.