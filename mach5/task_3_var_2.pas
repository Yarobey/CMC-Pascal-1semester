{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//=====================================================================
// ЗАДАЧА 3 (вариант 2) 20 очков 
//=====================================================================
(*
const n = 4 {число строк}; m = 5 {число столбцов}; 
type matrix = array[1..n, 1..m] of 1..100;
Ввести (c клавиатуры) целочисленную матрицу размером n x m. 
Определить, есть ли в этой матрице хотя бы один элемент, который бы 
находился одновременно во всех её строках. Если есть, то вывести на 
экран все такие элементы (в порядке их возрастания). 

Требования:  1) проверку матрицы осуществлять только после полного 
ввода элементов матрицы в память (то есть ввод – отдельно, проверка -
отдельно); 2) для проверки матрицы описать логическую функцию 
IsCommon(Х), которая за один просмотр матрицы Х  определяет, есть ли 
в ней хотя бы   один элемент, присутствующий в каждой её строке, и 
если есть, то в качестве побочного эффекта выводит на экран в порядке 
возрастания все найденные общие элементы. (Вспомогательные массивы, 
файлы  в решении не использовать; следует использовать множества.) 
3) Описать также процедуру InMatr(X) для ввода элементов матрицы.

В конце текста программы (после точки) размещены тестовые матрицы,
на которых будет проверяться работа вашей программы (не удалять их !)

Подсказка по реализации функции IsCommon: для поиска общих элементов 
по всем строкам завести два вспомогательных множества: S - множество
общих элементов по всем строкам, R - множество элементов в текущей 
проверяемой строке
*)
//=====================================================================

program Task_3_var_2(input,output);
const
    n = 4; {число строк}
    m = 5; {число столбцов}
type
    matrix = array[1..n, 1..m] of 1..100;
var
    X: matrix;
    
{здесь описание процедуры InMatr(X)}
procedure InMatr(var X: matrix);
var
    i, j: integer;
begin
    for i := 1 to n do
        for j := 1 to m do
            read(x[i,j]);
end;

{здесь описание булевской функции IsCommon(X)}
function IsCommon(x: matrix): boolean;
var
    s, r: set of 0..100;
    i, j: integer;
begin
    s := [];
    for j := 1 to m do
        s := s + [x[1,j]];
    i := 2;
    while (i <= n) and (s <> []) do begin
        r := [];
        for j := 1 to m do
             r := r + [x[i,j]];
        s := s * r;
        i := i + 1;
    end;
    if (s <> []) then begin
        for i := 1 to 100 do begin
            if i in s then begin
                write(i, ' ');
            end;
        end;
    end;
    if not (s <> []) then
        write('empty set', ' ');
    IsCommon := (s <> []);
end;

begin
{В этом разделе операторов НИЧЕГО НЕ МЕНЯТЬ И НИЧЕГО НЕ ДОБАВЛЯТЬ !!!}
    writeln('=======================');
    writeln('Task_3_var_2 (IsCommon)');
    writeln('=======================');
    writeln;
    writeln('Enter a ', n, ' x ', m,  ' matrix: ');
    InMatr(X);
    writeln('There are common elements:');
    writeln(IsCommon(X));
end.
{
test 1:

1  2  3  4  5 
2  3  4  5  6
3  4  5  6  7
8  7  6  5  4

Answer: 4 5
-----------------------------

test 2:

1   2  3  4   5
3   4  5  6   7
5   7  9 11  12
9  11 13 15  17

Answer: пустое множество
-----------------------------

test 3:

1  2  3  4  5
2  3  4  5  1
3  4  5  1  2
4  5  1  2  3
Answer: 1 2 3 4 5

}