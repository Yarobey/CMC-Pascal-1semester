{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//=====================================================================
// ЗАДАЧА 1 (вариант 2)  20 очков
//=====================================================================
// Описать булевскую функцию IsEqual(A), которая определяет, есть ли в 
// матрице A  хотя бы две одинаковых строки. Описать также процедуру 
// InputMatrix(A) для ввода целочисленной матрицы A размером nxm. 
// Применить InputMatrix(A) и  IsEqual(A) к конкретной матрице, заданной
// пользователем. 
// ТРЕБОВАНИЯ: 1) в процессе проверки матрицы не делать лишних сравнений 
// элементов; 2) досрочно завершить работу в цикле, как только найдется
// первая пара совпадающих строк; 3) goto, break, exit - не использовать
//=====================================================================
//  ТЕСТЫ, на которых сдавать задачу - см. в конце этой программы    
//=====================================================================

program task_1_var_2 (input,output);
const
    n = 6;
    m = 4;
type 
    matrix = array [1..n, 1..m] of integer;
    
{описание процедуры InputMatrix(A) для ввода матрицы А типа matrix:}    
procedure InputMatrix(var A:matrix);
var 
    i,j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do
            read(a[i,j]);
end;

{описание функции IsEqual(A) для проверки матрицы А типа matrix:} 
function IsEqual(var A:matrix):boolean;
var 
    flag: boolean;
    i,j,k,counter: integer;
begin
    flag := false;
    i := 1;
    while (i <= n-1) and not flag do begin
        k := i+1; 
        while (k <= n) and not flag do begin
            j := 1;
            counter := 0;
            flag := true;
            while (j <= m) and flag do begin
                flag := a[i,j] = a[k,j];
                j := j + 1;
            end;
            k := k + 1;
        end;
        i := i + 1
    end;
    IsEqual := flag;
end;

var
    A: matrix;

begin
    writeln('======================');
    writeln('Task_1_var_2 (IsEqual)');
    writeln('======================');
    writeln;
    
{применение InputMatrix(A) и IsEqual(A) для решения задачи:} 
    InputMatrix(A);
    writeln('answer: ', IsEqual(A));
    writeln;
    
end.
{ ТЕСТЫ, на которых надо сдавать эту задачу:

Test 1:
---------------------------------------------
matrix:

1 2 3 4
2 3 4 5
1 2 3 3
1 2 2 4
2 2 3 4
2 2 3 5

answer: FALSE
 
Test 2:
---------------------------------------------
matrix:

1 2 3 4
2 3 4 5
1 2 3 3
1 2 2 4
2 2 3 4
1 2 3 5
   
answer: FALSE
 
Test 3:
---------------------------------------------
matrix: 

1 2 3 4
2 2 2 2
3 3 3 3
4 4 4 4
5 5 5 5
1 2 3 4

answer: TRUE

Test 4:
---------------------------------------------
matrix:  
 
1 2 3 4
2 3 4 5
1 2 3 3
1 2 2 4
4 5 6 7
4 5 6 7

answer: TRUE

Test 5:
---------------------------------------------
matrix:  
 
1 2 3 3
1 2 3 4
3 4 5 6
3 4 5 5
2 2 3 4
3 4 5 6

answer: TRUE

}    
