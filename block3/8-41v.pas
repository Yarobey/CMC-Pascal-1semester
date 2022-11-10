{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program Task8_41v(input, output);

const
    n = 10;
var
    x: array[1..n] of real;
    i, j, k, z, counter, g, t: integer;
    x1: real;
    
begin
    writeln;
    writeln('Gikalo Egor 110 Task8_41v');
    writeln;
    writeln('Please, set an array');
    k := 1;
    i := 1;
    counter := 0;
    for j := 1 to n do
        read(x[j]);
    while (x[i] <= x[i+1]) and (i <= n) do begin{проверяем сколько упорядочено при вхождении}
            k := k + 1;
            i := i + 1;
    end;
    while k <= 9 do begin
        x1 := x[k+1];
        for z := k downto 1 do begin{проверяем сколько из упорядоченных больше k+1-ого}
            if x[k+1] < x[z] then
                counter := counter + 1;
        end;
        for g := k downto (k - counter + 1) do{сдвигаем на одну позицию вправо числа большие k+1-ого}
            x[g+1] := x[g];
        x[k - counter + 1] := x1;
        k := k + 1;
        counter := 0;
    end;
    writeln;
    writeln;
    writeln('This array is sorted in non-decreasing order:');
    for t := 1 to n do
        write(x[t]:2:1, ' ');
writeln;
writeln;
end.
    
