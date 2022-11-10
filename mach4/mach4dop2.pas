{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Taskmash4dop2(input, output); 
const
    n = 5;
type 
    matrix = array [1..n, 1..n] of integer;
var
    m,k,y,z,l,q: integer;
    A: matrix;

procedure FillMatrix(m,k,i,j: integer; var A:matrix);
begin
    if (i = j) and (j <= n) then begin
        a[i,j] := m;
        FillMatrix(m, k, i, (j+1), a);
    end
    else if (i <= n) and (j <= n) then begin
        a[i,j] := m-1;
        a[j,i] := m-1;
        FillMatrix(m-1, k, i, (j+1), a);
    end;
end;

begin
    writeln;
    writeln('Gikalo Egor 110 TaskMash4dop2');
    writeln;
    write('Please, set "m" and "k": ');
    read(m,k);
    writeln;
    for l := 1 to n do
        FillMatrix(m+k*(l-1), k, l, l, a);
    for y := 1 to n do begin
        for z := 1 to n do
            write(a[y,z]:3);
        writeln;
    end;
    writeln;
end.