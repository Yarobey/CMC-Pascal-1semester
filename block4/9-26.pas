{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task9_26(input, output); 
const
    m = 3;

type
    matrix = array[1..m, 1..m] of real;
var
    a, b, c: matrix;
    i, j, n, k, z: integer;
begin
    writeln;
    writeln('Gikalo Egor 110 Task9_26');
    writeln;
    writeln('Please, set "n":');
    read(n);
    writeln;
    writeln('Please, set a matrix:');
    for i := 1 to m do
        for j := 1 to m do
            read(a[i,j]);
    if n = 1 then
        for i := 1 to m do begin
            for j := 1 to m do
                write(a[i,j]:6:2, ' ');
            writeln;
        end
    else begin
        b := a;
        for z := 2 to n do begin
            for i := 1 to m do
                for j := 1 to m do begin
                    c[i,j] := 0;
                    for k := 1 to m do
                        c[i,j] := c[i,j] + b[i,k] * a[k,j];
                end;
            b := c;
        end;
        writeln;
        writeln('This is the setted matrix raised to the power of "n": ');
        for i := 1 to m do begin
                for j := 1 to m do
                    write(b[i,j]:6:2, ' ');
                writeln;
        end;
    end;
    writeln;
end.
