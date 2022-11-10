{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task9_14bv(input, output); 
const
    n = 10;

type
    matrix = array[1..n, 1..n] of integer;
var
    x,y: matrix;
    i, j, k, z: integer;
begin
    writeln;
    writeln('Gikalo Egor 110 Task9_14bv');
    writeln;
    writeln('This is the answer for b');
    k := 1;
    for i := 1 to n do
        for j := 1 to n do begin
            x[i,j] := k;
            k := k + 1;
        end;
    for i := 1 to n do begin
        for j := 1 to n do
            write(x[i,j]:3, ' ');
        writeln;
    end;
    writeln;
    writeln('This is the answer for v');
    z := 1; 
    {не понимаю, почему матрица заполняется нулями даже без}   
    {for i := 1 to n do
        for j := 1 to n do
            y[i,j] := 0;}
    for i := 1 to n do begin
        for j := i to n do begin
            y[i,j] := z;
            z := z + 1;
        end;
        z := 1;
    end;
    for i := 1 to n do begin
        for j := 1 to n do
            write(y[i,j]:3, ' ');
        writeln;
    end;
    writeln;
end.
            
            
