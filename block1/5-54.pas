{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task5_54(input, output);

var
    n, i, prime: integer;
    p: boolean;
    
begin
    p := true;
    i := 2;
    writeln('Gikalo Egor 110 Task5_54');
    writeln;
    writeln('Please, set n');
    writeln;
    read(n);
    writeln;
    writeln('These are all prime numbers in range of [2, n]:');
    for prime := 2 to n do begin
        while p and (sqr(i) <= prime) do begin
            if (prime mod i) = 0 then
                p := false 
            else
                i := i + 1;
            end;
        if p then
            writeln(prime);
        i := 2;
        p := true;
        
    end;
    writeln;
end.



