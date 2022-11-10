{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program Task9_27(input, output); 
const
    n = 5;

type
    matrix = array[1..n, 1..n] of integer;
var
    a: matrix;
    i, j: integer;
    flag: boolean;
begin
    writeln;
    writeln('Gikalo Egor 110 Task9_27');
    writeln;
    writeln('Please, set a matrix:');
    for i := 1 to n do
        for j := 1 to n do
            read(a[i,j]);
    flag := true;
    i := 1;
    while (i <= n-1) and flag do begin
        j := i + 1;
        while (j <= n) and flag do begin
            if a[i,j] <> a[j,i] then
                flag := false;
            j := j + 1;
        end;
        i := i + 1;
    end;
    writeln;
    write('This matrix is symmetric about the main diagonal: ', flag);
    writeln;
end.
{test1 
1 1 1 1 1
1 2 3 4 5
1 3 6 10 15
1 4 10 20 35
1 5 15 35 70}
{test2
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0}
{test3
1 0 0 0 0
0 1 0 0 0
0 0 1 0 0
0 0 0 1 0
0 0 0 0 1}             
            
