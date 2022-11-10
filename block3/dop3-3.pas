{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}

program TaskDop3_3(input, output);

const n = 15;

var
    a: array[1..n] of integer;
    x, y, r, i, j, z: integer;
    
begin
    writeln;
    writeln('Gikalo Egor 110 TaskDop3_3');
    writeln;
    writeln('Please, set 15 numbers');
    for i := 1 to n do begin
        read(y);
        a[i] := y;
    end;
    write('Please, set "x": ');
    read(x);
    j := n;
    i := 0;
    repeat
        i := i + 1;
        if a[i] >= x then begin
            while (a[j] >= x) and (j > i) do
                j := j - 1;
            r := a[i];
            a[i] := a[j];
            a[j] := r;
            j := j - 1;
        end;
        {for z := 1 to n do
            write(a[z], ' ');
        writeln;
        writeln('i = ', i);
        writeln('j = ', j);}
    until (i >= j);
    if i = j then
        i := i + 1;
    j := n;
    repeat
        if a[i] <> x then begin
            while (a[j] <> x) and (j > i) do
                j := j - 1;
            r := a[i];
            a[i] := a[j];
            a[j] := r;
            j := j - 1;
        end;
        i := i + 1;
    until (i >= j);
    writeln;
    writeln('Your sequence was divided into three parts, 1) < "x"; 2) = "x"; 3) > "x": ');
    for i := 1 to n do
        write(a[i], ' ');
    writeln;
end.
{5 4 8 7 9 1 2 10 12 3 6 11 0 14 13
 8}
 {15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
 6}
 {1 2 3 4 5 2 3 4 5 6 3 4 5 6 7
 4}