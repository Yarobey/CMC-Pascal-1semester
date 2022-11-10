{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_41g(input, output);

const
    n = 10;
var
    x: array[1..n] of real;
    i, j, k, z, counter, g, t, a, b, c: integer;
    x1: real;
    flag: boolean;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_41g');
    writeln;
    writeln('Please, set an array');
    k := 1;
    i := 1;
    a := 1;
    counter := 1;
    flag := false;
    for j := 1 to n do
        read(x[j]);
    while (x[i] <= x[i+1]) and (i <= n) do begin{проверяем сколько упорядочено при вхождении}
            k := k + 1;
            i := i + 1;
    end;
    while k <= 9 do begin
        a := 1;
        b := k;
        flag := false;
        x1 := x[k+1];
        repeat {метод бинарного поиска}
            c := (a + b) div 2;
            if x1 < x[c] then
                b := c - 1
            else if x1 > x[c] then
                a := c + 1
            else begin
                a := c;
                flag := true;
            end;
        until flag or (a > b);
        for g := k downto a do{сдвигаем на одну позицию вправо числа большие k+1-ого}
            x[g+1] := x[g];
        x[a] := x1;
        k := k + 1;
    end;
    writeln;
    writeln;
    writeln('This array is sorted in non-decreasing order:');
    for t := 1 to n do
        write(x[t]:2:1, ' ');
writeln;
writeln;
end.
