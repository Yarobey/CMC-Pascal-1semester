{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop1_5(input, output);

var
    n, n1, n2, b, k: integer;
    flag: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_5');
    writeln;
    write('Please, set "n": ');
    read(n);
    writeln;
    flag := true;
    b := 1;
    while (n > 9) and flag do begin
        n2 := n mod 10;
        n1 := n;
        b := 1;
        while n1 > 9 do begin
            n1 := n1 div 10;
            b := b * 10;
        end;
        if n1 <> n2 then
            flag := false;
        if (n mod b) < (b div 10) then begin
            n := n mod b;
            n := n div 10;
            if (n mod 10) <> 0 then
                flag := false;
            n := n div 10;
        end
        else begin
            n := n mod b;
            n := n div 10;
        end;
    end;
    writeln('This number is palindrome: ', flag);
    writeln;
end.




