{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program task3_var_1(input, output); 
const
   n = 5;
   m = 4;
type
   matrix = array[1..n, 1..m] of integer;
var
   x: matrix;
procedure InputMatrix(var a: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do
            read(a[i,j]);
end;
function IsMatrixZero(var a: matrix): boolean;
var
    i, j: integer;
    flag: boolean;
begin
    flag := true;
    i := 1;
    while flag and (i <= n) do begin
        j := 1;
        while flag and (j <= m ) do begin
            if a[i,j] <> 0 then
                flag := false;
            j := j + 1;
        end;
        i := i + 1;
    end;
    IsMatrixZero := flag;
end;

begin
    writeln('task3_var_1');
    InputMatrix(x);
    write(IsMatrixZero(x));
 
    writeln
end.    
{ ТЕСТЫ, на которых надо сдавать задачу:

1) false

0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 1
          
2) false


3) true

0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0
0 0 0 0    

}    
    





