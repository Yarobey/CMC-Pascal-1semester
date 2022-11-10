{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program dop3(input, output); 
const
    n = 5;

type
    matrix = array[1..n, 1..n] of integer;
    vector = array[1..n] of integer;
var
    x: matrix;
    i, j: integer;

function IsLatinSquare(var A:matrix): boolean;
var
    i, j, k: integer;
    str, stlb: vector;{создаем 2 массива, чтобы отслеживать вхождения чисел в строки и столбцы}
    flag: boolean;
begin
    flag := true;
    i := 1;
    while flag and (i < n) do begin
        for k := 1 to n do begin
            str[k] := 0;
            stlb[k] := 0;
        end;
        j := 1;
        while flag and (j <= n) do begin
            if (a[i,j] >= 1) and (a[i,j] <= n) then
                str[a[i,j]] := str[a[i,j]] + 1;
            if (a[j,i] >= 1) and (a[j,i] <= n) then 
                stlb[a[j,i]] := stlb[a[j,i]] + 1
            else
                flag := false;
            j := j + 1;
        end;
        for k := 1 to n do{если какое-то число встретилось больше одного раза, то false}
            if (str[k] <> 1) or (stlb[k] <> 1) then
                flag := false;
        i := i + 1;        
    end;
    IsLatinSquare := flag;
end;

begin
    writeln('Please set a "n x n" size matrix');
    writeln('n = ', n);
    for i := 1 to n do
        for j := 1 to n do
            read(x[i,j]);
    writeln(IsLatinSquare(x));
end.
