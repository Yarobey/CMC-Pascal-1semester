{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task11_27(input, output); 
const 
    n = 3;
type
    matrix = array[1..n,1..n] of real;
var
    A, B: matrix;
    i, j: integer;

procedure ReadMatrix(var a:matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to n do
            read(a[i,j]);
end;

function MatrixTrace(var a:matrix): real;
var
    i: integer;
    tr: real;
begin
    tr := 0;
    for i := 1 to n do
        tr := tr + a[i,i];
    MatrixTrace := tr;
end;

procedure SquareOfMatrix(var a:matrix);
var
    i, j, s: integer;
    c: matrix;
begin
    for i := 1 to n do
        for j := 1 to n do begin
            c[i,j] := 0; 
            for s := 1 to n do
                c[i,j] := c[i,j] + a[i,s] * a[s,j];
        end;
    for i := 1 to n do
        for j := 1 to n do
            a[i,j] := c[i,j];
end;

begin
    writeln;
    writeln('Gikalo Egor 110 Task11_27');
    writeln;
    writeln('Please, set square matrix "A":'); 
    ReadMatrix(A);
    writeln;
    writeln('Please, set square matrix "B":'); 
    ReadMatrix(B);
    writeln('Square of matrix with the smallest trace:'); 
    if MatrixTrace(A) < MatrixTrace(B) then begin
        SquareOfMatrix(A);
        for i := 1 to n do begin
            for j := 1 to n do
                write(a[i,j]:5:1);
            writeln;
        end;
    end
    else begin
        SquareOfMatrix(B);
        for i := 1 to n do begin
            for j := 1 to n do
                write(b[i,j]:5:1);
            writeln;
        end;
    end;
    writeln;
end.
{0 0 0
0 0 0
0 0 0}
{1 1 1 
1 1 1
1 1 1 }
{2 2 2
2 2 2
2 2 2}
{3 3 3
3 3 3
3 3 3}


