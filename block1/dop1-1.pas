{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop1_1(input, output);

var
    p, q, n, ans1, ans2, counter:integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_1');
    writeln;
    writeln('Please, set "P", "Q", "n": ');
    read(p,q,n);
    writeln;
    write('P / Q, with "n" decimal places: ');
    counter := 0;
    ans1 := p div q;
    ans2 := p mod q;
    write(ans1,'.');
    while counter < n do begin{проблемный случай, когда число делится нацело, при этом нужно выписать один знак после запятой}
        if p mod q = 0 then   {поэтому добавил этот if}
            while counter < n do begin
                write(0);
                counter := counter + 1;
            end
        else begin
            ans2 := ans2 * 10;
            write(ans2 div q);
            if (ans2 div q) = 0 then begin
                ans2 := ans2 * 10;
                write(ans2 div q);
                counter := counter + 1;
            end;
            ans2 := ans2 mod q;
            counter := counter + 1;
        end;
    end;
    writeln;
end.