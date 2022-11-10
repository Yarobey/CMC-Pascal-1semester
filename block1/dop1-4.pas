program TaskDop1_4(input, output);

var
    n, a, b: integer;
    flag: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop1_4');
    writeln;
    write('Please, set "n": ');
    read(n);
    writeln;
    flag := false;
    b := 1;
    a := 2;
    while (sqr(b) < n) and not flag do begin
        while (sqr(a) < n) and not flag do begin
            if n = sqr(a) + sqr(b) then begin
                writeln(a,' ',b);
                flag := true;
            end;
            a := a + 1;
        end;
        b := b + 1;
    end;
    if not flag then
        writeln('There is no such pair of "a" and "b" that (a*a + b*b = n)');
    writeln;
end.