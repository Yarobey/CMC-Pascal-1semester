{$mode TP}
{$R+,G+,X-}
{$codepage UTF-8}
program task4_var_1(input, output); 
const
    n = 5;
    m = 4;
type
    matrix = array[1..n, 1..m] of real;
var
    x: matrix;
    Max: real;
   
{процедура InputMatrix(a) для ввода элементов матрицы a типа matrix}
{здесь расположить её описание}
procedure InputMatrix(var a: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do
            read(a[i,j]);
end;
{процедура MaxMin(a, max), требуемая в условии} 
{здесь расположить её описание}
procedure MaxMin(x: matrix; var max: real);
var
    i, j: integer;
    ma: real;
begin
    max := -Maxint;
    for i := 1 to n do begin
        ma := x[i,1];
        
        for j := 2 to m do
            if x[i,j] < ma then
                ma := x[i,j];
                
        if max < ma then
            max := ma
    end;
end;
begin
{здесь ничего не менять, оставить раздел операторов в таком виде:}
    writeln('task4_var_1');
    InputMatrix(x);
    MaxMin(x, Max);
    writeln(Max: 15: 6)
end.
{ ТЕСТЫ, на которых надо сдавать программу:

1) 

80   23   65    34
59   35   45    66
78   65   66    43
55   88   45    89
2    5    54    18

ответ 45.000000

2)

80E5             -123E-5                65.1        34.9
59              -35.1E-6                  45          66
78                    65                  66     0.43589
55                    88          45.1234E-1          89
1234567.89    9876543.43          23456789.1     712.6E6

ответ: 1234567.890000 

}













