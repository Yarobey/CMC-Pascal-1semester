{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}                   ///// ЗАДАЧА 1 (20 очков) /////
program task1_var_2(input, output); ///// Вариант 2           /////
// -------------------------------------------------------------------
// Пусть натуральное число N задано константой.  
// Ввести с клавиатуры целые числа К и Р.  
// Сформировать целочисленную матрицу размера N x N вида:
{
    K       K+1       K+2       K+3      …
    K-P     K-P+1     K-P+2     K-P+3    …
    K-2P    K-2P+1    K-2P+2    K-2P+3   …
    K-3P    K-3P+1    K-3P+2    K-3P+3   …
     …        …          …         …     …
}
// Вывести полученную матрицу на экран 
//(столбцы чисел должны быть выровнены по правому краю).   
// Проверить, есть ли в матрице хотя бы один СТОЛБЕЦ, сумма элементов в
// котором ПОЛОЖИТЕЛЬНА. Вывести результат проверки (true или false). 
// Замечание: приём программы будет производиться при N=4
// -------------------------------------------------------------------
// ТРЕБОВАНИЯ.  
// Предусмотреть в программе:
// 1) процедуру Form(M,K,P), которая по заданным числам K и P 
// формирует матрицу М заданного вида.
// 2) процедуру Print(M), которая выводит на экран матрицу М.
// 3) булевскую функцию Test(M), которая проверяет матрицу М на наличие
// заданного (выше) свойства.
// ВНИМАНИЕ: совмещать этапы НЕЛЬЗЯ (т.е. следует отдельно сформировать
// матрицу, после этого  вывести её на экран, и только затем приступить
// к проверке матрицы)
// ТЕСТЫ, НА КОТОРЫХ СДАВАТЬ ЗАДАЧУ, размещены в конце этой программы.
// --------------------------------------------------------------------

const 
    N = 4;
type
    matrix = array[1..N, 1..N] of integer;
var
    M: matrix;
    K, P: integer;
    
{процедура Form(M,K,P) для формирования элементов матрицы M типа matrix}
{здесь расположить её описание}
procedure Form(var x:matrix; K,P:integer);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to n do
            x[i,j] := K - (P * (i-1)) + (j-1);
end;


{процедура Print(M) для вывода на экран матрицы M типа matrix}
{здесь расположить её описание}
procedure Print(var t: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do begin
        for j := 1 to n do
            write(t[i,j]:4);
        writeln;
    end;
end;

{булевская функция Test(M) для проверки заданного свойства у матрицы M}
{здесь расположить её описание}
function Test(var y: matrix): boolean;
var
    i, j, summ: integer;
    flag: boolean;
begin
    summ := 0;
    flag := false;
    for j := 1 to n do begin
        if not flag then begin
            summ := 0;
            for i := 1 to n do
                summ := summ + y[i,j];
        end;
        if summ > 0 then 
            flag := true;
    end;
    Test := flag;
end;
             
begin
    {Здесь ничего не менять и ничего не добавлять!}
    writeln('============');
    writeln('Task_1_var_2');
    writeln('============');
    writeln;

    write('K  and  P: ');
    read(K, P);
     
    Form(M, K, P);
    writeln;
    writeln('Matrix:');
    writeln;
    Print(M);
    writeln;
    
    writeln('Answer: ', Test(M));
end.

{ ТЕСТЫ, на которых надо сдавать эту задачу:

Test 1:
-------
K and P:  5   4
 
matrix:
    5    6    7     8
    1    2    3     4
   -3   -2   -1     0
   -7   -6   -5    -4
   
answer: TRUE

полезно для отладки:
FALSE sum = -4
FALSE sum = 0
TRUE  sum = 4

Test 2:
-------
K and P:  0   0

matrix:
    0    1    2    3
    0    1    2    3
    0    1    2    3
    0    1    2    3

answer: TRUE

полезно для отладки:
FALSE sum = 0
TRUE  sum = 4

Test 3:
-------
K and P:  2   3

matrix:
    2     3     4      5
   -1     0     1      2
   -4    -3    -2     -1
   -7    -6    -5     -4

answer: TRUE

полезно для отладки:
FALSE sum = -10
FALSE sum = -6
FALSE sum = -2
TRUE  sum = 2


Test 4:
-------
K and P:  9   8

matrix:
    9    10    11    12
    1     2     3     4
   -7    -6    -5    -4
  -15   -14   -13   -12

answer: FALSE

полезно для отладки:
FALSE sum = -12
FALSE sum = -8
FALSE sum = -4
FALSE sum = 0

Test 5:
-------
K and P:  -5   -1

matrix:
   -5    -4    -3    -2
   -4    -3    -2    -1
   -3    -2    -1     0
   -2    -1     0     1

answer: FALSE

полезно для отладки:
FALSE sum = -14
FALSE sum = -10
FALSE sum = -6
FALSE sum = -2

Test 6:
-------
K and P:  -1   0

matrix:
   -1     0     1     2
   -1     0     1     2
   -1     0     1     2
   -1     0     1     2

answer: TRUE

полезно для отладки:
FALSE sum = -4
FALSE sum = 0
TRUE  sum = 4

}    
        





